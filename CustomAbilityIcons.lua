CustomAbilityIcons = {}

--- @class (partial) CustomAbilityIcons
local CustomAbilityIcons = CustomAbilityIcons

------------------
-- Declarations --
------------------

local ADDON_VERSION = "1.0"

CustomAbilityIcons.version = ADDON_VERSION
CustomAbilityIcons.name = "CustomAbilityIcons"

---------------
-- Functions --
---------------

--- Initializes the saved variables and replaces low quality skill icons, if the saved variables dictate it.
function CustomAbilityIcons.Initialize()
    CustomAbilityIcons.InitializeSettings()
    CustomAbilityIcons.ReplaceLowQualityIcons()
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

        CustomAbilityIcons.CreateSlashCommands()
        CustomAbilityIcons.Initialize()
    end
end

----------
-- Main --
----------

EVENT_MANAGER:RegisterForEvent(CustomAbilityIcons.name, EVENT_ADD_ON_LOADED, CustomAbilityIcons.OnAddOnLoaded)
