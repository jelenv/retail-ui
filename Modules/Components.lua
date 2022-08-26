local function Gryphons_Update()
	if RUI_SavedVars.Options.Components.Gryphons then
		MainMenuBarLeftEndCap:Show()
		MainMenuBarRightEndCap:Show()
	else
		MainMenuBarLeftEndCap:Hide()
		MainMenuBarRightEndCap:Hide()
	end
end

local function Update_KeyRing()
	if RUI_SavedVars.Options.Components.Bags then
		KeyRingButton:Show()
	else
		KeyRingButton:Hide()
	end
end
hooksecurefunc("MainMenuBar_UpdateKeyRing", Update_KeyRing)

local function Bags_Update()
	if RUI_SavedVars.Options.Components.Bags then
		MainMenuBarBackpackButton:Show()
		for i = 0, 3 do
			_G["CharacterBag" .. i .. "Slot"]:Show()
		end
	else
		MainMenuBarBackpackButton:Hide()
		for i = 0, 3 do
			_G["CharacterBag" .. i .. "Slot"]:Hide()
		end
	end
	Update_KeyRing()
end

local function BagSpaceText_Update()
	if RUI_SavedVars.Options.Components.BagSpaceText then
		BagSpaceDisplay:Show()
	else
		BagSpaceDisplay:Hide()
	end
end

local function MicroMenu_Update()
	if RUI_SavedVars.Options.Components.MicroMenu then
		for i = 1, #MICRO_BUTTONS do
			_G[MICRO_BUTTONS[i]]:Show()
		end
		MainMenuBarPerformanceBarFrame:Show()
	else
		for i = 1, #MICRO_BUTTONS do
			_G[MICRO_BUTTONS[i]]:Hide()
		end
		MainMenuBarPerformanceBarFrame:Hide()
	end
end

local function MicroAndBagsBackground_Update()
	if RUI_SavedVars.Options.Components.MicroAndBagsBackground then
		MicroButtonAndBagsBar:Show()
	else
		MicroButtonAndBagsBar:Hide()
	end
end

RetailUI.Gryphons_Update = Gryphons_Update
RetailUI.Bags_Update = Bags_Update
RetailUI.BagSpaceText_Update = BagSpaceText_Update
RetailUI.MicroMenu_Update = MicroMenu_Update
RetailUI.MicroAndBagsBackground_Update = MicroAndBagsBackground_Update
