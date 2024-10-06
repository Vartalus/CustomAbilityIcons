local function ChangeAbilityIcon()
	local abilityId = GetSlotBoundId(slotIndex);
	SLASH_COMMANDS["/testmsg"] = function()
		CHAT_SYSTEM:AddMessage(abilityId);
	end
    -- Replace the texture path with the path to your new icon
    local newIconPath = "/esoui/art/icons/ability_destructionstaff_002_purple.dds"
    -- Replace the texture path of the Wall of Elements ability
    RedirectTexture("/esoui/art/icons/ability_destructionstaff_003_a.dds", newIconPath)
end

-- Register the function to be called when the addon is loaded
EVENT_MANAGER:RegisterForEvent("ChangeAbilityIcons", EVENT_ADD_ON_LOADED, ChangeAbilityIcon)