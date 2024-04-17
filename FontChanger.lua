local FC = FontChanger or {}
local LAM2 = LibAddonMenu2

FC.name = "FontChanger"
FC.version = "1.4"

local REGULAR_FONT = "FontChanger/fonts/slugs/FCUI.slug"
local REGULAR_FONT_BOLD = "FontChanger/fonts/slugs/FCUI_Bold.slug"
local NAMEPLATE_FONT = "FontChanger/fonts/slugs/FCUI.slug"
local SCT_FONT = "FontChanger/fonts/slugs/FCUI.slug"
local CHAT_FONT = "FontChanger/fonts/slugs/FCChat.slug"
local BOOK_FONT = "FontChanger/fonts/slugs/FCBook.slug"

function FC:SetUIFonts()
	for key, value in zo_insecurePairs(_G) do
		if (key):find("^Zo") and type(value) == "userdata" and value.SetFont then
			local font = {value:GetFontInfo()}
			-- DEFAULT USED AS REGULAR/CHAT FONT -- 
			if (font[1] == "EsoUI/Common/Fonts/Univers57.slug") or (font[1] == "$(MEDIUM_FONT)") then
				font[1] = self.SV.menu_font
				-- Default Size: 1 --
				font[2] = font[2] * self.SV.menu_font_scale
				value:SetFont(table.concat(font, "|"))
			end
			-- DEFAULT USED AS BOLD FONT --
			if (font[1] == "EsoUI/Common/Fonts/Univers67.slug") or (font[1] == "$(BOLD_FONT)") then
				font[1] = self.SV.menu_bold_font
				-- Default Size: 0.9 --
				font[2] = font[2] * self.SV.menu_bold_font_scale
				value:SetFont(table.concat(font, "|"))
			end
			-- DEFAULT USED AS BOOK FONT --
			if (font[1] == "EsoUI/Common/Fonts/ProseAntiquePSMT.slug") or (font[1] == "$(ANTIQUE_FONT)") then
				font[1] = self.SV.book_font
				-- Default Size: 0.9 --
				font[2] = font[2] * self.SV.book_font_scale
				value:SetFont(table.concat(font, "|"))
			end
			-- DEFAULT USED AS HANDWRITTEN FONT --
			if (font[1] == "EsoUI/Common/Fonts/Handwritten_Bold.slug") or (font[1] == "$(HANDWRITTEN_FONT)") then
				font[1] = self.SV.letter_font
				-- Default Size: 1 --
				font[2] = font[2] * self.SV.letter_font_scale
				value:SetFont(table.concat(font, "|"))
			end
			-- DEFAULT USED AS STONE TABLET FONT --
			if (font[1] == "EsoUI/Common/Fonts/TrajanPro-Regular.slug") or (font[1] == "$(STONE_TABLET_FONT)") then
				font[1] = self.SV.tablet_font
				-- Default Size: 1 --
				font[2] = font[2] * self.SV.tablet_font_scale
				value:SetFont(table.concat(font, "|"))
			end
			-- -- DEFAULT USED AS GAMEPAD_LIGHT_FONT --
			if (font[1] == "EsoUI/Common/Fonts/FTN47.slug") or (font[1] == "$(GAMEPAD_LIGHT_FONT)") then
				font[1] = self.SV.menu_font
				-- Default Size: 1 --
				font[2] = font[2] * self.SV.menu_font_scale
				value:SetFont(table.concat(font, "|"))
			end
			-- DEFAULT USED AS GAMEPAD_MEDIUM_FONT --
			if (font[1] == "EsoUI/Common/Fonts/FTN57.slug") or (font[1] == "$(GAMEPAD_MEDIUM_FONT)") then
				font[1] = self.SV.menu_font
				-- Default Size: 1 --
				font[2] = font[2] * self.SV.menu_font_scale
				value:SetFont(table.concat(font, "|"))
			end
			-- DEFAULT USED AS GAMEPAD_BOLD_FONT --
			if (font[1] == "EsoUI/Common/Fonts/FTN87.slug") or (font[1] == "$(GAMEPAD_BOLD_FONT)") then
				font[1] = self.SV.menu_bold_font
				-- Default Size: 1 --
				font[2] = font[2] * self.SV.menu_bold_font_scale
				value:SetFont(table.concat(font, "|"))
			end
		end
	end
end

function FC:SetNameplateFont(style, size)
	local Font, CurrentFontStyle
	local NewFontAndSize = (self.SV.nameplate_font .. size)
	-- Gamepad Mode -- 
	if IsInGamepadPreferredMode() then
		CurrentFontAndSize, CurrentFontStyle = GetNameplateGamepadFont()
		if CurrentFontAndSize ~= NewFontAndSize or CurrentFontStyle ~= style then
			SetNameplateGamepadFont(self.SV.nameplate_font .. "|" .. size .. "|", style)
		end
		-- Keyboard Mode --
	else
		CurrentFontAndSize, CurrentFontStyle = GetNameplateKeyboardFont()
		if CurrentFontAndSize ~= NewFontAndSize or CurrentFontStyle ~= style then
			SetNameplateKeyboardFont(self.SV.nameplate_font .. "|" .. size .. "|", style)
		end
	end
end

