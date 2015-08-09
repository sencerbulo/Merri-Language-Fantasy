GameMinerState = Core.class( StateBase )

Miner = Core.class()

function Miner:init( options )
	self.textures = {}
	self.textures.south1 = Texture.new( "Content/Graphics/Characters/miner_down.png" )
	self.textures.south2 = Texture.new( "Content/Graphics/Characters/miner_down2.png" )
	self.textures.north1 = Texture.new( "Content/Graphics/Characters/miner_up.png" )
	self.textures.north2 = Texture.new( "Content/Graphics/Characters/miner_up2.png" )
	self.textures.east1 = Texture.new( "Content/Graphics/Characters/miner_right.png" )
	self.textures.east2 = Texture.new( "Content/Graphics/Characters/miner_right2.png" )
	self.textures.west1 = Texture.new( "Content/Graphics/Characters/miner_left.png" )
	self.textures.west2 = Texture.new( "Content/Graphics/Characters/miner_left2.png" )
	self.bitmap = Bitmap.new( self.textures.south1 )
	self.moveAmount = 0
	self.frame = 1
	self.direction = "south"
	
	self.label = TextField.new( options.font, GameText:Get( "target", "Miner" ) )
	self.label:setTextColor( 0xFFFFFF )
end

function Miner:Face( direction )
	self.direction = direction
end

function Miner:Move( direction, amount )
	local x, y = self:getPosition()
	if ( direction == "south" ) then 		y = y + self.moveAmount		end
	if ( direction == "north" ) then 		y = y - self.moveAmount		end
	if ( direction == "east" ) then 		x = x + self.moveAmount		end
	if ( direction == "west" ) then 		x = x - self.moveAmount		end
	
	self:setPosition( x, y )
end

function Miner:setPosition( x, y )
	self.bitmap:setPosition( x, y )
	self.label:setPosition( x, y )
end

function Miner:getPosition()
	return self.bitmap:getPosition()
end

function Miner:Update()
	self.frame = self.frame + 0.05
	if ( self.frame >= 3 ) then
		self.frame = 1
	end
	local fr = math.floor( self.frame )
	self.bitmap:setTexture( self.textures[ self.direction .. fr ] )
end

function GameMinerState:init( options )
	StateBase:init( options )
	StateBase:Setup( { backgroundScroll = false } )
end

-- Setup / Teardown --
function GameMinerState:Setup( options )
	StateBase:SetGotoState( "" )
	StateBase:SetBackground( { id = "background", 		path = "Content/Graphics/UI/miner_background.png",  pos_x = 0, pos_y = 0 } )
		
	StateBase:AddButton( { button = { id = "btn_up", 			path = "Content/Graphics/UI/btn_up.png",  	pos_x = 150, pos_y = 411  }, } )
	StateBase:AddButton( { button = { id = "btn_down", 	path = "Content/Graphics/UI/btn_down.png",  	pos_x = 150, pos_y = 567  }, } )
	StateBase:AddButton( { button = { id = "btn_left", 			path = "Content/Graphics/UI/btn_left.png",  	pos_x = 72, pos_y = 489  }, } )
	StateBase:AddButton( { button = { id = "btn_right", 		path = "Content/Graphics/UI/btn_right.png",  	pos_x = 228, pos_y = 489  }, } )
	
	StateBase:AddButton( { button = { id = "btn_sword", 		path = "Content/Graphics/UI/btn_sword.png",  	pos_x = 0, pos_y = 360  }, } )
	StateBase:AddButton( { button = { id = "btn_pick", 		path = "Content/Graphics/UI/btn_pick.png",  	pos_x = 260, pos_y = 360  }, } )
	
	self.textures = {}
	self.textures.ground = Texture.new( "Content/Graphics/Tiles/ground_dirt.png" )
	self.textures.ground2 = Texture.new( "Content/Graphics/Tiles/ground_dirt2.png" )
	self.textures.walls = Texture.new( "Content/Graphics/Tiles/ground_cobblestone.png" )
	self.textures.rock = Texture.new( "Content/Graphics/Tiles/rock.png" )
	self.textures.gemA = Texture.new( "Content/Graphics/Tiles/gemA.png" )
	self.textures.gemB = Texture.new( "Content/Graphics/Tiles/gemB.png" )
	self.textures.gemC = Texture.new( "Content/Graphics/Tiles/gemC.png" )
	self.textures.gemD = Texture.new( "Content/Graphics/Tiles/gemD.png" )
	self.textures.coinA = Texture.new( "Content/Graphics/Tiles/copper_coin.png" )
	self.textures.coinB = Texture.new( "Content/Graphics/Tiles/silver_coin.png" )
	self.textures.coinC = Texture.new( "Content/Graphics/Tiles/gold_coin.png" )
	
	self.miningSfx = Sound.new( "Content/Audio/mining.wav" )
	self.collectSfx = Sound.new( "Content/Audio/collect.wav" )
	
	self.labelFont = TTFont.new( "Content/Fonts/NotoSans-Bold.ttf", 9 )
	
	self.player = Miner.new( { font = self.labelFont } )
	self.tileWidth = 0
	
	self.tiles = {}
	self:SetupMap()
	self:Draw()
	self:TurnBasedUpdate()
