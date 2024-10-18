CustomAbilityIcons = {}
CustomAbilityIcons.name = "CustomAbilityIcons"

------------------
-- Declarations --
------------------

local ADDON_VERSION = "0.1"
local SAVEDVARIABLES_VERSION = 1.1
local eso_root = "esoui/art/icons/"
local addon_root = "/CustomAbilityIcons/icons/"

CustomAbilityIcons.version = ADDON_VERSION

local MIN_INDEX = 3                          -- first ability index
local MAX_INDEX = 8                          -- last ability: 7, ultimate: 8
local SLOT_INDEX_OFFSET = 20                 -- offset for backbar abilities indices
local COMPANION_INDEX_OFFSET = 30            -- offset for companion ultimate

local ELEMENTAL_EXPLOSION_ABILITYID = 217228
local MENDERS_BOND_ABILITYID = 220549
local SHIELD_THROW_ABILITYID = 222966
local SMASH_ABILITYID = 217184
local SOUL_BURST_ABILITYID = 217459
local TORCHBEARER_ABILITYID = 217607
local TRAMPLE_ABILITYID = 217663
local TRAVELING_KNIFE_ABILITYID = 217872
local ULFSILDS_CONTINGENCY_ABILITYID = 222678
local VAULT_ABILITYID = 214960
local WIELD_SOUL_ABILITYID = 215731
local FLAME = "flame"
local FROST = "frost"
local SHOCK = "shock"
local MAGIC = "magic"
local HEAL = "heal"
local RESOURCES = "resources"
local ULTIMATE = "ultimate"
local DISPEL = "dispel"
local SHIELD = "shield"
local PHYSICAL = "physical"
local BLEED = "bleed"
local TRAUMA = "trauma"
local POISON = "poison"
local DISEASE = "disease"
local DEFAULT = "default"

