StateBase  = Core.class()

function StateBase:init( options )
	self.textures = {}
	self.bitmaps = {}
	self.fonts = {}
	self.labels = {}
	self.backgrounds = {}
	self.backgroundScroll = false
	
	self:Setup( options )
end

-- Setup / Teardown --
function StateBase:Setup( options )
	self.gotoState = ""
	if ( options ~= nil and options.backgroundScroll ~= nil and options.backgroundScroll ) then
		self.backgroundScroll = true
	end
end

function StateBase:Cleanup()
	
end

function StateBase:GotoState()
	return self.gotoState
end

function StateBase:SetGotoState( name )
	self.gotoState = name
end

function StateBase:Draw()
	for key, value in pairs( self.backgrounds ) do
		stage:addChild( value )
	end

	for key, value in pairs( self.bitmaps ) do
		stage:addChild( value )
	end
	
	for key, value in pairs( self.labels ) do
		stage:addChild( value )
	end
end

function StateBase:ClearScreen()
	for key, value in pairs( self.backgrounds ) do
		stage:removeChild( value )
	end

	for key, value in pairs( self.bitmaps ) do
		stage:removeChild( value )
	end
	
	for key, value in pairs( self.labels ) do
		stage:removeChild( value )
	end	
end

function StateBase:ClearWidgets()
	for key, value in pairs( self.bitmaps ) do
		value = nil
		self.bitmaps[ key ] = nil
	end
	
	for key, value in pairs( self.labels ) do
		value = nil
		self.labels[ key ] = nil
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
		self.textures[ options.path ] = Texture.new( options.path )
	end
	
	local w = self.textures[ options.path ]:getWidth()
	local h = self.textures[ options.path ]:getHeight()
	
	if ( w < GLOBAL_CONFIG.SCREEN_WIDTH and h < GLOBAL_CONFIG.SCREEN_HEIGHT ) then
		-- Add multiples
		for y = 0, GLOBAL_CONFIG.SCREEN_HEIGHT / h + 1 do
			for x = 0, GLOBAL_CONFIG.SCREEN_WIDTH / w + 1 do
				local tile = Bitmap.new( self.textures[ options.path ] ) 
				tile:setPosition( x * w, y * h )
				table.insert( self.backgrounds, tile )
			end
		end
	else
		table.insert( self.backgrounds, Bitmap.new( self.textures[ options.path ] ) )
	end
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
-- options.size
-- options.text
-- options.color
-- options.pos_x
-- options.pos_y
-- options.scale_x
-- options.scale_y
function StateBase:AddLabel( options )
	if ( self.fonts[ options.path .. options.size ] == nil ) then
		self.fonts[ options.path .. options.size ] = TTFont.new( options.path, options.size )
	end
	
	self.labels[ options.id ] = TextField.new( self.fonts[ options.path .. options.size ], options.text )
	
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
	if ( self.backgroundScroll ) then
		for key, tile in pairs( self.backgrounds ) do
			x, y = tile:getPosition()
			w = tile:getWidth()
			h = tile:getHeight()

			x = x - 1
			y = y - 1
			
			if ( x + w <= 0 ) then
				x = GLOBAL_CONFIG.SCREEN_WIDTH
			end
			if ( y + h <= 0 ) then
				y = GLOBAL_CONFIG.SCREEN_HEIGHT
			end
			
			tile:setPosition( x, y )
		end
	end
end


