local addonName, addonTable = ...

local function TableCount(t)
	local i = 0
	for k in pairs(t) do i = i + 1 end
	return i
end

local function AddSelectItemToTable(t, item, start, finish)
	if item ~= nil then
		-- If end is null, auto count all regions within
		local RegionCount = TableCount({ item:GetRegions() })
		for i = start, finish or RegionCount do
			local Value = select(i, item:GetRegions())
			table.insert(t, Value)
		end
	end
end

-- Ensure macro frame is loaded before accessing its frames
if not IsAddOnLoaded("Blizzard_MacroUI") then
    LoadAddOn("Blizzard_MacroUI")
end

local function GetMacroFrameTextures()
    local regularTextures = {
        MacroFramePortraitFrame,
        MacroFrameTopBorder,
        MacroFrameTopRightCorner,
        MacroFrameRightBorder,
        MacroFrameBtnCornerRight,
        MacroFrameButtonBottomBorder,
        MacroFrameBottomBorder,
        MacroFrameBtnCornerLeft,
        MacroFrameLeftBorder,
    
        MacroButtonScrollFrameTop,
        MacroButtonScrollFrameMiddle,
        MacroButtonScrollFrameBottom,
        MacroHorizontalBarLeft,
        -- MacroHorizontalBarRight
        select(21, MacroFrame:GetRegions()),
    
        MacroPopupScrollFrameTop,
        MacroPopupScrollFrameMiddle,
        MacroPopupScrollFrameBottom
    }
    
    local lighterTextures = {
        MacroFrameTitleBg,
        MacroFrameBg
    }
    
    local lightestTextures = {
        MacroButtonScrollFrameScrollBarThumbTexture,
        MacroFrameScrollFrameScrollBarThumbTexture,
        MacroPopupScrollFrameScrollBarThumbTexture
    }
    
    local desaturateTextures = {
        MacroFramePortraitFrame,
        MacroFrameTitleBg,
        MacroFrameBg
    }

    for i = 1, 120 do
		local Item = _G["MacroButton" .. i]
		AddSelectItemToTable(lighterTextures, Item, 1, 2)
	end

	AddSelectItemToTable(lightestTextures, MacroFrameTab1, 1, 7)
	AddSelectItemToTable(lightestTextures, MacroFrameTab2, 1, 7)
	AddSelectItemToTable(desaturateTextures, MacroFrameTab1, 1, 7)
	AddSelectItemToTable(desaturateTextures, MacroFrameTab2, 1, 7)
	AddSelectItemToTable(regularTextures, MacroFrameInset, 1, 9)
	AddSelectItemToTable(regularTextures, MacroFrameTextBackground, 1, 9)
	AddSelectItemToTable(regularTextures, MacroPopupFrame.BorderBox, 1, 8)
	AddSelectItemToTable(lightestTextures, MacroButtonScrollFrameScrollBarScrollUpButton, 1, 4)
	AddSelectItemToTable(lightestTextures, MacroButtonScrollFrameScrollBarScrollDownButton, 1, 4)
	AddSelectItemToTable(lightestTextures, MacroFrameScrollFrameScrollBarScrollUpButton, 1, 4)
	AddSelectItemToTable(lightestTextures, MacroFrameScrollFrameScrollBarScrollDownButton, 1, 4)
	AddSelectItemToTable(lightestTextures, MacroPopupScrollFrameScrollBarScrollUpButton, 1, 4)
	AddSelectItemToTable(lightestTextures, MacroPopupScrollFrameScrollBarScrollDownButton, 1, 4)

    return regularTextures, lighterTextures, lightestTextures, desaturateTextures
end

-- Ensure key binding frame is loaded before accessing its frames
if not IsAddOnLoaded("Blizzard_BindingUI") then
	LoadAddOn("Blizzard_BindingUI")
end

local function GetKeyBindingFrameTextures()
    local regularTextures = {
		KeyBindingFrameTopLeftCorner,
		KeyBindingFrameTopBorder,
		KeyBindingFrameTopRightCorner,
		KeyBindingFrameRightBorder,
		KeyBindingFrameBottomRightCorner,
		KeyBindingFrameBottomBorder,
		KeyBindingFrameBottomLeftCorner,
		KeyBindingFrameLeftBorder,
		KeyBindingFrameRockBg,
	}
	AddSelectItemToTable(regularTextures, KeyBindingFrame, 1)
	AddSelectItemToTable(regularTextures, KeyBindingFrameCategoryList, 1, 8)
	AddSelectItemToTable(regularTextures, KeyBindingFrame.bindingsContainer, 1, 8)

    return regularTextures