local custom_ability_icons = {
    [ELEMENTAL_EXPLOSION_ABILITYID] = {
        [FLAME] = eso_root .. "ability_grimoire_staffdestro.dds",
        [FROST] = addon_root .. "ability_grimoire_staffdestro_frost.dds",
        [SHOCK] = addon_root .. "ability_grimoire_staffdestro_shock.dds",
        [MAGIC] = addon_root .. "ability_grimoire_staffdestro_magic.dds",
        [DISPEL] = addon_root .. "ability_grimoire_staffdestro_magic.dds",
        [DEFAULT] = addon_root .. "ability_grimoire_staffdestro_physical.dds"
    },
    [MENDERS_BOND_ABILITYID] = {
        [MAGIC] = addon_root .. "ability_grimoire_staffresto_magic.dds",
        [RESOURCES] = addon_root .. "ability_grimoire_staffresto_resources.dds",
        [SHIELD] = addon_root .. "ability_grimoire_staffresto_shield.dds",
        [DEFAULT] = eso_root .. "ability_grimoire_staffresto.dds"
    },
    [SHIELD_THROW_ABILITYID] = {
        [FROST] = addon_root .. "ability_grimoire_1handed_frost.dds",
        [MAGIC] = addon_root .. "ability_grimoire_1handed_magic.dds",
        [DEFAULT] = eso_root .. "ability_grimoire_1handed.dds"
    },
    [SMASH_ABILITYID] = {
        [MAGIC] = addon_root .. "ability_grimoire_2handed_magic.dds",
        [HEAL] = addon_root .. "ability_grimoire_2handed_heal.dds",
        [SHIELD] = addon_root .. "ability_grimoire_2handed_shield.dds",
        [BLEED] = addon_root .. "ability_grimoire_2handed_bleed.dds",
        [DEFAULT] = eso_root .. "ability_grimoire_2handed.dds"
    },
    [SOUL_BURST_ABILITYID] = {
        [FROST] = addon_root .. "ability_grimoire_soulmagic2_frost.dds",
        [SHOCK] = addon_root .. "ability_grimoire_soulmagic2_shock.dds",
        [MAGIC] = eso_root .. "ability_grimoire_soulmagic2.dds",
        [HEAL] = addon_root .. "ability_grimoire_soulmagic2_heal.dds",
        [SHIELD] = addon_root .. "ability_grimoire_soulmagic2_shield.dds",
        [DEFAULT] = addon_root .. "ability_grimoire_soulmagic2_physical.dds"
    },
    [TORCHBEARER_ABILITYID] = {
        [FLAME] = eso_root .. "ability_grimoire_fightersguild.dds",
        [FROST] = addon_root .. "ability_grimoire_fightersguild_frost.dds",
        [HEAL] = addon_root .. "ability_grimoire_fightersguild_heal.dds",
        [ULTIMATE] = addon_root .. "ability_grimoire_fightersguild_ultimate.dds",
        [BLEED] = addon_root .. "ability_grimoire_fightersguild_bleed.dds",
        [DEFAULT] = addon_root .. "ability_grimoire_fightersguild_physical.dds"
    },
    [TRAMPLE_ABILITYID] = {
        [MAGIC] = addon_root .. "ability_grimoire_assault_magic.dds",
        [DISPEL] = addon_root .. "ability_grimoire_assault_dispel.dds",
        [PHYSICAL] = addon_root .. "ability_grimoire_assault_physical.dds",
        [TRAUMA] = addon_root .. "ability_grimoire_assault_trauma.dds",
        [DISEASE] = addon_root .. "ability_grimoire_assault_disease.dds",
        [DEFAULT] = eso_root .. "ability_grimoire_assault.dds"
    },
    [TRAVELING_KNIFE_ABILITYID] = {
        [MAGIC] = addon_root .. "ability_grimoire_dualwield_magic.dds",
        [BLEED] = addon_root .. "ability_grimoire_dualwield_bleed.dds",
        [POISON] = addon_root .. "ability_grimoire_dualwield_poison.dds",
        [DEFAULT] = eso_root .. "ability_grimoire_dualwield.dds"
    },
    [ULFSILDS_CONTINGENCY_ABILITYID] = {
        [FLAME] = addon_root .. "ability_grimoire_magesguild_flame.dds",
        [FROST] = addon_root .. "ability_grimoire_magesguild_frost.dds",
        [MAGIC] = addon_root .. "ability_grimoire_magesguild_magic.dds",
        [DEFAULT] = addon_root .. "ability_grimoire_magesguild_heal.dds"
    },
    [VAULT_ABILITYID] = {
        [FLAME] = addon_root .. "ability_grimoire_bow_fire.dds",
        [HEAL] = addon_root .. "ability_grimoire_bow_heal.dds",
        [POISON] = addon_root .. "ability_grimoire_bow_poison.dds",
        [DISEASE] = addon_root .. "ability_grimoire_bow_poison.dds",
        [DEFAULT] = eso_root .. "ability_grimoire_bow.dds"
    },
    [WIELD_SOUL_ABILITYID] = {
        [FROST] = addon_root .. "ability_grimoire_soulmagic1_frost.dds",
        [SHOCK] = addon_root .. "ability_grimoire_soulmagic1_shock.dds",
        [MAGIC] = eso_root .. "ability_grimoire_soulmagic1.dds",
        [HEAL] = addon_root .. "ability_grimoire_soulmagic1_heal.dds",
        [SHIELD] = addon_root .. "ability_grimoire_soulmagic1_shield.dds",
        [DEFAULT] = addon_root .. "ability_grimoire_soulmagic1_physical.dds"
    }
}

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