function FC:SetSCTFont(style, size)
	local CurrentFontAndSize, CurrentFontStyle
	local NewFontAndSize = (self.SV.sct_font .. size)
	-- Gamepad Mode -- 
	if IsInGamepadPreferredMode() then
		CurrentFontAndSize, CurrentFontStyle = GetSCTGamepadFont()
		if CurrentFontAndSize ~= NewFontAndSize or CurrentFontStyle ~= style then
			SetSCTGamepadFont(self.SV.sct_font .. "|" .. size .. "|", style)
		end
		-- Keyboard Mode --
	else
		CurrentFontAndSize, CurrentFontStyle = GetSCTKeyboardFont()
		if CurrentFontAndSize ~= NewFontAndSize or CurrentFontStyle ~= style then
			SetSCTKeyboardFont(self.SV.sct_font .. "|" .. size .. "|", style)
		end
	end
end

function FC:ChangeChatFonts()
	local fontStyle = self.SV.chat_font
	local fontSize = GetChatFontSize()
	local fontWeight = self.SV.chat_style
	local fontName = string.format("%s|$(KB_%s)|%s", fontStyle, fontSize, fontWeight)
	-- Entry Box --
	ZoFontEditChat:SetFont(fontName)
	-- Chat Window --
	ZoFontChat:SetFont(fontName)
	-- Size --
	CHAT_SYSTEM:SetFontSize(CHAT_SYSTEM.GetFontSizeFromSetting())
end

function FC:SetDefaults()
	-- Set Defaults --

	-- Fonts
	if self.SV.menu_font == nil then
		self.SV.menu_font = self.SV.default_menu_font
	end
	if self.SV.menu_bold_font == nil then
		self.SV.menu_bold_font = self.SV.default_menu_bold_font
	end
	if self.SV.chat_font == nil then
		self.SV.chat_font = self.SV.default_chat_font
	end
	if self.SV.nameplate_font == nil then
		self.SV.nameplate_font = self.SV.default_nameplate_font
	end
	if self.SV.sct_font == nil then
		self.SV.sct_font = self.SV.default_sct_font
	end
	if self.SV.book_font == nil then
		self.SV.book_font = self.SV.default_book_font
	end
	if self.SV.letter_font == nil then
		self.SV.letter_font = self.SV.default_letter_font
	end
	if self.SV.tablet_font == nil then
		self.SV.tablet_font = self.SV.default_tablet_font
	end

	-- Scales
	if self.SV.menu_font_scale == nil then
		self.SV.menu_font_scale = self.SV.default_menu_font_scale
	end
	if self.SV.menu_bold_font_scale == nil then
		self.SV.menu_bold_font_scale = self.SV.default_menu_bold_font_scale
	end
	if self.SV.book_font_scale == nil then
		self.SV.book_font_scale = self.SV.default_book_font_scale
	end
	if self.SV.letter_font_scale == nil then
		self.SV.letter_font_scale = self.SV.default_letter_font_scale
	end
	if self.SV.tablet_font_scale == nil then
		self.SV.tablet_font_scale = self.SV.default_tablet_font_scale
	end

	-- Sizes
	if self.SV.nameplate_size == nil then
		self.SV.nameplate_size = self.SV.default_nameplate_size
	end
	if self.SV.sct_size == nil then
		self.SV.sct_size = self.SV.default_sct_size
	end

	-- Styles
	if self.SV.nameplate_style == nil then
		self.SV.nameplate_style = self.SV.default_nameplate_style
	end
	if self.SV.sct_style == nil then
		self.SV.sct_style = self.SV.default_sct_style
	end
	if self.SV.chat_style == nil then
		self.SV.chat_style = self.SV.default_chat_style
	end
end

function FC:SetupEvents(toggle)
	if toggle then
		EVENT_MANAGER:RegisterForEvent(self.name, EVENT_PLAYER_ACTIVATED, function(...)
			self:SetNameplateFont(self.SV.nameplate_style, self.SV.nameplate_size)
			self:SetSCTFont(self.SV.sct_style, self.SV.sct_size)
		end)
		EVENT_MANAGER:RegisterForEvent(self.name, EVENT_ZONE_CHANGED, function(...)
			self:SetSCTFont(self.SV.sct_style, self.SV.sct_size)
		end)
	else
		EVENT_MANAGER:UnregisterForEvent(self.name, EVENT_PLAYER_ACTIVATED)
		EVENT_MANAGER:UnregisterForEvent(self.name, EVENT_ZONE_CHANGED)
	end
end

function FC:Initialise()

	local manager = GetAddOnManager()

	for i = 1, manager:GetNumAddOns() do
		local name, _, _, _, _, state = manager:GetAddOnInfo(i)
		if name == self.name then
			self.version = manager:GetAddOnVersion(i)
		end
	end

	-- Load Saved Variables --
	self.SV = ZO_SavedVars:NewAccountWide("FontChangerSettings", self.version, "Settings", self.defaults)

	-- Run Functions --
	self:SetupEvents(true)
	self:SetDefaults()
	self:SetNameplateFont(self.SV.nameplate_style, self.SV.nameplate_size)
	self:SetSCTFont(self.SV.sct_style, self.SV.sct_size)
	self:SetUIFonts()
	self:ChangeChatFonts()
end

function FC.OnLoad(event, addonName)
	if addonName ~= FC.name then
		return
	end
	EVENT_MANAGER:UnregisterForEvent(FC.name, EVENT_ADD_ON_LOADED, FC.OnLoad)
	FC:InitialiseAddonMenu()
	FC:Initialise()
end

EVENT_MANAGER:RegisterForEvent(FC.name, EVENT_ADD_ON_LOADED, FC.OnLoad)

