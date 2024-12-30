--- @class (partial) CustomAbilityIcons
local CustomAbilityIcons = CustomAbilityIcons

--- Retrieves the base ability id of the skill with the specified ability id. For skills without progression or
--- morph data the provided ability id will be returned.
--- @param slotIndex number The index of a given skill in the action bar.
--- @param hotbarCategory number The category of the hotbar in question.
--- @return number? baseAbilityId The base ability id of the specified skill, or the provided ability id for skills with no base morph.
function CustomAbilityIcons.GetBaseAbilityId(slotIndex, hotbarCategory)
    local abilityId = CustomAbilityIcons.GetAbilityId(slotIndex, hotbarCategory)
    local actionType = GetSlotType(slotIndex, hotbarCategory)
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
--- @param hotbarCategory number The category of the hotbar in question.
--- @return number? abilityId The ability id that corresponds to the skill in question.
function CustomAbilityIcons.GetAbilityId(slotIndex, hotbarCategory)
    local index = tonumber(slotIndex) or 0
    if index < CustomAbilityIcons.MIN_INDEX
       or (index > CustomAbilityIcons.MAX_INDEX and index < CustomAbilityIcons.SLOT_INDEX_OFFSET + CustomAbilityIcons.MIN_INDEX)
       or index > CustomAbilityIcons.SLOT_INDEX_OFFSET + CustomAbilityIcons.MAX_INDEX
    then
        return nil
    end

    return GetSlotBoundId(slotIndex, hotbarCategory)
end

--- Retrieves the path of the selected collectible icon for the skill found in the specified slotIndex.
--- @param slotIndex number The index of a given skill in the action bar.
--- @param hotbarCategory number The category of the hotbar in question.
--- @return string? collectibleIcon The path of the icon that corresponds to the selected skill style for the requested skill. If no skill style is selected, nil will be returned.
function CustomAbilityIcons.GetSkillStyleIcon(slotIndex, hotbarCategory)
    if not CustomAbilityIcons.GetSettings().showSkillStyleIcons then return nil end

    local abilityId = CustomAbilityIcons.GetAbilityId(slotIndex, hotbarCategory)
    if (abilityId or 0) == 0 then
        return nil
    end
    local baseAbilityId = CustomAbilityIcons.GetBaseAbilityId(slotIndex, hotbarCategory)

    local skillType, skillLineIndex, skillIndex = GetSpecificSkillAbilityKeysByAbilityId(baseAbilityId)
    local progressionId = GetProgressionSkillProgressionId(skillType, skillLineIndex, skillIndex)
    local collectibleId = GetActiveProgressionSkillAbilityFxOverrideCollectibleId(progressionId)
    if (collectibleId or 0) == 0 then
        return nil
    end
    return GetCollectibleIcon(collectibleId)
end

--- Retrieves the custom made icons for crafted abilities.
--- @param slotIndex number The index of a given skill in the action bar.
--- @param hotbarCategory number The category of the hotbar in question.
--- @return string? abilityIcon The path of the icon to be applied to the skill in question.
function CustomAbilityIcons.GetCustomAbilityIcon(slotIndex, hotbarCategory)
    if not CustomAbilityIcons.GetSettings().showCustomScribeIcons then return nil end

    local abilityId = CustomAbilityIcons.GetAbilityId(slotIndex, hotbarCategory)
    if (abilityId or 0) == 0 then
        return nil
    end
    local baseAbilityId = CustomAbilityIcons.GetBaseAbilityId(slotIndex, hotbarCategory)
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

--- Retrieves the icon path of the skill found in the specified slotIndex.
--- @param slotIndex number The index of a given skill in the action bar.
--- @param hotbarCategory number The category of the hotbar in question.
--- @return string? abilityIcon The path of the icon that corresponds to the skill in question.
function CustomAbilityIcons.GetDefaultAbilityIcon(slotIndex, hotbarCategory)
    local abilityId = CustomAbilityIcons.GetAbilityId(slotIndex, hotbarCategory)
    if (abilityId or 0) == 0 then
        return nil
    end
    local actionType = GetSlotType(slotIndex, hotbarCategory)
    if actionType == ACTION_TYPE_CRAFTED_ABILITY then
        abilityId = GetAbilityIdForCraftedAbilityId(abilityId)
    end
    return GetAbilityIcon(abilityId)
end

--- Maps the given scriptName and abilityId to their corresponding custom icon.
--- @param scriptName string The name of the focus script on which to apply the icon.
--- @param baseAbilityId number The base ability id to which the script has been applied.
--- @return string? abilityIcon The path of the icon to be applied to the skill in question.
function MapScriptToIcon(scriptName, baseAbilityId)
    if CustomAbilityIcons.CUSTOM_ABILITY_ICONS[baseAbilityId] ~= nil then
        for key,value in pairs(CustomAbilityIcons.CUSTOM_ABILITY_ICONS[baseAbilityId]) do
            if string.find(string.lower(scriptName), key) then
                return value
            end
        end

        return CustomAbilityIcons.CUSTOM_ABILITY_ICONS[baseAbilityId][CustomAbilityIcons.DEFAULT]
    end
end

--- Retrieves the active skill style for the skill found in the specified slotIndex and applies it
--- to the corresponding slot on the action bar.
--- @param slotIndex number The index of a given skill in the action bar.
--- @param hotbarCategory number The category of the hotbar in question.
function CustomAbilityIcons.ApplySkillStyle(slotIndex, hotbarCategory)
    local icon = CustomAbilityIcons.GetSkillStyleIcon(slotIndex, hotbarCategory)
                 or CustomAbilityIcons.GetCustomAbilityIcon(slotIndex, hotbarCategory)
                 or CustomAbilityIcons.GetDefaultAbilityIcon(slotIndex, hotbarCategory)
    if (icon or "") ~= "" then
        --- @diagnostic disable-next-line: param-type-mismatch
        CustomAbilityIcons.ReplaceAbilityBarIcon(slotIndex, hotbarCategory, icon)
    end
end

--- Calls SetTexture to replace the icon of the skill found in the specified slotIndex.
--- Needs to be called from multiple events.
--- @param slotIndex number The index of a given skill in the action bar.
--- @param hotbarCategory number The category of the hotbar in question.
--- @param icon string The path of the icon that will be assigned to the skill in question.
function CustomAbilityIcons.ReplaceAbilityBarIcon(slotIndex, hotbarCategory, icon)
    local btn = ZO_ActionBar_GetButton(slotIndex, hotbarCategory)
    if btn then
        local btnIcon = btn.icon
        if btnIcon then
            btnIcon:SetTexture(icon)
        end
    end
end

--- Calls RedirectTexture to replace an existing skill icon with a different one.
function CustomAbilityIcons.ReplaceMismatchedIcons()
    for key, value in pairs(CustomAbilityIcons.BASE_GAME_ICONS_TO_REPLACE) do
        if CustomAbilityIcons.GetSettings().replaceMismatchedBaseIcons then
            RedirectTexture(key, value)
        else
            RedirectTexture(key, key)
        end
    end
end
