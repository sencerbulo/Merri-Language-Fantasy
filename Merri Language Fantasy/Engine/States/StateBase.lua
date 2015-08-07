StateBase  = Core.class()

function StateBase:init( options )
	self.textures = {}
	self.bitmaps = {}
	self.fonts = {}
	self.labels = {}
	self.background = nil
	
	self:Setup( options )
end

-- Setup / Teardown --
function StateBase:Setup( options )
end

function StateBase:Cleanup()
end

function StateBase:Draw()
	if ( self.background ~= nil ) then stage:addChild( self.background ) end

	for key, value in pairs( self.bitmaps ) do
		print( "Draw bitmap ", key )
		stage:addChild( value )
	end
	
	for key, value in pairs( self.labels ) do
		print( "Draw label ", key )
		stage:addChild( value )
	end
end

-- Helpers --

function StateBase:ClickedButtonName( event )
	for key, value in pairs( self.bitmaps ) do
		if ( value:hitTestPoint( event.x, event.y ) ) then
			return key
		end
	end
end

-- Utils

function StateBase:SetBackground( options )
	if ( self.textures[ options.path ] == nil ) then
		print( "Load texture \"" .. options.path .. "\"" )
		self.textures[ options.path ] = Texture.new( options.path )
	end
	
	self.background = Bitmap.new( self.textures[ options.path ] )
end

-- options.id
-- options.path (texture)
-- options.pos_x
-- options.pos_y
-- options.scale_x
-- options.scale_y
-- options.rotate_angle
-- options.opacity
function StateBase:AddBitmap( options )
	if ( self.textures[ options.path ] == nil ) then
		print( "Load texture \"" .. options.path .. "\"" )
		self.textures[ options.path ] = Texture.new( options.path )
	end
	
	self.bitmaps[ options.id ] = Bitmap.new( self.textures[ options.path ] )
	
	if ( options.pos_x ~= nil and options.pos_y ~= nil ) then 
		self.bitmaps[ options.id ]:setPosition( options.pos_x, options.pos_y )
	end
	
	if ( options.scale_x ~= nil and options.scale_y ~= nil ) then
		self.bitmaps[ options.id ]:setScale( options.scale_x, options.scale_y )
	end
	
	if ( options.rotate_angle ~= nil ) then
		self.bitmaps[ options.id ]:setRotation( options.rotate_angle )
	end
	
	if ( options.opacity ~= nil ) then
		self.bitmaps[ options.id ]:setOpacity( options.opacity )
	end
end

-- options.id
-- options.path (font)
-- options.text
-- options.color
-- options.pos_x
-- options.pos_y
-- options.scale_x
-- options.scale_y
function StateBase:AddLabel( options )
	if ( self.fonts[ options.path ] == nil ) then
		print( "Load font \"" .. options.path .. "\"" )
		self.fonts[ options.path ] = TTFont.new( options.path, 16 )
	end
	
	self.labels[ options.id ] = TextField.new( self.fonts[ options.path ], options.text )
	
	if ( options.pos_x ~= nil and options.pos_y ~= nil ) then
		self.labels[ options.id ]:setPosition( options.pos_x, options.pos_y )
	end
	
	if ( options.scale_x ~= nil and options.scale_y ~= nil ) then
		self.labels[ options.id ]:setScale( options.scale_x, options.scale_y )
	end
	
	if ( options.color ~= nil ) then
		self.labels[ options.id ]:setTextColor( options.color )
	end
end

function StateBase:AddButton( options )
	self:AddBitmap( options.button )
	self:AddLabel( options.label )
end

-- Custom Logic --
function StateBase:Update()
end


