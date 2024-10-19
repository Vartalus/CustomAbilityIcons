CustomAbilityIcons = {}

--- @class (partial) CustomAbilityIcons
local CustomAbilityIcons = CustomAbilityIcons

------------------
-- Declarations --
------------------

local ADDON_VERSION = "0.1"
local SAVEDVARIABLES_VERSION = 1.1

CustomAbilityIcons.version = ADDON_VERSION
CustomAbilityIcons.name = "CustomAbilityIcons"

---------------
-- Functions --
---------------

--- Initializes the saved variables and replaces skill icons, if the saved variables dictate it.
function CustomAbilityIcons.Initialize()
    local defaults = {
        --Icon = GetString(CUSTOM_ABILITY_ICONS),
        version = SAVEDVARIABLES_VERSION,
        Replace_Skill_Icons = false,
    }

    CustomAbilityIcons.SV = ZO_SavedVars:NewAccountWide("CustomAbilityIcons_SavedVariables", SAVEDVARIABLES_VERSION, nil, defaults)
    local sv = CustomAbilityIcons_SavedVariables["Default"][GetDisplayName()]["$AccountWide"]
    -- Clean up leftover saved variables (from previous versions)
    for key, _ in pairs(sv) do
        -- Delete key-value pair if the key can't also be found in the default settings (except for version)
        if key ~= "version" and defaults[key] == nil then
            sv[key] = nil
        end
    end
end

------------
-- Events --
------------

--- To be used in any event when the skill icons need to be refreshed.
--- @param _ any
--- @param collectibleId any
function CustomAbilityIcons.OnCollectibleUpdated(_, collectibleId)
    for index = CustomAbilityIcons.MIN_INDEX, CustomAbilityIcons.MAX_INDEX do
        local inactiveBar = currentHotbarCategory == HOTBAR_CATEGORY_PRIMARY
                            and HOTBAR_CATEGORY_BACKUP or HOTBAR_CATEGORY_PRIMARY

        CustomAbilityIcons.ApplySkillStyle(index, nil)
        CustomAbilityIcons.ApplySkillStyle(index, inactiveBar)
    end
end

--- Local alias for GetSlotTexture, introduced to avoid overflowing the stack due to mutual recursion between
--- GetSlotTexture and its SecurePostHook.
local originalGetSlotTexture = GetSlotTexture
SecurePostHook("GetSlotTexture", function(slotIndex, hotbarCategory)
    if hotbarCategory then
        local newIcon = CustomAbilityIcons.GetSkillStyleIcon(slotIndex, hotbarCategory)
                        or CustomAbilityIcons.GetCustomAbilityIcon(slotIndex, hotbarCategory)
        local icon, weaponIcon, activationAnimation = originalGetSlotTexture(slotIndex, hotbarCategory)
        if newIcon then
            icon = newIcon
        end
        return icon, weaponIcon, activationAnimation
    else
        return originalGetSlotTexture(slotIndex, hotbarCategory)
    end
end)

--- To be used during game initialization. Code contained in this method needs to run conditionally, for this addon only.
--- @param eventCode any
--- @param addOnName any
function CustomAbilityIcons.OnAddOnLoaded(eventCode, addOnName)
    if addOnName == CustomAbilityIcons.name then
        EVENT_MANAGER:RegisterForEvent(CustomAbilityIcons.name, EVENT_COLLECTIBLE_UPDATED, CustomAbilityIcons.OnCollectibleUpdated)

        -- Unregister the event as our addon was loaded and we do not need it to be run for every other addon that will load
        EVENT_MANAGER:UnregisterForEvent(CustomAbilityIcons.name, EVENT_ADD_ON_LOADED)

        SLASH_COMMANDS["/getabilitydetails"] = function(skillIndex)
            local baseAbilityId = CustomAbilityIcons.GetBaseAbilityId(skillIndex, nil)
            CHAT_SYSTEM:AddMessage("Base Ability ID: " .. (baseAbilityId or -1))
            local abilityId = CustomAbilityIcons.GetAbilityId(skillIndex, nil)
            CHAT_SYSTEM:AddMessage("Ability ID: " .. (abilityId or -1))

            local primaryScriptId, secondaryScriptId, tertiaryScriptId = GetCraftedAbilityActiveScriptIds(abilityId)
            local scriptLink = ""
            if primaryScriptId ~= 0 or secondaryScriptId ~= 0 or tertiaryScriptId ~= 0 then
                CHAT_SYSTEM:AddMessage("Focus Script: " .. GetCraftedAbilityScriptDisplayName(primaryScriptId) .. "(" .. primaryScriptId .. ")")
                CHAT_SYSTEM:AddMessage("Signature Script: " .. GetCraftedAbilityScriptDisplayName(secondaryScriptId) .. "(" .. secondaryScriptId .. ")")
                CHAT_SYSTEM:AddMessage("Affix Script: " .. GetCraftedAbilityScriptDisplayName(tertiaryScriptId) .. "(" .. tertiaryScriptId .. ")")
                if primaryScriptId ~= 0 and secondaryScriptId ~= 0 and tertiaryScriptId ~= 0 then
                    scriptLink = ZO_LinkHandler_CreateChatLink(GetCraftedAbilityLink, abilityId, primaryScriptId, secondaryScriptId, tertiaryScriptId)
                    CHAT_SYSTEM:AddMessage("Scribed Skill Link: " .. scriptLink)
                end
            end
        end

        SLASH_COMMANDS["/geticons"] = function(skillIndex)
            local collectibleIcon = CustomAbilityIcons.GetSkillStyleIcon(skillIndex, nil)
            CHAT_SYSTEM:AddMessage("Collectible Icon: " .. (collectibleIcon or "nil"))
            local customIcon = CustomAbilityIcons.GetCustomAbilityIcon(skillIndex, nil)
            CHAT_SYSTEM:AddMessage("Custom Icon: " .. (customIcon or "nil"))
            local abilityIcon = CustomAbilityIcons.GetDefaultAbilityIcon(skillIndex, nil)
            CHAT_SYSTEM:AddMessage("Default Icon: " .. (abilityIcon or "nil"))
        end

        SLASH_COMMANDS["/refreshsavedvars"] = function ()
            local sv = CustomAbilityIcons_SavedVariables["Default"][GetDisplayName()]["$AccountWide"]
            for key, _ in pairs(sv) do
                sv[key] = nil
            end

            CustomAbilityIcons.Initialize()
        end

        CustomAbilityIcons.Initialize()
    end
end


----------
-- Main --
----------

EVENT_MANAGER:RegisterForEvent(CustomAbilityIcons.name, EVENT_ADD_ON_LOADED, CustomAbilityIcons.OnAddOnLoaded)
