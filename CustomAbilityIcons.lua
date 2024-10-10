CustomAbilityIcons = {}
CustomAbilityIcons.name = "CustomAbilityIcons"

------------------
-- Declarations --
------------------
local ADDON_VERSION = "0.1"
local SAVEDVARIABLES_VERSION = 1
local eso_root = "esoui/art/icons/"

CustomAbilityIcons.version = ADDON_VERSION

local MIN_INDEX = 3;                          -- first ability index
local MAX_INDEX = 8;                          -- last ability: 7, ultimate: 8
local SLOT_INDEX_OFFSET = 20;                 -- offset for backbar abilities indices
local COMPANION_INDEX_OFFSET = 30;            -- offset for companion ultimate

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

function CustomAbilityIcons.GetSkillStyleIcon(slotIndex)
    local abilityId = GetSlotBoundId(slotIndex)
    local progressionData = SKILLS_DATA_MANAGER:GetProgressionDataByAbilityId(abilityId)
    local skillData = progressionData:GetSkillData()
    local baseMorphData = skillData:GetMorphData(MORPH_SLOT_BASE)
    local baseAbilityId = baseMorphData:GetAbilityId()
    local skillType, skillLineIndex, skillIndex = GetSpecificSkillAbilityKeysByAbilityId(baseAbilityId)
    local progressionId = GetProgressionSkillProgressionId(skillType, skillLineIndex, skillIndex)
    local collectibleId = GetActiveProgressionSkillAbilityFxOverrideCollectibleId(progressionId)
    if (collectibleId or 0) == 0 then
        return nil
    end
    local collectibleIcon = GetCollectibleIcon(collectibleId)
    return collectibleIcon
end

function CustomAbilityIcons.OnAddOnLoaded(eventCode, addOnName)
    if addOnName == CustomAbilityIcons.name then
        -- Unregister the event as our addon was loaded and we do not need it to be run for every other addon that will load
        EVENT_MANAGER:UnregisterForEvent(CustomAbilityIcons.name, EVENT_ADD_ON_LOADED)

        SLASH_COMMANDS["/geticon"] = function(skillIndex)
            local index = tonumber(skillIndex) or 0
            if index < MIN_INDEX
               or (index > MAX_INDEX and index < SLOT_INDEX_OFFSET + MIN_INDEX)
               or index > SLOT_INDEX_OFFSET + MAX_INDEX
            then
                index = 5
            end
            local result = CustomAbilityIcons.GetSkillStyleIcon(index);
            CHAT_SYSTEM:AddMessage("Collectible Icon: " .. (result or 0));
        end
        
        CustomAbilityIcons.Initialize()
    end
end

----------
-- Main --
----------
EVENT_MANAGER:RegisterForEvent(CustomAbilityIcons.name, EVENT_ADD_ON_LOADED, CustomAbilityIcons.OnAddOnLoaded)
