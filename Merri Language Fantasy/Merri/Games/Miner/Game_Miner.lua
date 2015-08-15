GameMinerState = Core.class( StateBase )

Map = Core.class()

function Map:init( options )
	-- Load tiles & characters
	self.textures = {
			ground = Texture.new( "Content/Games/Miner/Tiles/ground_dirt.png" ),
			wall = Texture.new( "Content/Games/Miner/Tiles/ground_cobblestone.png" ),
			ceiling = Texture.new( "Content/Games/Miner/Tiles/ground_darkstone.png" ),
			
			rock = Texture.new( "Content/Games/Miner/Tiles/rock.png" ),
			gemA = Texture.new( "Content/Games/Miner/Tiles/gemA.png" ),
			gemB = Texture.new( "Content/Games/Miner/Tiles/gemB.png" ),
			gemC = Texture.new( "Content/Games/Miner/Tiles/gemC.png" ),
			gemD = Texture.new( "Content/Games/Miner/Tiles/gemD.png" ),
			coinA = Texture.new( "Content/Games/Miner/Tiles/copper_coin.png" ),
			coinB = Texture.new( "Content/Games/Miner/Tiles/silver_coin.png" ),
			coinC = Texture.new( "Content/Games/Miner/Tiles/gold_coin.png" ),
			sandwich = Texture.new( "Content/Games/Miner/Tiles/sandwich.png" ),
			ladder = Texture.new( "Content/Games/Miner/Tiles/ladder_down.png" ),
			snail = Texture.new( "Content/Games/Miner/Characters/enemy_snail.png" ),
			mole = Texture.new( "Content/Games/Miner/Characters/enemy_mole.png" ),
		}
		
	self.tileWidth = self.textures.ground:getWidth()
	self.floor = 1
	self.lastFloor = 20
	self.mapWidth = 10
	self.mapHeight = 14
		
	self.tiles = {}
	for x = 0, self.mapWidth do
		self.tiles[x] = {}
		for y = 0, self.mapHeight do
			self.tiles[x][y] = {}
		end
	end
end

function Map:Generate()
	-- Initialize entire map as wall
	for y = 0, self.mapHeight do
		for x = 0, self.mapWidth do
			self.tiles[x][y].type = "ceiling"
			self.tiles[x][y].bitmap = Bitmap.new( self.textures[ self.tiles[x][y].type ] )
			self.tiles[x][y].bitmap:setPosition( x * self.tileWidth, y * self.tileWidth )
		end
	end
		
	-- Generate paths
	local tileCount = math.random( 100, 120 )
	
	local startX = 0
	local startY = math.random( 0, self.mapHeight )
	local endX = self.mapWidth - 1
	local endY = math.random( 0, self.mapHeight )
	
	-- Traverse Map
	local x = startX
	local y = startY
	
	local roomPoints = {}
	table.insert( roomPoints, { x = endX, y = endY } )
	for i = 0, math.random( 5, 10 ) do
		local room = { x = math.random( 1, self.mapWidth - 1 ), y = math.random( 1, self.mapHeight - 1 ) }
		table.insert( roomPoints, room )
	end
	
	-- Add paths between each room
	for key, point in pairs( roomPoints ) do
		endX = point.x
		endY = point.y
		
		while ( x ~= endX or y ~= endY ) do
			self.tiles[x][y].type = "ground"
			self.tiles[x][y].bitmap:setTexture( self.textures[ self.tiles[x][y].type ] )
			
			local xOrY = math.random( 1, 2 )
			if ( xOrY == 1 ) then
				if ( endX < x ) then				x = x - 1
				elseif ( endX > x ) then		x = x + 1
				end
			else
				if ( endY < y ) then				y = y - 1
				elseif ( endY > y ) then		y = y + 1
				end
			end -- if ( xOrY == 1 ) then
		end -- while ( x ~= endX or y ~= endY ) do
	end
	
	-- last tile
	self.tiles[x][y].type = "ground"
	self.tiles[x][y].bitmap:setTexture( self.textures[ self.tiles[x][y].type ] )
	
	-- add ceilings: CEILING, WALL, FLOOR
	for y = 0, self.mapHeight do
		for x = 0, self.mapWidth do
			if ( self.tiles[x][y].type == "ground" ) then
				if ( self.tiles[x][y - 1] ~= nil and self.tiles[x][y - 1].type == "ceiling" 
					and ( ( self.tiles[x][y - 2] ~= nil and self.tiles[x][y - 2].type == "ceiling" ) or self.tiles[x][y - 2] == nil ) ) then
				self.tiles[x][y - 1].type = "wall"
				self.tiles[x][y - 1].bitmap:setTexture( self.textures[ self.tiles[x][y - 1].type ] )
				
				elseif ( self.tiles[x][y - 1] ~= nil and self.tiles[x][y - 1].type == "ceiling" and self.tiles[x][y - 2] ~= nil and self.tiles[x][y - 2].type == "ground" ) then
				self.tiles[x][y - 1].type = "ground"
				self.tiles[x][y - 1].bitmap:setTexture( self.textures[ self.tiles[x][y - 1].type ] )
				end
			end
		end
	end
	
	-- Add items
	for y = 0, self.mapHeight do
		for x = 0, self.mapWidth do
			if ( self.tiles[x][y].type == "ground" ) then
			
			end
		end
	end
	
