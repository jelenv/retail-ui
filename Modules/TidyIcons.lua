local function trimIcon(icon)
	icon:SetTexCoord(.08, .92, .08, .92)
end

local function untrimIcon(icon)
	icon:SetTexCoord(0, 0, 0, 1, 1, 0, 1, 1)
end

local function toggleIconTrim(icon)
	if RUI_SavedVars.Options.TidyIcons then
		trimIcon(icon)
	else
		untrimIcon(icon)
	end
end

local function TidyIcons_MacroPopupFrame_Update()
	if (MacroPopupFrame:IsShown()) then
		for i = 1, 90 do
			local button = _G["MacroPopupButton" .. i]
			local name = button:GetName()
			local icon = _G[name .. "Icon"]

			toggleIconTrim(icon)
		end
	end
end
-- Ensure MacroPopupFrame frame is loaded first, so we don't get an error
if not IsAddOnLoaded("Blizzard_MacroUI") then
	LoadAddOn("Blizzard_MacroUI")
end
MacroPopupFrame:HookScript("OnShow", TidyIcons_MacroPopupFrame_Update)

local function TidyIcons_Update()
	-- Tidy action bar icons
	for i = 1, NUM_ACTIONBAR_BUTTONS do
		for _, v in pairs({
			"ActionButton",
			"MultiBarBottomLeftButton",
			"MultiBarBottomRightButton",
			"MultiBarRightButton",
			"MultiBarLeftButton"
		}) do
			local button = _G[v .. i]
			local name = button:GetName()
			local icon = _G[name .. "Icon"]

			toggleIconTrim(icon)
		end
	end

	-- Tidy macro icons
	for i = 1, 120 do
		local button = _G["MacroButton" .. i]
		local name = button:GetName()
		local icon = _G[name .. "Icon"]

		toggleIconTrim(icon)
	end

	TidyIcons_MacroPopupFrame_Update()
end

RetailUI.TidyIcons_Update = TidyIcons_Update
