local addonName, addonTable = ...
local GetMacroFrameTextures = addonTable.Modules.DarkTheme.GetMacroFrameTextures
local GetKeyBindingFrameTextures = addonTable.Modules.DarkTheme.GetKeyBindingFrameTextures
local GetGeneralTextures = addonTable.Modules.DarkTheme.GetGeneralTextures

local colorLight = { r = 1, g = 1, b = 1 }
local colorDark = { r = 0.4, g = 0.4, b = 0.4 }
local color = colorLight
local desaturationDisabled = 0
local desaturationEnabled = 1
local desaturation = desaturationDisabled

local function SetVertexColors(textures, red, green, blue)
	for _, texture in ipairs(textures) do
		if texture:GetObjectType() == "Texture" then
			texture:SetVertexColor(red, green, blue)
		end
	end
end

local function SetDesaturations(textures, desaturation)
	for _, texture in ipairs(textures) do
		if texture:GetObjectType() == "Texture" then
			texture:SetDesaturation(desaturation)
		end
	end
end

-- Create borders for dark theme minimap
-- Minimap gametime border
RetailUI.GameTimeFrame = CreateFrame("Frame", nil, GameTimeFrame)
RetailUI.GameTimeBorder = RetailUI.GameTimeFrame:CreateTexture()
RetailUI.GameTimeBorder:SetTexture("Interface\\AddOns\\RetailUI\\art\\GameTimeBorder")
RetailUI.GameTimeBorder:SetPoint("CENTER", GameTimeFrame, -1, 1)
RetailUI.GameTimeBorder:SetSize(64, 64)

-- Minimap zoom in button border
RetailUI.ZoomInFrame = CreateFrame("Frame", nil, MinimapZoomIn)
RetailUI.ZoomInBorder = RetailUI.ZoomInFrame:CreateTexture()
RetailUI.ZoomInBorder:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")
RetailUI.ZoomInBorder:SetPoint("CENTER", MinimapZoomIn, 11, -11)
RetailUI.ZoomInBorder:SetSize(54, 54)

-- Minimap zoom out button border
RetailUI.ZoomOutFrame = CreateFrame("Frame", nil, MinimapZoomOut)
RetailUI.ZoomOutBorder = RetailUI.ZoomOutFrame:CreateTexture()
RetailUI.ZoomOutBorder:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")
RetailUI.ZoomOutBorder:SetPoint("CENTER", MinimapZoomOut, 11, -11)
RetailUI.ZoomOutBorder:SetSize(54, 54)

-- Replace default backpack container background texture and portrait
local function SetCustomBackpackTextures(frame, size, id)
	local frameName = frame:GetName()
	local backpackId = 0

	if id == backpackId then
		if RUI_SavedVars.Options.DarkTheme then
			_G[frameName .. "Portrait"]:ClearAllPoints()
			_G[frameName .. "Portrait"]:SetPoint("TOPLEFT", frameName, "TOPLEFT", 5, -3)
			_G[frameName .. "BackgroundTop"]:SetTexture("Interface\\AddOns\\RetailUI\\art\\UI-BackpackBackground")
			SetPortraitToTexture(frameName .. "Portrait", "Interface\\Buttons\\Button-Backpack-Up")
		else
			_G[frameName .. "BackgroundTop"]:SetTexture("Interface\\ContainerFrame\\UI-BackpackBackground")
		end
	end
end
hooksecurefunc("ContainerFrame_GenerateFrame", SetCustomBackpackTextures)

local function DarkTheme_MacroFrame_Update()
	local
		regularTextures, lighterTextures, lightestTextures, desaturateTextures =
		GetMacroFrameTextures()
	SetVertexColors(regularTextures, color.r, color.g, color.b)
	SetVertexColors(lighterTextures, color.r + 0.1, color.g + 0.1, color.b + 0.1)
	SetVertexColors(lightestTextures, color.r + 0.3, color.g + 0.3, color.b + 0.3)
	SetDesaturations(desaturateTextures, desaturation)
end
MacroFrame:HookScript("OnShow", DarkTheme_MacroFrame_Update)

local function DarkTheme_KeyBindingFrame_Update()
	local regularTextures = GetKeyBindingFrameTextures()
	SetVertexColors(regularTextures, color.r, color.g, color.b)
end
KeyBindingFrame:HookScript("OnShow", DarkTheme_KeyBindingFrame_Update)

local function DarkTheme_Update()
	MerchantBuyBackItemItemButtonNormalTexture:Hide()

	if RUI_SavedVars.Options.DarkTheme then
		color = colorDark
		desaturation = desaturationEnabled
		-- Raid frame manager toggle button texture
		CompactRaidFrameManagerToggleButton:SetNormalTexture(
			"Interface\\AddOns\\RetailUI\\art\\RaidPanel-Toggle"
		)
	else
		color = colorLight
		desaturation = desaturationDisabled
		-- Raid frame manager toggle button restore texture
		CompactRaidFrameManagerToggleButton:SetNormalTexture(
			"Interface\\RaidFrame\\RaidPanel-Toggle"
		)
	end

	local
		regularTextures, lighterTextures, keyRingTextures, desaturateTextures =
		GetGeneralTextures()
	SetVertexColors(regularTextures, color.r, color.g, color.b)
	SetVertexColors(lighterTextures, color.r + 0.1, color.g + 0.1, color.b + 0.1)
	SetVertexColors(keyRingTextures, color.r + 0.4, color.g + 0.4, color.b + 0.4)
	SetDesaturations(desaturateTextures, desaturation)

	DarkTheme_KeyBindingFrame_Update()
	DarkTheme_MacroFrame_Update()

	-- Update bag textures
	if GetBackpackFrame() ~= nil then
		SetCustomBackpackTextures(GetBackpackFrame(), nil, 0)
	end
end

GameMenuFrame:HookScript("OnShow", DarkTheme_Update)
InterfaceOptionsFrame:HookScript("OnShow", DarkTheme_Update)
VideoOptionsFrame:HookScript("OnShow", DarkTheme_Update)
StaticPopup1:HookScript("OnShow", DarkTheme_Update)
StaticPopup2:HookScript("OnShow", DarkTheme_Update)
StaticPopup3:HookScript("OnShow", DarkTheme_Update)
StaticPopup4:HookScript("OnShow", DarkTheme_Update)
hooksecurefunc("ContainerFrame_Update", DarkTheme_Update)
local f = CreateFrame("Frame")
f:RegisterEvent("DISPLAY_SIZE_CHANGED")
f:RegisterEvent("SPELL_UPDATE_USABLE")
f:SetScript("OnEvent", DarkTheme_Update)

RetailUI.DarkTheme_Update = DarkTheme_Update
