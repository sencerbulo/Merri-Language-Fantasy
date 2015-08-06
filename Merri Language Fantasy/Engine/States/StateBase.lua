StateBase  = Core.class()

function StateBase:init( options )
	self.textures = {}
	self.bitmaps = {}
	
	self:Setup( options )
end

-- Setup / Teardown --
function StateBase:Setup( options )
end

function StateBase:Cleanup()
end

function StateBase:Draw()
	for key, value in pairs( self.bitmaps ) do
		stage:addChild( value )
	end
end

-- Callbacks --
function StateBase:Handle_AndroidKey( event )
end

function StateBase:Handle_KeyDown( event )
end

function StateBase:Handle_MouseDown( event )
end

function StateBase:Handle_EnterFrame( event )
end

-- Utils

-- options.id
-- options.path
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

-- Custom Logic --
function StateBase:Update()
end


