CustomAbilityIcons = {}
CustomAbilityIcons.name = "CustomAbilityIcons"

------------------
-- Declarations --
------------------
local ADDON_VERSION = "0.1"
local SAVEDVARIABLES_VERSION = 1.1
local eso_root = "esoui/art/icons/"

CustomAbilityIcons.version = ADDON_VERSION

local MIN_INDEX = 3                          -- first ability index
local MAX_INDEX = 8                          -- last ability: 7, ultimate: 8
local SLOT_INDEX_OFFSET = 20                 -- offset for backbar abilities indices
local COMPANION_INDEX_OFFSET = 30            -- offset for companion ultimate

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
    
    local function replaceSkillIcons()
        for i = 1, #normal_skill_icons do
            for j = 1, #normal_skill_icons[i] do
                RedirectTexture(eso_root .. normal_skill_icons[i][j], eso_root .. styled_skill_icons[i][1])
            end
        end
    end
    
    if CustomAbilityIcons.SV.Replace_Skill_Icons == true then
        replaceSkillIcons()
    end
end

function CustomAbilityIcons.GetSkillStyleIcon(slotIndex)
    local abilityId = GetSlotBoundId(slotIndex)
    local progressionData = SKILLS_DATA_MANAGER:GetProgressionDataByAbilityId(abilityId)
	if (progressionData or 0) == 0 then
        return nil
    end
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

function CustomAbilityIcons.GetAbilityIcon(slotIndex)
	local abilityId = GetSlotBoundId(slotIndex)
	local actionType = GetSlotType(slotIndex)
	if actionType == ACTION_TYPE_CRAFTED_ABILITY then
	    abilityId = GetAbilityIdForCraftedAbilityId(abilityId)
	end
	return GetAbilityIcon(abilityId)
end

function CustomAbilityIcons.ReplaceAbilityBarIcon(slotIndex, icon)
    local btn = ZO_ActionBar_GetButton(slotIndex)
    if btn then
        btn.icon:SetTexture(icon)
    end
end

function CustomAbilityIcons.OnCollectibleUpdated(_, collectibleId)
	for index = MIN_INDEX, MAX_INDEX do
		local result = CustomAbilityIcons.GetSkillStyleIcon(index) or CustomAbilityIcons.GetAbilityIcon(index)
		if (result or "") ~= "" then
			CustomAbilityIcons.ReplaceAbilityBarIcon(index, result)
		end
	end
end

function CustomAbilityIcons.OnAddOnLoaded(eventCode, addOnName)
    if addOnName == CustomAbilityIcons.name then
        EVENT_MANAGER:RegisterForEvent(CustomAbilityIcons.name, EVENT_COLLECTIBLE_UPDATED, CustomAbilityIcons.OnCollectibleUpdated)
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
            local result = CustomAbilityIcons.GetSkillStyleIcon(index) or CustomAbilityIcons.GetAbilityIcon(index)
			
            if result then
                CustomAbilityIcons.ReplaceAbilityBarIcon(index, result)
            end
            CHAT_SYSTEM:AddMessage("Collectible Icon: " .. (result or 0))
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
