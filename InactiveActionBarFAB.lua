--- @class (partial) CustomAbilityIcons
local CustomAbilityIcons = CustomAbilityIcons

local FAB = FancyActionBar

--- Retrieves the active skill style for the skill found in the specified slotIndex and applies it
--- to the corresponding slot on the inactive action bar. Will only work if FancyActionBar+ is available.
--- @param slotIndex number The index of a given skill in the action bar.
--- @param hotbarCategory number The category of the hotbar in question.
function CustomAbilityIcons.ApplySkillStyleInactiveFAB(slotIndex, hotbarCategory)
    if FAB then
        local icon = CustomAbilityIcons.GetSkillStyleIcon(slotIndex, hotbarCategory)
                     or CustomAbilityIcons.GetCustomAbilityIcon(slotIndex, hotbarCategory)
                     or CustomAbilityIcons.GetDefaultAbilityIcon(slotIndex, hotbarCategory)
        if (icon or "") ~= "" then
            slotIndex = slotIndex + CustomAbilityIcons.SLOT_INDEX_OFFSET
            --- @diagnostic disable-next-line: param-type-mismatch
            CustomAbilityIcons.ReplaceAbilityBarIcon(slotIndex, hotbarCategory, icon)
        end
    end
end

--- Retrieves the inactive action bar button corresponding to the specified slotIndex, provided that
--- FancyActionBar+ is available.
--- @param slotIndex number The index of a given skill in the action bar.
--- @return any btn The inactive bar button correspondign to the specified slotIndex.
function CustomAbilityIcons.GetInactiveBarButtonFAB(slotIndex)
    if FAB and FAB.buttons
       and slotIndex >= CustomAbilityIcons.SLOT_INDEX_OFFSET + CustomAbilityIcons.MIN_INDEX
       and slotIndex <= CustomAbilityIcons.SLOT_INDEX_OFFSET + CustomAbilityIcons.MAX_INDEX
    then
        return FAB.buttons[slotIndex]
    else
        return nil
    end
end
