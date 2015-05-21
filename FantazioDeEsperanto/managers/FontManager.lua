FontManager = Core.class()

function FontManager:init()
	self:AddFont( "title", "ModernAntiqua-40", 20 )
	self:AddFont( "header", "ConsolaMono-Bold-30", 22 )
	self:AddFont( "gamey", "ConsolaMono-Bold-24", 14 )
	self:AddFont( "small", "ConsolaMono-Bold-20", 12 )
	self:AddFont( "smaller", "ConsolaMono-Bold-15", 9 )
	self:AddFont( "tiny", "ConsolaMono-12",9 )
end

function FontManager:AddFont( key, fontName, width )
	local path = "content/fonts/"
	self[ key ] = {}
	if fontName ~= nil then
		self[ key ].font = Font.new( path .. fontName .. ".txt", path .. fontName .. ".png" )
	else
		self[ key ].font = nil
	end
	self[ key ].width = width
end

