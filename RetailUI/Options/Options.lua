StaticPopupDialogs["ReloadUI_Popup"] = {
    text = "Reload to apply changes to Experience Bar Text?",
    button1 = "Reload",
    button2 = "Later",
    OnAccept = function()
        ReloadUI()
    end,
    timeout = 0,
    whileDead = true,
    hideOnEscape = true,
    preferredIndex = 3,
  }

local function Restore_DefaultState(checkbox, defaultState)
	if checkbox:GetChecked() ~= defaultState then
		checkbox:Click()
	end
end

StaticPopupDialogs["RestoreDefaults_Popup"] = {
	text = "Restore default options?",
	button1 = "Restore",
	button2 = "Cancel",
	OnAccept = function()
		-- General
		Restore_DefaultState(InnerPanelTidyIcons, false)
		Restore_DefaultState(InnerPanelDarkTheme, false)
		Restore_DefaultState(InnerPanelAlwaysShowExpBarText, false)

		-- Keybind Text
		Restore_DefaultState(InnerPanelKeybindTextPrimaryBar, true)
		Restore_DefaultState(InnerPanelKeybindTextBottomLeftBar, true)
		Restore_DefaultState(InnerPanelKeybindTextBottomRightBar, true)
		Restore_DefaultState(InnerPanelKeybindTextRightBar, true)
		Restore_DefaultState(InnerPanelKeybindTextRightBar2, true)

		-- Components
		Restore_DefaultState(InnerPanelGryphons, true)
		Restore_DefaultState(InnerPanelBags, true)
		Restore_DefaultState(InnerPanelBagSpaceText, true)
		Restore_DefaultState(InnerPanelMicroMenu, true)
		Restore_DefaultState(InnerPanelMicroAndBagsBackground, true)
	end,
	timeout = 0,
	whileDead = true,
	hideOnEscape = true,
	preferredIndex = 3,
}