--- Retrieves the path of the selected collectible icon for the skill found in the specified slotIndex.
--- @param slotIndex number The index of a given skill in the action bar.
--- @param inactiveHotbarCategory number? If nil is passed, the active hotbar will be used. If it has a value, it is the category of the inactive hotbar.
--- @return string? collectibleIcon The path of the icon that corresponds to the selected skill style for the requested skill. If no skill style is selected, nil will be returned.
function CustomAbilityIcons.GetSkillStyleIcon(slotIndex, inactiveHotbarCategory)
    inactiveHotbarCategory = inactiveHotbarCategory or GetActiveHotbarCategory()
    local abilityId = CustomAbilityIcons.GetAbilityId(slotIndex, inactiveHotbarCategory)
    if (abilityId or 0) == 0 then
        return nil
    end
    local baseAbilityId = CustomAbilityIcons.GetBaseAbilityId(slotIndex, inactiveHotbarCategory)

    local skillType, skillLineIndex, skillIndex = GetSpecificSkillAbilityKeysByAbilityId(baseAbilityId)
    local progressionId = GetProgressionSkillProgressionId(skillType, skillLineIndex, skillIndex)
    local collectibleId = GetActiveProgressionSkillAbilityFxOverrideCollectibleId(progressionId)
    if (collectibleId or 0) == 0 then
        return nil
    end
    return GetCollectibleIcon(collectibleId)
end

--- Retrieves the icon path of the skill found in the specified slotIndex.
--- @param slotIndex number The index of a given skill in the action bar.
--- @param inactiveHotbarCategory number? If nil is passed, the active hotbar will be used. If it has a value, it is the category of the inactive hotbar.
--- @return string? abilityIcon The path of the icon that corresponds to the skill in question.
function CustomAbilityIcons.GetDefaultAbilityIcon(slotIndex, inactiveHotbarCategory)
    local abilityId = CustomAbilityIcons.GetAbilityId(slotIndex, inactiveHotbarCategory)
    if (abilityId or 0) == 0 then
        return nil
    end
    local actionType = GetSlotType(slotIndex, inactiveHotbarCategory)
    if actionType == ACTION_TYPE_CRAFTED_ABILITY then
        abilityId = GetAbilityIdForCraftedAbilityId(abilityId)
    end
    return GetAbilityIcon(abilityId)
end

--- Retrieves the custom made icons for crafted abilities.
--- @param slotIndex number The index of a given skill in the action bar.
--- @param inactiveHotbarCategory number? If nil is passed, the active hotbar will be used. If it has a value, it is the category of the inactive hotbar.
--- @return string? abilityIcon The path of the icon to be applied to the skill in question.
function CustomAbilityIcons.GetCustomAbilityIcon(slotIndex, inactiveHotbarCategory)
    local abilityId = CustomAbilityIcons.GetAbilityId(slotIndex, inactiveHotbarCategory)
    if (abilityId or 0) == 0 then
        return nil
    end
    local baseAbilityId = CustomAbilityIcons.GetBaseAbilityId(slotIndex, inactiveHotbarCategory)
    if (baseAbilityId or 0) == 0 then
        return nil
    end

    local primaryScriptId, secondaryScriptId, tertiaryScriptId = GetCraftedAbilityActiveScriptIds(abilityId)
    if primaryScriptId ~= 0 then
        local scriptName = GetCraftedAbilityScriptDisplayName(primaryScriptId)
        --- @diagnostic disable-next-line: param-type-mismatch
        return MapScriptToIcon(scriptName, baseAbilityId)
    end
end

--- Maps the given scriptName and abilityId to their corresponding custom icon.
--- @param scriptName string The name of the focus script on which to apply the icon.
--- @param baseAbilityId number The base ability id to which the script has been applied.
--- @return string? abilityIcon The path of the icon to be applied to the skill in question.
function MapScriptToIcon(scriptName, baseAbilityId)
    if custom_ability_icons[baseAbilityId] ~= nil then
        for key,value in pairs(custom_ability_icons[baseAbilityId]) do
            if string.find(string.lower(scriptName), key) then
                return value
            end
        end

        return custom_ability_icons[baseAbilityId][DEFAULT]
    end
end

