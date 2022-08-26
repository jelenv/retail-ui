local function BooleanToNumber(value)
	return value and 1 or 0
end

local function KeybindText_Update()
	for i = 1, 12 do
		_G["ActionButton" .. i .. "HotKey"]:SetAlpha(
			BooleanToNumber(RUI_SavedVars.Options.KeybindText.PrimaryBar)
		)
		_G["MultiBarBottomLeftButton" .. i .. "HotKey"]:SetAlpha(
			BooleanToNumber(RUI_SavedVars.Options.KeybindText.BottomLeftBar)
		)
		_G["MultiBarBottomRightButton" .. i .. "HotKey"]:SetAlpha(
			BooleanToNumber(RUI_SavedVars.Options.KeybindText.BottomRightBar)
		)
		_G["MultiBarRightButton" .. i .. "HotKey"]:SetAlpha(
			BooleanToNumber(RUI_SavedVars.Options.KeybindText.RightBar)
		)
		_G["MultiBarLeftButton" .. i .. "HotKey"]:SetAlpha(
			BooleanToNumber(RUI_SavedVars.Options.KeybindText.RightBar2)
		)
	end
end

RetailUI.KeybindText_Update = KeybindText_Update
