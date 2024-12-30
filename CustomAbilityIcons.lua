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

--- Initializes the saved variables and replaces mismatched base skill icons, if the saved variables dictate it.
function CustomAbilityIcons.Initialize()
    CustomAbilityIcons.InitializeSettings()
    CustomAbilityIcons.ReplaceMismatchedIcons()
end

------------
-- Events --
------------

--- Triggered when the player switches hotbars, after the "GetSlotTexture" SecurePostHook.
--- @param _ any
--- @param slotIndex number The index of a given skill in the action bar.
--- @param hotbarCategory number The category of the hotbar that triggered the event.
function CustomAbilityIcons.OnHotbarSlotStateUpdated(_, slotIndex, hotbarCategory)
    CustomAbilityIcons.ApplySkillStyle(slotIndex, hotbarCategory)
end

--- To be used in any event when the skill icons need to be refreshed.
--- @param _ any
--- @param collectibleId any
function CustomAbilityIcons.OnCollectibleUpdated(_, collectibleId)
    local activeHotbarCategory = GetActiveHotbarCategory()
    for index = CustomAbilityIcons.MIN_INDEX, CustomAbilityIcons.MAX_INDEX do
        CustomAbilityIcons.ApplySkillStyle(index, activeHotbarCategory)
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
        EVENT_MANAGER:RegisterForEvent(CustomAbilityIcons.name, EVENT_HOTBAR_SLOT_STATE_UPDATED, CustomAbilityIcons.OnHotbarSlotStateUpdated)

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
