CustomAbilityIcons = {}
CustomAbilityIcons.name = "CustomAbilityIcons"

------------------
-- Declarations --
------------------
local ADDON_VERSION = "0.1"
local SAVEDVARIABLES_VERSION = 1
local eso_root = "esoui/art/icons/"

CustomAbilityIcons.version = ADDON_VERSION

local normal_skill_icons = {
    { "ability_destructionstaff_002.dds", "ability_destructionstaff_002a.dds", "ability_destructionstaff_002b.dds" }
}

local styled_skill_icons = {
    { "ability_destructionstaff_002_purple.dds" }
}

---------------
-- Functions --
---------------
function CustomAbilityIcons.Initialize()
    local function replaceSkillIcons()
        for i = 1, #normal_skill_icons do
            for j = 1, #normal_skill_icons[i] do
                RedirectTexture(eso_root .. normal_skill_icons[i][j], eso_root .. styled_skill_icons[i][1])
            end
        end
    end
    
    local defaults = {
        version = SAVEDVARIABLES_VERSION,
        Replace_Skill_Icons = true,
    }
    
    CustomAbilityIcons.SV = ZO_SavedVars:NewAccountWide("CustomAbilityIcons_SavedVariables", SAVEDVARIABLES_VERSION, nil, defaults)
    
    if CustomAbilityIcons.SV.Replace_Skill_Icons then
        replaceSkillIcons()
    end
end

function CustomAbilityIcons.OnAddOnLoaded(eventCode, addOnName)
    if addOnName == CustomAbilityIcons.name then
        -- Unregister the event as our addon was loaded and we do not need it to be run for every other addon that will load
        EVENT_MANAGER:UnregisterForEvent(CustomAbilityIcons.name, EVENT_ADD_ON_LOADED)

        SLASH_COMMANDS["/testmsg"] = function()
            local abilityId = GetSlotBoundId(slotIndex);
            CHAT_SYSTEM:AddMessage(abilityId);
        end
        
        CustomAbilityIcons.Initialize()
    end
end

----------
-- Main --
----------
EVENT_MANAGER:RegisterForEvent(CustomAbilityIcons.name, EVENT_ADD_ON_LOADED, CustomAbilityIcons.OnAddOnLoaded)
