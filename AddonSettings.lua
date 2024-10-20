--- @class (partial) CustomAbilityIcons
local CustomAbilityIcons = CustomAbilityIcons

local LAM2 = LibAddonMenu2

--- Retrieves the saved settings, whether global or per character (and the default settings if nothing was previously saved).
function CustomAbilityIcons.GetSettings()
	if CustomAbilityIcons.CONFIG and CustomAbilityIcons.CONFIG.saveSettingsGlobally then
		return CustomAbilityIcons.GLOBALSETTINGS or CustomAbilityIcons.DEFAULT_SETTINGS
	else
        return CustomAbilityIcons.CHARACTERSETTINGS or CustomAbilityIcons.DEFAULT_SETTINGS
    end
end

-- Cleanup account wide settings from previous versions.
function CustomAbilityIcons.CleanupAccountWideSettings(savedVars, defaultConfig)
    local currentConfig = savedVars["Default"][GetDisplayName()]["$AccountWide"]
    for key, _ in pairs(currentConfig) do
        if key ~= "version" and defaultConfig[key] == nil then
            currentConfig[key] = nil
        end
    end
end

-- Cleanup character id settings from previous versions.
function CustomAbilityIcons.CleanupCharacterIdSettings(savedVars, defaultConfig)
    local characterKey = GetCurrentCharacterId()
    local currentConfig = savedVars["Default"][GetDisplayName()][characterKey]
    for key, _ in pairs(currentConfig) do
        if key ~= "version" and defaultConfig[key] == nil then
            currentConfig[key] = nil
        end
    end
end

--- Initializes saved variables and configures their corresponding menus, using LibAddonMenu2 (if it exists).
function CustomAbilityIcons.InitializeSettings()
    CustomAbilityIcons.CONFIG = ZO_SavedVars:NewAccountWide("CustomAbilityIcons_SavedVariables", CustomAbilityIcons.SAVEDVARIABLES_VERSION, nil, CustomAbilityIcons.DEFAULT_ADDON_CONFIG)
    CustomAbilityIcons.CleanupAccountWideSettings(CustomAbilityIcons_SavedVariables, CustomAbilityIcons.DEFAULT_ADDON_CONFIG)

    CustomAbilityIcons.GLOBALSETTINGS = ZO_SavedVars:NewAccountWide("CustomAbilityIcons_Globals", CustomAbilityIcons.SAVEDVARIABLES_VERSION, "global_settings",  CustomAbilityIcons.DEFAULT_SETTINGS)
    --CustomAbilityIcons.CleanupAccountWideSettings(CustomAbilityIcons_Globals, CustomAbilityIcons.DEFAULT_SETTINGS)

    CustomAbilityIcons.CHARACTERSETTINGS = ZO_SavedVars:NewCharacterIdSettings("CustomAbilityIcons_Settings", CustomAbilityIcons.SAVEDVARIABLES_VERSION, "character_settings", CustomAbilityIcons.DEFAULT_SETTINGS)
    --CustomAbilityIcons.CleanupCharacterIdSettings(CustomAbilityIcons_Settings, CustomAbilityIcons.DEFAULT_SETTINGS)

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
            getFunc = function() return CustomAbilityIcons.CONFIG.saveSettingsGlobally end,
            setFunc = function(value)
                CustomAbilityIcons.CONFIG.saveSettingsGlobally = value
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