end

function GameMinerState:Cleanup()
end

function GameMinerState:Draw()
	StateBase:Draw()
	
	for key, value in pairs( self.tiles ) do
		stage:addChild( value.bitmap )
		if ( value.rock ~= nil ) then
			stage:addChild( value.rock.bitmap )
		end
		if ( value.label ~= nil ) then
			stage:addChild( value.label )
		end
	end
	
	stage:addChild( self.player.bitmap )
	stage:addChild( self.player.label )
end

function GameMinerState:SetupMap()
	local tileWidth = self.textures.ground:getWidth()
	self.tileWidth = tileWidth
	local maxX = GLOBAL_CONFIG.SCREEN_WIDTH / tileWidth - 1
	local maxY = GLOBAL_CONFIG.SCREEN_WIDTH / tileWidth - 1
	
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
	
	local tileCount = math.random( 100, 120 )
	
	local startX = 0
	local startY = math.random( 0, maxY )
	local endX = 9
	local endY = math.random( 0, maxY )
	
	print( "Start \t", startX, ", ", startY, "\nEnd \t", endX, ", ", endY )
	
	-- Traverse
	local x = startX
	local y = startY
	self.player:setPosition( x * tileWidth, y * tileWidth )
	self.player.moveAmount = tileWidth
	
	while ( x ~= endX or y ~= endY ) do
		if ( x == startX and y == startY ) then
			self.tiles[ x .. "-" .. y ].type = "ground2"
		else
			self.tiles[ x .. "-" .. y ].type = "ground"
		end -- if ( x == startX and y == startY ) then
		
		-- Branch?
		local branch = 1
		if ( branch == 1 ) then
			--if ( self.tiles[ subX .. "-" .. subY ] ~= nil ) then self.tiles[ subX .. "-" .. subY ].type = "ground2" end
		end -- if ( branch == 1 ) then
		
		local xOrY = math.random( 1, 2 )		
		if ( xOrY == 1 ) then
			if ( endX < x ) then
				x = x - 1
			elseif ( endX > x ) then
				x = x + 1
			end
		else	
			if ( endY < y ) then
				y = y - 1
			elseif ( endY > y ) then
				y = y + 1
			end
		end -- if ( xOrY == 1 ) then
	end -- while ( x ~= endX or y ~= endY ) do
	
	self.tiles[ x .. "-" .. y ].type = "ground2"
	
	
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
	
	local dir
	local tileName = tx .. "-" .. ty
	local tryToMove = false
	
	if ( clickedButton == "btn_up" ) then
		dir = "north"
		tileName = tx .. "-" .. ty - 1
		tryToMove = true
			
	elseif ( clickedButton == "btn_down" ) then
		dir = "south"
		tileName = tx .. "-" .. ty + 1
		tryToMove = true
	
	elseif ( clickedButton == "btn_left" ) then
		dir = "west"
		tileName = tx - 1 .. "-" .. ty
		tryToMove = true
	
	elseif ( clickedButton == "btn_right" ) then
		dir = "east"
		tileName =  tx + 1 .. "-" .. ty
		tryToMove = true
	
	elseif ( clickedButton == "btn_pick" ) then
		if 			( self.player.direction == "north" ) then		tileName = tx .. "-" .. ty - 1
		elseif 	( self.player.direction == "south" ) then		tileName = tx .. "-" .. ty + 1
		elseif 	( self.player.direction == "east" ) then		tileName = tx + 1 .. "-" .. ty
		elseif 	( self.player.direction == "west" ) then		tileName = tx - 1 .. "-" .. ty
		end
	
		if ( self.tiles[ tileName ] ~= nil and self.tiles[ tileName ].itemType == "rock" ) then
			self.miningSfx:play()
			
			local randomItem = math.random( 1, 7 )	-- 4 gems, 3 coins
			
			if ( randomItem == 1 ) then 				self.tiles[ tileName ].itemType = "gemA"
			elseif ( randomItem == 2 ) then 		self.tiles[ tileName ].itemType = "gemB"
			elseif ( randomItem == 3 ) then 		self.tiles[ tileName ].itemType = "gemC"
			elseif ( randomItem == 4 ) then 		self.tiles[ tileName ].itemType = "gemD"
			elseif ( randomItem == 5 ) then 		self.tiles[ tileName ].itemType = "coinA"
			elseif ( randomItem == 6 ) then 		self.tiles[ tileName ].itemType = "coinB"
			elseif ( randomItem == 7 ) then 		self.tiles[ tileName ].itemType = "coinC"
			end
			
			self.tiles[ tileName ].label:setText( GameText:Get( "target", self.tiles[ tileName ].itemType ) )			
			self.tiles[ tileName ].rock.bitmap:setTexture( self.textures[ self.tiles[ tileName ].itemType ] )
		end
		
	
	elseif ( clickedButton == "btn_sword" ) then
	
	end
	
	if ( tryToMove ) then
		self.player:Face( dir )
		if ( self.tiles[ tileName ] ~= nil and self.tiles[ tileName ].type == "ground" and self.tiles[ tileName ].itemType ~= "rock" ) then
			self.player:Move( dir )
			
			if ( self.tiles[ tileName ].itemType ~= "none" and self.tiles[ tileName ].itemType ~= "rock" ) then
				stage:removeChild( self.tiles[ tileName ].rock.bitmap )
				stage:removeChild( self.tiles[ tileName ].label )
				self.tiles[ tileName ].itemType = "none"
				self.collectSfx:play()
			end
			
		end
	end
	
	self:TurnBasedUpdate()
end

function GameMinerState:TurnBasedUpdate()
	-- adjust lighting
	local x, y = self.player:getPosition()
	for key, tile in pairs( self.tiles ) do
		local distance = math.floor( self:GetDistance( x, y, tile.x, tile.y ) / 36 )
		local alpha = 1 - ( 0.25 * ( distance - 1 ) )
		--tile.bitmap:setAlpha( alpha )
		
		if ( tile.rock ~= nil ) then
			--tile.rock.bitmap:setAlpha( alpha )	
		end
		if ( tile.label ~= nil ) then
			--tile.label:setAlpha( alpha )
		end
	end
end

function GameMinerState:GetDistance( x1, y1, x2, y2 )
	local xd = x1 - x2
	local yd = y1 - y2
	return math.sqrt( xd * xd + yd * yd )
end

function GameMinerState:Handle_EnterFrame( event )
	StateBase:Update()
	self.player:Update()
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