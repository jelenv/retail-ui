local function Lookup(t, ...)
    for _, k in ipairs{...} do
		t = t[k]
        if t == nil then
            return nil
        end
    end
    return t
end

local function AddToOptions(name, value)
	if Lookup(RUI_SavedVars, "Options", name) == nil then
		RUI_SavedVars["Options"][name] = value
	end
end

local function AddToKeybindText(name, value)
	if Lookup(RUI_SavedVars, "Options", "KeybindText", name) == nil then
		RUI_SavedVars["Options"]["KeybindText"][name] = value
	end
end

local function AddToComponents(name, value)
	if Lookup(RUI_SavedVars, "Options", "Components", name) == nil then
		RUI_SavedVars["Options"]["Components"][name] = value
	end
end

local function SavedVariables_Create()
	-------------------------
	--[[ Expected output ]]--
	-------------------------
	-- RUI_SavedVars["Options"] = {
	-- 	["TidyIcons"] = false,
	-- 	["DarkTheme"] = false,
	-- 	["AlwaysShowExpBarText"] = GetCVarBool("xpBarText"),
	-- 	["KeybindText"] = {
	-- 		["PrimaryBar"] = true,
	-- 		["BottomLeftBar"] = true,
	-- 		["BottomRightBar"] = true,
	-- 		["RightBar"] = true,
	-- 		["RightBar2"] = true,
	-- 	},
	-- 	["Components"] = {
	-- 		["Gryphons"] = true,
	-- 		["Bags"] = true,
	-- 		["MicroMenu"] = true,
	-- 		["MicroAndBagsBackground"] = true,
	-- 	}
	-- }

	-- AddToOptions("PixelPerfect", false)
	AddToOptions("TidyIcons", false)
	AddToOptions("DarkTheme", false)
	AddToOptions("AlwaysShowExpBarText", GetCVarBool("xpBarText"))
	AddToOptions("KeybindText", {})
	AddToKeybindText("PrimaryBar", true)
	AddToKeybindText("BottomLeftBar", true)
	AddToKeybindText("BottomRightBar", true)
	AddToKeybindText("RightBar", true)
	AddToKeybindText("RightBar2", true)
	AddToOptions("Components", {})
	AddToComponents("Gryphons", true)
	AddToComponents("Bags", true)
	AddToComponents("MicroMenu", true)
	AddToComponents("MicroAndBagsBackground", true)
end

local function SavedVariables_Init()
	if RUI_SavedVars ~= nil then
		-- Add any missing saved variables
		SavedVariables_Create()

		-- Apply Saved Variables
		RetailUI:TidyIcons_Update()
		RetailUI:KeybindText_Update()
		RetailUI:DarkTheme_Update()
		RetailUI:Gryphons_Update()
		RetailUI:Bags_Update()
		RetailUI:MicroMenu_Update()
		RetailUI:MicroAndBagsBackground_Update()
	else
		-- No saved variables exist, show popup and create default saved variables
		StaticPopup_Show("Welcome_Popup")
		-- Create default saved variables
		RUI_SavedVars = {}
		RUI_SavedVars["Options"] = {}
		SavedVariables_Create()
	end
end

-- This event fires whenever an addon has finished loading and the
-- SavedVariables for that addon have been loaded from their file
local function AddonLoaded()
	SavedVariables_Init()
end
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", AddonLoaded)
