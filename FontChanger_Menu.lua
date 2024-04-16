local FC = FontChanger or {}
local LAM2 = LibAddonMenu2
--[[
function FC:DefaultEverything()
  self:SetFont(self.defaults.font, self.defaults.style, self.defaults.size)
end
]]--
function FC:InitialiseAddonMenu()
  local panelData = {
    type = "panel",
    name = "FontChanger",
    displayName = "|c4B8BFEFont Changer|r",
    author = "|c4B8BFEFerrety|r, |cFF1493Antisenil|r",
	version = self.version,
    slashCommand = "/fc",
    registerForRefresh = true,
    registerForDefaults = true,
  }

  local optionsData = {}
	
  table.insert(optionsData, {
    type = "dropdown",
    name = "Menu/UI Font Scale",
    choices = FC.FONT_SCALING_CHOICES,
    choicesValues = FC.FONT_SCALING_VALUES,
	tooltip = "Changes the size for normal font, mostly used in descriptions (mouseover texts) and in the eso settings menu.",
    getFunc = function() return self.SV.menu_font_scale end,
    setFunc = function(menu_font_scale) self.SV.menu_font_scale=menu_font_scale self:SetUIFonts() end,
    default = function() self:SetUIFonts() return self.defaults.default_menu_font_scale end,
	warning = "Reload UI Required.",
    scrollable = true,
  })
  
  table.insert(optionsData, {
    type = "dropdown",
    name = "Menu/UI Bold Font Scale",
    choices = FC.FONT_SCALING_CHOICES,
    choicesValues = FC.FONT_SCALING_VALUES,
	tooltip = "Changes the size for bold font, most texts in ESO use this font.",
    getFunc = function() return self.SV.menu_bold_font_scale end,
    setFunc = function(menu_bold_font_scale) self.SV.menu_bold_font_scale=menu_bold_font_scale self:SetUIFonts() end,
    default = function() self:SetUIFonts() return self.defaults.default_menu_bold_font_scale end,
    warning = "Reload UI Required.",
    scrollable = true,
  })
  
  table.insert(optionsData, {
    type = "dropdown",
    name = "Scripture/Book Font Scale",
    choices = FC.FONT_SCALING_CHOICES,
    choicesValues = FC.FONT_SCALING_VALUES,
	tooltip = "Changes the text size in books etc",
    getFunc = function() return self.SV.book_font_scale end,
    setFunc = function(book_font_scale) self.SV.book_font_scale=book_font_scale self:SetUIFonts() end,
    default = function() self:SetUIFonts() return self.defaults.default_book_font_scale end,
    warning = "Reload UI Required.",
    scrollable = true,
  })

  table.insert(optionsData, {
    type = "dropdown",
    name = "Nameplate Font Size",
    choices = FC.FONTSIZE_CHOICES,
    choicesValues = FC.FONTSIZE_VALUES,
	tooltip = "Changes the size of all nameplates.",
    getFunc = function() return self.SV.nameplate_size end,
    setFunc = function(nameplate_size) self.SV.nameplate_size=nameplate_size self:SetNameplateFont(self.SV.nameplate_style, self.SV.nameplate_size) end,
    default = function() self:SetNameplateFont(self.defaults.default_nameplate_style, self.defaults.default_nameplate_size) return self.defaults.default_nameplate_size end,
    scrollable = true,
  })

  table.insert(optionsData, {
    type = "dropdown",
    name = "Nameplate Font Style",
    choices = FC.FONTSTYLE_CHOICES,
    choicesValues = FC.FONTSTYLE_VALUES,
	tooltip = "Changes the style of nameplates.",
    getFunc = function() return self.SV.nameplate_style end,
    setFunc = function(nameplate_style) self.SV.nameplate_style=nameplate_style self:SetNameplateFont(self.SV.nameplate_style, self.SV.nameplate_size) end,
    default = function() self:SetNameplateFont(self.defaults.default_nameplate_style, self.defaults.default_nameplate_size) return self.defaults.default_nameplate_style end,
    scrollable = false,
  })
  
    table.insert(optionsData, {
    type = "dropdown",
    name = "SCT Font Size",
    choices = FC.FONTSIZE_CHOICES,
    choicesValues = FC.FONTSIZE_VALUES,
	tooltip = "Changes the size of scrolling combat text(SCT).",
    getFunc = function() return self.SV.sct_size end,
    setFunc = function(sct_size) self.SV.sct_size=sct_size self:SetSCTFont(self.SV.sct_style, self.SV.sct_size) end,
    default = function() self:SetSCTFont(self.defaults.default_sct_style, self.defaults.default_sct_size) return self.defaults.default_sct_size end,
    scrollable = true,
  })

  table.insert(optionsData, {
    type = "dropdown",
    name = "SCT Font Style",
    choices = FC.FONTSTYLE_CHOICES,
    choicesValues = FC.FONTSTYLE_VALUES,
	tooltip = "Changes the style of SCT",
    getFunc = function() return self.SV.sct_style end,
    setFunc = function(sct_style) self.SV.sct_style=sct_style self:SetSCTFont(self.SV.sct_style, self.SV.sct_size) end,
    default = function() self:SetSCTFont(self.defaults.default_sct_style, self.defaults.default_sct_size) return self.defaults.default_sct_style end,
    scrollable = false,
  })

  table.insert(optionsData, {
    type = "dropdown",
    name = "Chat Font Style",
    choices = FC.FONTWEIGHT_CHOICES,
    choicesValues = FC.FONTWEIGHT_VALUES,
	tooltip = "Changes the style of chat font.",
    getFunc = function() return self.SV.chat_style end,
    setFunc = function(chat_style) self.SV.chat_style=chat_style self:ChangeChatFonts() end,
    default = function() self:ChangeChatFonts() return self.defaults.default_chat_style end,
	warning = "Reload UI Required.",
    scrollable = false,
  })

  LAM2:RegisterAddonPanel("FontChangerAddonOptions", panelData)
  LAM2:RegisterOptionControls("FontChangerAddonOptions", optionsData)
end