end

function Map:Draw()
	for y = 0, self.mapHeight do
		for x = 0, self.mapWidth do
			stage:addChild( self.tiles[x][y].bitmap )			
		end
	end
end

function GameMinerState:init( options )
	StateBase:init( options )
	StateBase:Setup( { backgroundScroll = false } )
end

-- Setup / Teardown --
function GameMinerState:Setup( options )
	self.enableLighting = true
	StateBase:SetGotoState( "" )
	
	-- Setup UI
	StateBase:SetBackground( { id = "background", 		path = "Content/Games/Miner/UI/miner_background.png",  pos_x = 0, pos_y = 0 } )
	
	self.textures = {
			black = Texture.new( "Content/Graphics/UI/blank_background.png" ),
		}
		
	self.sounds = {
		mining = Sound.new( "Content/Audio/mining.wav" ),
		collect = Sound.new( "Content/Audio/collect.wav" ),
		footsteps = Sound.new( "Content/Audio/footsteps.wav" ),
		hurt = Sound.new( "Content/Audio/hurt.wav" ),
		sword = Sound.new( "Content/Audio/sword.wav" ),
	}
	
	self.fonts = {
		overhead = TTFont.new( "Content/Fonts/NotoSans-Bold.ttf", 9 ),
		hud = TTFont.new( "Content/Fonts/NotoSans-Bold.ttf", 14 ),
	}
	
	-- Fade out graphic
	self.fadeCounter = 0
	self.transition = false
	self.fadeBitmap = Bitmap.new( self.textures.black )
	self.fadeBitmap:setAlpha( 0 )
	
	-- Set up map
	self.map = Map.new()
	self.map:Generate()
	
	self:Draw()
end

function GameMinerState:Cleanup()
end

function GameMinerState:Draw()
	StateBase:Draw()
	self.map:Draw()
end

function GameMinerState:SetupMap()
end

function GameMinerState:Update()
end

-- Callbacks --
function GameMinerState:Handle_AndroidKey( event )
end

function GameMinerState:Handle_KeyDown( event )
end

function GameMinerState:Handle_MouseDown( event )

end

function GameMinerState:TurnBasedUpdate()

end

function GameMinerState:GetDistance( x1, y1, x2, y2 )
	local xd = x1 - x2
	local yd = y1 - y2
	return math.sqrt( xd * xd + yd * yd )
end

function GameMinerState:Handle_EnterFrame( event )
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