--- Retrieves the base ability id of the skill with the specified ability id. For skills without progression or
--- morph data the provided ability id will be returned.
--- @param slotIndex number The index of a given skill in the action bar.
--- @param inactiveHotbarCategory number? If nil is passed, the active hotbar will be used. If it has a value, it is the category of the inactive hotbar.
--- @return number? baseAbilityId The base ability id of the specified skill, or the provided ability id for skills with no base morph.
function CustomAbilityIcons.GetBaseAbilityId(slotIndex, inactiveHotbarCategory)
    inactiveHotbarCategory = inactiveHotbarCategory or GetActiveHotbarCategory()
    local abilityId = CustomAbilityIcons.GetAbilityId(slotIndex, inactiveHotbarCategory)
    local actionType = GetSlotType(slotIndex, inactiveHotbarCategory)
    if actionType == ACTION_TYPE_CRAFTED_ABILITY then
        return GetAbilityIdForCraftedAbilityId(abilityId)
    end

    local progressionData = SKILLS_DATA_MANAGER:GetProgressionDataByAbilityId(abilityId)
    if (progressionData or 0) == 0 then
        return abilityId
    end
    local skillData = progressionData:GetSkillData()
    if (skillData.GetMorphData or 0) == 0 then
        return abilityId
    end
    local baseMorphData = skillData:GetMorphData(MORPH_SLOT_BASE)
    return baseMorphData:GetAbilityId()
end

--- Retrieves the ability id of the skill found in the specified slotIndex.
--- @param slotIndex number The index of a given skill in the action bar.
--- @param inactiveHotbarCategory number? If nil is passed, the active hotbar will be used. If it has a value, it is the category of the inactive hotbar.
--- @return number? abilityId The ability id that corresponds to the skill in question.
function CustomAbilityIcons.GetAbilityId(slotIndex, inactiveHotbarCategory)
    local index = tonumber(slotIndex) or 0
    if index < MIN_INDEX
       or (index > MAX_INDEX and index < SLOT_INDEX_OFFSET + MIN_INDEX)
       or index > SLOT_INDEX_OFFSET + MAX_INDEX
    then
        return nil
    end

    inactiveHotbarCategory = inactiveHotbarCategory or GetActiveHotbarCategory()
    return GetSlotBoundId(slotIndex, inactiveHotbarCategory)
end

--- Calls SetTexture to replace the icon of the skill found in the specified slotIndex.
--- Needs to be called from multiple events.
--- @param slotIndex number The index of a given skill in the action bar.
--- @param inactiveHotbarCategory number? If nil is passed, the active hotbar will be used. If it has a value, it is the category of the inactive hotbar.
--- @param icon string The path of the icon that will be assigned to the skill in question.
function CustomAbilityIcons.ReplaceAbilityBarIcon(slotIndex, inactiveHotbarCategory, icon)
    local btn = ZO_ActionBar_GetButton(slotIndex, inactiveHotbarCategory)
    if btn then
        local btnIcon = btn.icon
        if btnIcon then
            btnIcon:SetTexture(icon)
        end
    end
end

--- Retrieves the active skill style for the skill found in the specified slotIndex and applies it
--- to the corresponding slot on the action bar.
--- @param slotIndex number The index of a given skill in the action bar.
--- @param inactiveHotbarCategory number? If nil is passed, the active hotbar will be used. If it has a value, it is the category of the inactive hotbar.
function CustomAbilityIcons.ApplySkillStyle(slotIndex, inactiveHotbarCategory)
    local icon = CustomAbilityIcons.GetSkillStyleIcon(slotIndex, inactiveHotbarCategory)
                 or CustomAbilityIcons.GetCustomAbilityIcon(slotIndex, inactiveHotbarCategory)
                 or CustomAbilityIcons.GetDefaultAbilityIcon(slotIndex, inactiveHotbarCategory)
    if (icon or "") ~= "" then
        --- @diagnostic disable-next-line: param-type-mismatch
        CustomAbilityIcons.ReplaceAbilityBarIcon(slotIndex, inactiveHotbarCategory, icon)
    end
end

------------
-- Events --
------------

--- To be used in any event when the skill icons need to be refreshed.
--- @param _ any
--- @param collectibleId any
function CustomAbilityIcons.OnCollectibleUpdated(_, collectibleId)
    for index = MIN_INDEX, MAX_INDEX do
        local inactiveBar = currentHotbarCategory == HOTBAR_CATEGORY_PRIMARY
                            and HOTBAR_CATEGORY_BACKUP or HOTBAR_CATEGORY_PRIMARY;

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