end

-- Ensure time manager frame is loaded before accessing its frames
if not IsAddOnLoaded("Blizzard_TimeManager") then
    LoadAddOn("Blizzard_TimeManager")
end
local function GetGeneralTextures()
    local regularTextures = {
		-- ActionBar background
		RetailUIArtFrame.BackgroundSmall,
		RetailUIArtFrame.BackgroundLarge,

		-- Bags
		MicroButtonAndBagsBarTexture,
		
		-- Gryphons
		MainMenuBarLeftEndCap,
		MainMenuBarRightEndCap,
		
		-- Status bars
		RetailUIStatusBars.SingleBarSmallUpper,
		RetailUIStatusBars.SingleBarSmall,
		RetailUIStatusBars.SingleBarLargeUpper,
		RetailUIStatusBars.SingleBarLarge,

		-- Minimap
		MinimapBorder,
		MinimapBorderTop,
		MiniMapBattlefieldBorder,
		MiniMapTrackingBorder,
		MiniMapMailBorder,
		RetailUI.GameTimeBorder,
		-- Texture next to the minimap toggle
		MiniMapWorldMapButton:GetRegions(),
		-- Minimap zoom in and out button borders
		RetailUI.ZoomInBorder,
		RetailUI.ZoomOutBorder,
		-- Minimap clock
		TimeManagerClockButton:GetRegions(),

		-- Casting bars
		CastingBarFrame.Border,
		TargetFrameSpellBar.Border,
		FocusFrameSpellBar.Border,

		-- Breath bar
		MirrorTimer1Border,
		MirrorTimer2Border,
        MirrorTimer3Border,

		-- Unit frames
		PlayerFrameTexture,
		TargetFrameTextureFrameTexture,
		FocusFrameTextureFrameTexture,
		-- TODO: Causes error
		-- FocusFrameToTTextureFrameTexture,
		PetFrameTexture,
		PartyMemberFrame1Texture,
		PartyMemberFrame2Texture,
		PartyMemberFrame3Texture,
		PartyMemberFrame4Texture,
		PartyMemberFrame1PetFrameTexture,
		PartyMemberFrame2PetFrameTexture,
		PartyMemberFrame3PetFrameTexture,
		PartyMemberFrame4PetFrameTexture,
		TargetFrameToTTextureFrameTexture,

		-- Pet bar
		SlidingActionBarTexture0,
		SlidingActionBarTexture1,

		-- Stance bar
		StanceBarLeft,
		StanceBarMiddle,
		StanceBarRight,

		-- Chat box
		ChatFrame1EditBoxLeft,
		ChatFrame1EditBoxMid,
		ChatFrame1EditBoxRight,

		-- Compact raid frame manager
		CompactRaidFrameManagerDisplayFrameHeaderDelineator,
		CompactRaidFrameManagerBorderTopLeft,
		CompactRaidFrameManagerBorderTop,
		CompactRaidFrameManagerBorderTopRight,
		CompactRaidFrameManagerBorderRight,
		CompactRaidFrameManagerBorderBottomRight,
		CompactRaidFrameManagerBorderBottom,
		CompactRaidFrameManagerBorderBottomLeft,
		CompactRaidFrameManagerBg,
		-- Ready check button border
		CompactRaidFrameManagerDisplayFrameLeaderOptionsInitiateReadyCheckTopLeft,
		CompactRaidFrameManagerDisplayFrameLeaderOptionsInitiateReadyCheckTopMiddle,
		CompactRaidFrameManagerDisplayFrameLeaderOptionsInitiateReadyCheckTopRight,
		CompactRaidFrameManagerDisplayFrameLeaderOptionsInitiateReadyCheckMiddleRight,
		CompactRaidFrameManagerDisplayFrameLeaderOptionsInitiateReadyCheckBottomRight,
		CompactRaidFrameManagerDisplayFrameLeaderOptionsInitiateReadyCheckBottomMiddle,
		CompactRaidFrameManagerDisplayFrameLeaderOptionsInitiateReadyCheckBottomLeft,
		CompactRaidFrameManagerDisplayFrameLeaderOptionsInitiateReadyCheckMiddleLeft,
		-- Convert to raid button border
		CompactRaidFrameManagerDisplayFrameConvertToRaidTopLeft,
		CompactRaidFrameManagerDisplayFrameConvertToRaidTopMiddle,
		CompactRaidFrameManagerDisplayFrameConvertToRaidTopRight,
		CompactRaidFrameManagerDisplayFrameConvertToRaidMiddleRight,
		CompactRaidFrameManagerDisplayFrameConvertToRaidBottomRight,
		CompactRaidFrameManagerDisplayFrameConvertToRaidBottomMiddle,
		CompactRaidFrameManagerDisplayFrameConvertToRaidBottomLeft,
		CompactRaidFrameManagerDisplayFrameConvertToRaidMiddleLeft,
		-- Toggle lock button border
		CompactRaidFrameManagerDisplayFrameLockedModeToggleTopLeft,
		CompactRaidFrameManagerDisplayFrameLockedModeToggleTopMiddle,
		CompactRaidFrameManagerDisplayFrameLockedModeToggleTopRight,
		CompactRaidFrameManagerDisplayFrameLockedModeToggleMiddleRight,
		CompactRaidFrameManagerDisplayFrameLockedModeToggleBottomRight,
		CompactRaidFrameManagerDisplayFrameLockedModeToggleBottomMiddle,
		CompactRaidFrameManagerDisplayFrameLockedModeToggleBottomLeft,
		CompactRaidFrameManagerDisplayFrameLockedModeToggleMiddleLeft,
		-- Toggle visibility button border
		CompactRaidFrameManagerDisplayFrameHiddenModeToggleTopLeft,
		CompactRaidFrameManagerDisplayFrameHiddenModeToggleTopMiddle,
		CompactRaidFrameManagerDisplayFrameHiddenModeToggleTopRight,
		CompactRaidFrameManagerDisplayFrameHiddenModeToggleMiddleRight,
		CompactRaidFrameManagerDisplayFrameHiddenModeToggleBottomRight,
		CompactRaidFrameManagerDisplayFrameHiddenModeToggleBottomMiddle,
		CompactRaidFrameManagerDisplayFrameHiddenModeToggleBottomLeft,
		CompactRaidFrameManagerDisplayFrameHiddenModeToggleMiddleLeft,

		-- Raid frame
		CompactRaidFrameContainerBorderFrameBorderTopLeft,
		CompactRaidFrameContainerBorderFrameBorderTop,
		CompactRaidFrameContainerBorderFrameBorderTopRight,
		CompactRaidFrameContainerBorderFrameBorderRight,
		CompactRaidFrameContainerBorderFrameBorderBottomRight,
		CompactRaidFrameContainerBorderFrameBorderBottom,
		CompactRaidFrameContainerBorderFrameBorderBottomLeft,
		CompactRaidFrameContainerBorderFrameBorderLeft,

		-- Retail UI options frame
		RUIOptionsFrameHeader,

		-- Game menu
		GameMenuFrameHeader,

		-- Interface options
		InterfaceOptionsFrameHeader,

		-- Dialog edit box border
		StaticPopup1EditBoxLeft,
		StaticPopup2EditBoxLeft,
		StaticPopup3EditBoxLeft,
		StaticPopup4EditBoxLeft,
		StaticPopup1EditBoxMid,
		StaticPopup2EditBoxMid,
		StaticPopup3EditBoxMid,
		StaticPopup4EditBoxMid,
		StaticPopup1EditBoxRight,
		StaticPopup2EditBoxRight,
		StaticPopup3EditBoxRight,
		StaticPopup4EditBoxRight,		

		-- Interface options - Tab borders
		InterfaceOptionsFrameTab1TabSpacer,

		-- Interface options - Categories border
		InterfaceOptionsFrameCategoriesTopLeft,
		InterfaceOptionsFrameCategoriesTop,
		InterfaceOptionsFrameCategoriesTopRight,
		InterfaceOptionsFrameCategoriesRight,
		InterfaceOptionsFrameCategoriesBottomRight,
		InterfaceOptionsFrameCategoriesBottom,
		InterfaceOptionsFrameCategoriesBottomLeft,
		InterfaceOptionsFrameCategoriesLeft,

		-- Interface options - AddOns borders
		InterfaceOptionsFrameAddOnsTopLeft,
		InterfaceOptionsFrameTab2TabSpacer1,
		InterfaceOptionsFrameTab2TabSpacer2,
		InterfaceOptionsFrameAddOnsTopRight,
		InterfaceOptionsFrameAddOnsRight,
		InterfaceOptionsFrameAddOnsBottomRight,
		InterfaceOptionsFrameAddOnsBottom,
		InterfaceOptionsFrameAddOnsBottomleft,
		InterfaceOptionsFrameAddOnsLeft,

		-- System options
		VideoOptionsFrameHeader
	}

	local lighterTextures = {
		ExhaustionTickNormal,
	}

	local desaturateTextures = {
		-- Unit frames
		PlayerFrameTexture,
		--TargetFrameTextureFrameTexture,
		PetFrameTexture,
		PartyMemberFrame1Texture,
		PartyMemberFrame2Texture,
		PartyMemberFrame3Texture,
		PartyMemberFrame4Texture,
		PartyMemberFrame1PetFrameTexture,
		PartyMemberFrame2PetFrameTexture,
		PartyMemberFrame3PetFrameTexture,
		PartyMemberFrame4PetFrameTexture,
		TargetFrameToTTextureFrameTexture,

		MinimapBorder,
		MiniMapBattlefieldBorder,
		MiniMapTrackingBorder,
		MiniMapMailBorder,
		RetailUI.GameTimeBorder,
		-- Minimap zoom in and out button borders
		RetailUI.ZoomInBorder,
		RetailUI.ZoomOutBorder,
		-- Minimap clock
		TimeManagerClockButton:GetRegions()
	}

	-- Bags and bank bags' background textures
	for i = 1, NUM_CONTAINER_FRAMES, 1 do
		table.insert(desaturateTextures, _G["ContainerFrame" .. i .. "BackgroundTop"])
		table.insert(desaturateTextures, _G["ContainerFrame" .. i .. "BackgroundTop"])
		table.insert(desaturateTextures, _G["ContainerFrame" .. i .. "BackgroundMiddle1"])
		table.insert(desaturateTextures, _G["ContainerFrame" .. i .. "BackgroundMiddle2"])
		table.insert(desaturateTextures, _G["ContainerFrame" .. i .. "BackgroundBottom"])
        -- 1 slot bag's background texture
		table.insert(desaturateTextures, _G["ContainerFrame" .. i .. "Background1Slot"])
		table.insert(lighterTextures, _G["ContainerFrame" .. i .. "BackgroundTop"])
		table.insert(lighterTextures, _G["ContainerFrame" .. i .. "BackgroundMiddle1"])
		table.insert(lighterTextures, _G["ContainerFrame" .. i .. "BackgroundMiddle2"])
		table.insert(lighterTextures, _G["ContainerFrame" .. i .. "BackgroundBottom"])
        -- 1 slot bag's background texture
		table.insert(lighterTextures, _G["ContainerFrame" .. i .. "Background1Slot"])
	end

	-- Bags' slot borders
	for i = 1, NUM_CONTAINER_FRAMES, 1 do
		local Name = _G["ContainerFrame" .. i]:GetName()
		for i = 1, MAX_CONTAINER_ITEMS, 1 do
			table.insert(
                regularTextures, _G[Name .. "Item" .. i .. "NormalTexture"]
            )
		end
	end

	-- Dialog border
	for i = 1, 4 do
		local Item = _G["StaticPopup" .. i]
		AddSelectItemToTable(regularTextures, Item, 4, 12)
	end

	-- RUI options frame borders
	AddSelectItemToTable(regularTextures, RUIOptionsFrame, 1, 10)
	AddSelectItemToTable(regularTextures, RUIOptionsFramePanelContainer, 1, 8)

	-- Game menu border
	AddSelectItemToTable(regularTextures, GameMenuFrame, 1, 10)

	-- Interface options border
	AddSelectItemToTable(regularTextures, InterfaceOptionsFrame, 1, 10)

	-- Interface options - Panel container border
	AddSelectItemToTable(regularTextures, InterfaceOptionsFramePanelContainer, 1, 9)

	-- System options borders
	AddSelectItemToTable(regularTextures, VideoOptionsFrame, 1)
	AddSelectItemToTable(regularTextures, VideoOptionsFrameCategoryFrame, 1, 8)
	AddSelectItemToTable(regularTextures, VideoOptionsFramePanelContainer, 1, 8)
	AddSelectItemToTable(regularTextures, Display_, 1, 8)
	AddSelectItemToTable(regularTextures, Graphics_, 1, 8)

	-- Key ring
	local keyRingTextures = {}
	AddSelectItemToTable(keyRingTextures, KeyRingButton, 1, 2)

    return regularTextures, lighterTextures, keyRingTextures, desaturateTextures
end

addonTable.Modules.DarkTheme.GetMacroFrameTextures = GetMacroFrameTextures
addonTable.Modules.DarkTheme.GetKeyBindingFrameTextures = GetKeyBindingFrameTextures
addonTable.Modules.DarkTheme.GetGeneralTextures = GetGeneralTextures
