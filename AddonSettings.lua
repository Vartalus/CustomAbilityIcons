--- @class (partial) CustomAbilityIcons
local CustomAbilityIcons = CustomAbilityIcons

local LAM2 = LibAddonMenu2

--- Retrieves the saved settings, whether global or per character (and the default settings if nothing was previously saved).
function CustomAbilityIcons.GetSettings()
	if CustomAbilityIcons.GLOBALSETTINGS and CustomAbilityIcons.GLOBALSETTINGS.saveSettingsGlobally then
		return CustomAbilityIcons.GLOBALSETTINGS
	else
        if CustomAbilityIcons.CHARACTERSETTINGS then
		    return CustomAbilityIcons.CHARACTERSETTINGS
        else
            return CustomAbilityIcons.DEFAULTSETTINGS
	    end
    end
end

--- Initializes saved variables and configures their corresponding menus, using LibAddonMenu2 (if it exists).
function CustomAbilityIcons.InitializeSettings()
    local defaults = {
        --Icon = GetString(CUSTOM_ABILITY_ICONS),
        version = CustomAbilityIcons.SAVEDVARIABLES_VERSION
    }

    CustomAbilityIcons.SV = ZO_SavedVars:NewAccountWide("CustomAbilityIcons_SavedVariables", CustomAbilityIcons.SAVEDVARIABLES_VERSION, nil, defaults)
    local sv = CustomAbilityIcons_SavedVariables["Default"][GetDisplayName()]["$AccountWide"]
    -- Clean up leftover saved variables (from previous versions)
    for key, _ in pairs(sv) do
        -- Delete key-value pair if the key can't also be found in the default settings (except for version)
        if key ~= "version" and defaults[key] == nil then
            sv[key] = nil
        end
    end

    CustomAbilityIcons.GLOBALSETTINGS = ZO_SavedVars:NewAccountWide("CustomAbilityIcons_Globals", CustomAbilityIcons.SAVEDVARIABLES_VERSION, "global_settings",  CustomAbilityIcons.DEFAULTSETTINGS)
    CustomAbilityIcons.CHARACTERSETTINGS = ZO_SavedVars:NewCharacterIdSettings("CustomAbilityIcons_Settings", CustomAbilityIcons.SAVEDVARIABLES_VERSION, "character_settings", CustomAbilityIcons.DEFAULTSETTINGS)
	
    if LAM2 == nil then return end

    local panelData = {
		type = "panel",
		name = "Custom Ability Icons",
		displayName = "Custom Ability Icons",
		author = "Vartalus & Iresil",
		version = CustomAbilityIcons.version,
		slashCommand = "/caigb",	-- (optional) will register a keybind to open to this panel
		registerForRefresh = true,	-- boolean (optional) (will refresh all options controls when a setting is changed and when the panel is shown)
		registerForDefaults = true	-- boolean (optional) (will set all options controls back to default values)
	}

	LAM2:RegisterAddonPanel("CustomAbilityIcons_Panel", panelData)

	local optionsData = {
        {
            type = "header",
            name = "Settings",
        },
        {
            type = "checkbox",
            name = "Use same settings for all characters?",
            getFunc = function() return CustomAbilityIcons.GLOBALSETTINGS.saveSettingsGlobally end,
            setFunc = function(value)
                CustomAbilityIcons.GLOBALSETTINGS.saveSettingsGlobally = value
            end
        },
        {
            type = "checkbox",
            name = "Use Skill Style Icons on ability bar?",
            getFunc = function() return CustomAbilityIcons:GetSettings().showSkillStyleIcons end,
            setFunc = function(value)
                CustomAbilityIcons:GetSettings().showSkillStyleIcons = value
                CustomAbilityIcons.OnCollectibleUpdated()
            end
        },
        {
            type = "checkbox",
            name = "Use Custom Scribed Ability Icons on ability bar?",
            getFunc = function() return CustomAbilityIcons:GetSettings().showCustomScribeIcons end,
            setFunc = function(value)
                CustomAbilityIcons:GetSettings().showCustomScribeIcons = value
                CustomAbilityIcons.OnCollectibleUpdated()
            end
        },
        {
            type = "checkbox",
            name = "Replace low quality Default Ability Icons?",
            getFunc = function() return CustomAbilityIcons:GetSettings().replaceLowQualityDefaultIcons end,
            setFunc = function(value)
                CustomAbilityIcons:GetSettings().replaceLowQualityDefaultIcons = value
                CustomAbilityIcons.ReplaceLowQualityIcons()
            end
        }
    }

    LAM2:RegisterOptionControls("CustomAbilityIcons_Panel", optionsData)
end
