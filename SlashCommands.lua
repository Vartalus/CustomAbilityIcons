--- @class (partial) CustomAbilityIcons
local CustomAbilityIcons = CustomAbilityIcons

--- Creates slash commands to be used for debugging.
function CustomAbilityIcons.CreateSlashCommands()
    CustomAbilityIcons.CreateGetAbilityDetailsCommand()
    CustomAbilityIcons.CreateGetIconsCommand()
    CustomAbilityIcons.CreteGetSavedVarsCommand()
end

--- Creates the /getabilitydetails command, to retrieve details about the ability found at a specified slot.
function CustomAbilityIcons.CreateGetAbilityDetailsCommand()
    SLASH_COMMANDS["/getabilitydetails"] = function(skillIndex)
        local baseAbilityId = CustomAbilityIcons.GetBaseAbilityId(skillIndex, nil)
        CHAT_SYSTEM:AddMessage("Base Ability ID: " .. (baseAbilityId or -1))
        local abilityId = CustomAbilityIcons.GetAbilityId(skillIndex, nil)
        CHAT_SYSTEM:AddMessage("Ability ID: " .. (abilityId or -1))

        local primaryScriptId, secondaryScriptId, tertiaryScriptId = GetCraftedAbilityActiveScriptIds(abilityId)
        local scriptLink = ""
        if primaryScriptId ~= 0 or secondaryScriptId ~= 0 or tertiaryScriptId ~= 0 then
            CHAT_SYSTEM:AddMessage("Focus Script: " .. GetCraftedAbilityScriptDisplayName(primaryScriptId) .. "(" .. primaryScriptId .. ")")
            CHAT_SYSTEM:AddMessage("Signature Script: " .. GetCraftedAbilityScriptDisplayName(secondaryScriptId) .. "(" .. secondaryScriptId .. ")")
            CHAT_SYSTEM:AddMessage("Affix Script: " .. GetCraftedAbilityScriptDisplayName(tertiaryScriptId) .. "(" .. tertiaryScriptId .. ")")
            if primaryScriptId ~= 0 and secondaryScriptId ~= 0 and tertiaryScriptId ~= 0 then
                scriptLink = ZO_LinkHandler_CreateChatLink(GetCraftedAbilityLink, abilityId, primaryScriptId, secondaryScriptId, tertiaryScriptId)
                CHAT_SYSTEM:AddMessage("Scribed Skill Link: " .. scriptLink)
            end
        end
    end
end

--- Creates the /geticons command, to retrieve available icons for the skill found at the specified slot.
function CustomAbilityIcons.CreateGetIconsCommand()
    SLASH_COMMANDS["/geticons"] = function(skillIndex)
        local collectibleIcon = CustomAbilityIcons.GetSkillStyleIcon(skillIndex, nil)
        CHAT_SYSTEM:AddMessage("Collectible Icon: " .. (collectibleIcon or "nil"))
        local customIcon = CustomAbilityIcons.GetCustomAbilityIcon(skillIndex, nil)
        CHAT_SYSTEM:AddMessage("Custom Icon: " .. (customIcon or "nil"))
        local abilityIcon = CustomAbilityIcons.GetDefaultAbilityIcon(skillIndex, nil)
        CHAT_SYSTEM:AddMessage("Default Icon: " .. (abilityIcon or "nil"))
    end
end

--- Creates the /getsavedvars command, to check the contents of the addon's saved variables.
function CustomAbilityIcons.CreteGetSavedVarsCommand()
    SLASH_COMMANDS["/getsavedvars"] = function ()
        CHAT_SYSTEM:AddMessage("----------------------------------")

        local sv1 = CustomAbilityIcons_SavedVariables["Default"][GetDisplayName()]["$AccountWide"]
        CHAT_SYSTEM:AddMessage("CustomAbilityIcons_SavedVariables:")
        for key, value in pairs(sv1) do
            CHAT_SYSTEM:AddMessage("[" .. key .. "] -> " .. tostring(value))
        end

        CHAT_SYSTEM:AddMessage("----------------------------------")

        local sv2 = CustomAbilityIcons_Globals["Default"][GetDisplayName()]["$AccountWide"]["global_settings"]
        CHAT_SYSTEM:AddMessage("CustomAbilityIcons_Globals:")
        for key, value in pairs(sv2) do
            CHAT_SYSTEM:AddMessage("[" .. key .. "] -> " .. tostring(value))
        end

        CHAT_SYSTEM:AddMessage("----------------------------------")

        local sv3 = CustomAbilityIcons_Settings["Default"][GetDisplayName()][GetCurrentCharacterId()]["character_settings"]
        CHAT_SYSTEM:AddMessage("CustomAbilityIcons_Settings:")
        for key, value in pairs(sv3) do
            CHAT_SYSTEM:AddMessage("[" .. key .. "] -> " .. tostring(value))
        end

        CHAT_SYSTEM:AddMessage("----------------------------------")
    end
end
