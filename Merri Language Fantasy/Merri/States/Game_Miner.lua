GameMinerState = Core.class( StateBase )

Miner = Core.class()

function Miner:init( options )
	self.textures = {}
	self.textures.south = Texture.new( "Content/Graphics/Characters/miner_down.png" )
	self.bitmap = Bitmap.new( self.textures.south )
	self.moveAmount = 0
end

function Miner:setPosition( x, y )
	self.bitmap:setPosition( x, y )
end

function Miner:getPosition()
	return self.bitmap:getPosition()
end

function GameMinerState:init( options )
	StateBase:init( options )
	StateBase:Setup( { backgroundScroll = false } )
end

-- Setup / Teardown --
function GameMinerState:Setup( options )
	StateBase:SetGotoState( "" )
	StateBase:SetBackground( { id = "background", 		path = "Content/Graphics/UI/blank_background.png",  pos_x = 0, pos_y = 0 } )
		
	StateBase:AddButton( { button = { id = "btn_up", 			path = "Content/Graphics/UI/btn_up.png",  	pos_x = 150, pos_y = 411  }, } )
	StateBase:AddButton( { button = { id = "btn_down", 	path = "Content/Graphics/UI/btn_down.png",  	pos_x = 150, pos_y = 567  }, } )
	StateBase:AddButton( { button = { id = "btn_left", 			path = "Content/Graphics/UI/btn_left.png",  	pos_x = 72, pos_y = 489  }, } )
	StateBase:AddButton( { button = { id = "btn_right", 		path = "Content/Graphics/UI/btn_right.png",  	pos_x = 228, pos_y = 489  }, } )
	
	self.player = Miner.new()
	self.tileWidth = 0
	
	self:SetupMap()
	self:Draw()
end

function GameMinerState:Cleanup()
end

function GameMinerState:Draw()
	StateBase:Draw()
	
	for key, value in pairs( self.tiles ) do
		stage:addChild( value.bitmap )
	end
	
	stage:addChild( self.player.bitmap )
end

function GameMinerState:SetupMap()
	self.textures = {}
	self.textures.ground = Texture.new( "Content/Graphics/Tiles/ground_dirt.png" )
	self.textures.ground2 = Texture.new( "Content/Graphics/Tiles/ground_dirt2.png" )
	self.textures.walls = Texture.new( "Content/Graphics/Tiles/ground_cobblestone.png" )
	
	self.tiles = {}
	
	local tileWidth = self.textures.ground:getWidth()
	self.tileWidth = tileWidth
	local maxX = GLOBAL_CONFIG.SCREEN_WIDTH / tileWidth
	local maxY = GLOBAL_CONFIG.SCREEN_WIDTH / tileWidth
	
	-- Initialize all tiles as walls
	local tileCount = 0
	for y = 0, maxY do
		for x = 0, maxX do
			self.tiles[ x .. "-" .. y ] = {}
			self.tiles[ x .. "-" .. y ].type = "wall"
			self.tiles[ x .. "-" .. y ].x = x * tileWidth
			self.tiles[ x .. "-" .. y ].y = y * tileWidth
			tileCount = tileCount + 1
		end
	end
	
	print( "Tile count: ", tileCount )
	
	local tileCount = math.random( 75, 120 )
	
	local x = 0
	local y = math.random( 0, maxY )
	self.player:setPosition( x * tileWidth, y * tileWidth )
	self.player.moveAmount = tileWidth
	
	-- 1 = left, 2 = right, 3 = up, 4 = down
	local lastDirection = 1
	for i = 0, tileCount do
		self.tiles[ x .. "-" .. y ].type = "ground"
		
		local dir = lastDirection
		local validDirection = false
		while ( dir == lastDirection and validDirection == false ) do
			dir = math.random( 1, 4 )
			
			if ( dir == 1 and x - 1 > 0 )	 			then 		validDirection = true 		end
			if ( dir == 2 and x + 1 <= maxX ) 	then 		validDirection = true 		end
			if ( dir == 3 and y - 1 > 0 )	 			then 		validDirection = true 		end
			if ( dir == 4 and y + 1 <= maxY ) 	then 		validDirection = true 		end
		end
		
		if ( dir == 1 ) then
			if ( self.tiles[ x-1 .. "-" .. y ] ~= nil ) then 		x = x - 1 		end
		
		elseif ( dir == 2 ) then
			if ( self.tiles[ x+1 .. "-" .. y ] ~= nil ) then 		x = x + 1 		end
		
		elseif ( dir == 3 ) then
			if ( self.tiles[ x .. "-" .. y-1 ] ~= nil ) then 		y = y - 1 		end
		
		else
			if ( self.tiles[ x .. "-" .. y+1 ] ~= nil ) then 		y = y + 1 		end
		
		end
	end
	
	-- Setup bitmaps
	for key, tile in pairs( self.tiles ) do
		if ( tile.type == "wall" ) then
			tile.bitmap = Bitmap.new( self.textures.walls ) 
			
		elseif (tile.type == "ground2" ) then
			tile.bitmap = Bitmap.new( self.textures.ground2 )
		
		else
			tile.bitmap = Bitmap.new( self.textures.ground )
		
		end
		
		tile.bitmap:setPosition( tile.x, tile.y )
	end	
end

-- Cyclical --
function GameMinerState:Update()
end

-- Callbacks --
function GameMinerState:Handle_AndroidKey( event )
end

function GameMinerState:Handle_KeyDown( event )
end

function GameMinerState:Handle_MouseDown( event )
	clickedButton = StateBase:ClickedButtonName( event )
	
	local x, y = self.player:getPosition()
	local tx = x / self.tileWidth
	local ty = y / self.tileWidth
	
	if ( clickedButton == "btn_up" ) then
		if ( self.tiles[ tx .. "-" .. ty - 1 ] ~= nil and self.tiles[ tx .. "-" .. ty - 1 ].type == "ground" ) then
			y = y - self.player.moveAmount
		end
			
	elseif ( clickedButton == "btn_down" ) then
		if ( self.tiles[ tx .. "-" .. ty + 1 ] ~= nil and self.tiles[ tx .. "-" .. ty + 1 ].type == "ground" ) then
			y = y + self.player.moveAmount
		end
	
	elseif ( clickedButton == "btn_left" ) then
		if ( self.tiles[ tx - 1 .. "-" .. ty ] ~= nil and self.tiles[ tx - 1 .. "-" .. ty ].type == "ground" ) then
			x = x - self.player.moveAmount
		end
	
	elseif ( clickedButton == "btn_right" ) then
		if ( self.tiles[ tx + 1 .. "-" .. ty ] ~= nil and self.tiles[ tx + 1 .. "-" .. ty ].type == "ground" ) then
			x = x + self.player.moveAmount
		end
	end
	self.player:setPosition( x, y )
	
	
end

function GameMinerState:Handle_EnterFrame( event )
	StateBase:Update()
end

function GameMinerState:ClearScreen()
	StateBase:ClearScreen()	
end

function GameMinerState:ClearWidgets()
	StateBase:ClearWidgets()
end

function GameMinerState:GotoState()
	return StateBase:GotoState()
end