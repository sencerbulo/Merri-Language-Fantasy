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
	self.health = 3
	
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
	self.enableLighting = true
	StateBase:SetGotoState( "" )
	StateBase:SetBackground( { id = "background", 		path = "Content/Graphics/UI/miner_background.png",  pos_x = 0, pos_y = 0 } )
		
	StateBase:AddButton( { button = { id = "btn_up", 			path = "Content/Graphics/UI/btn_up.png",  	pos_x = 150, pos_y = 411  }, } )
	StateBase:AddButton( { button = { id = "btn_down", 	path = "Content/Graphics/UI/btn_down.png",  	pos_x = 150, pos_y = 567  }, } )
	StateBase:AddButton( { button = { id = "btn_left", 			path = "Content/Graphics/UI/btn_left.png",  	pos_x = 72, pos_y = 489  }, } )
	StateBase:AddButton( { button = { id = "btn_right", 		path = "Content/Graphics/UI/btn_right.png",  	pos_x = 228, pos_y = 489  }, } )
	
	StateBase:AddButton( { button = { id = "btn_sword", 		path = "Content/Graphics/UI/btn_sword.png",  	pos_x = 0, pos_y = 360  }, } )
	StateBase:AddButton( { button = { id = "btn_pick", 	path = "Content/Graphics/UI/btn_pick.png",  	pos_x = 260, pos_y = 360  }, } )
	
	self.textures = {}
	self.textures.black = Texture.new( "Content/Graphics/UI/blank_background.png" )
	self.textures.ground = Texture.new( "Content/Graphics/Tiles/ground_dirt.png" )
	self.textures.ground2 = Texture.new( "Content/Graphics/Tiles/ground_dirt2.png" )
	self.textures.walls = Texture.new( "Content/Graphics/Tiles/ground_cobblestone.png" )
	self.textures.rock = Texture.new( "Content/Graphics/Tiles/rock.png" )
	self.textures.gemA = Texture.new( "Content/Graphics/Tiles/gemA.png" )
	self.textures.gemB = Texture.new( "Content/Graphics/Tiles/gemB.png" )
	self.textures.gemC = Texture.new( "Content/Graphics/Tiles/gemC.png" )
	self.textures.gemD = Texture.new( "Content/Graphics/Tiles/gemD.png" )
	self.textures.sandwich = Texture.new( "Content/Graphics/Tiles/sandwich.png" )
	self.textures.coinA = Texture.new( "Content/Graphics/Tiles/copper_coin.png" )
	self.textures.coinB = Texture.new( "Content/Graphics/Tiles/silver_coin.png" )
	self.textures.coinC = Texture.new( "Content/Graphics/Tiles/gold_coin.png" )
	self.textures.ladder = Texture.new( "Content/Graphics/Tiles/ladder_down.png" )
	self.textures.snail = Texture.new( "Content/Graphics/Characters/enemy_snail.png" )
	self.textures.mole = Texture.new( "Content/Graphics/Characters/enemy_mole.png" )
	self.textures.heart = Texture.new( "Content/Graphics/UI/heart.png" )
	
	self.miningSfx = Sound.new( "Content/Audio/mining.wav" )
	self.collectSfx = Sound.new( "Content/Audio/collect.wav" )
	self.footstepsSfx = Sound.new( "Content/Audio/footsteps.wav" )
	self.hurtSfx = Sound.new( "Content/Audio/hurt.wav" )
	self.swordSfx = Sound.new( "Content/Audio/sword.wav" )
	
	self.fadeCounter = 0
	self.transition = false
	self.fadeBitmap = Bitmap.new( self.textures.black )
	self.fadeBitmap:setAlpha( 0 )
	self.moveAmount = self.textures.ground:getWidth()
	
	self.labelFont = TTFont.new( "Content/Fonts/NotoSans-Bold.ttf", 9 )
	self.scoreFont = TTFont.new( "Content/Fonts/NotoSans-Bold.ttf", 14 )
	
	self.player = Miner.new( { font = self.labelFont } )
	
	self.level = 1
	self.levelText = TextField.new( self.scoreFont, GameText:Get( "target", "Level" ) .. ": " .. self.level )
	self.levelText:setTextColor( 0xFFFFFF )
	self.levelText:setPosition( 10, 350 )
	
	self.score = 0
	self.scoreText = TextField.new( self.scoreFont, GameText:Get( "target", "Money" ) .. ": " .. self.score )
	self.scoreText:setTextColor( 0xFFFFFF )
	self.scoreText:setPosition( 150, 350 )
	
	self.enemies = {}
	
	self.hearts = {}
	for i = 0, 2 do
		local heart = Bitmap.new( self.textures.heart )
		heart:setPosition( 300 + 20 * i, 340 )
		table.insert( self.hearts, heart )
	end
	
	local tileWidth = self.textures.ground:getWidth()
	self.tileWidth = tileWidth
	
	self.tiles = {}
	self:SetupMap()
end

function GameMinerState:Cleanup()
end

function GameMinerState:Draw()
	StateBase:Draw()
	
	for key, value in pairs( self.tiles ) do
		stage:addChild( value.bitmap )
	end
	for key, value in pairs( self.tiles ) do
		if ( value.rock ~= nil ) then
			stage:addChild( value.rock.bitmap )
		end
		if ( value.label ~= nil ) then
			stage:addChild( value.label )
		end
	end
	
	for key, enemy in pairs( self.enemies ) do
		stage:addChild( enemy.bitmap )
		stage:addChild( enemy.label )
	end
	
	for key, value in pairs( self.hearts ) do
		stage:addChild( value )
	end
	
	stage:addChild( self.player.bitmap )
	stage:addChild( self.player.label )
	stage:addChild( self.levelText )
	stage:addChild( self.scoreText )
end

function GameMinerState:SetupMap()
	self:ClearMap()
	self:GenerateMap()
end

function GameMinerState:ClearMap()
	-- Remove existing tiles
	for key, tile in pairs( self.tiles ) do
		stage:removeChild( tile.bitmap )
		
		if ( tile.rock ~= nil and stage:contains( tile.rock.bitmap ) ) then	stage:removeChild( tile.rock.bitmap ) end
		if ( tile.label ~= nil and stage:contains( tile.label ) ) then stage:removeChild( tile.label ) end
		self.tiles[ key ] = nil
	end
	
	for key, enemy in pairs( self.enemies ) do
		stage:removeChild( enemy.bitmap )
		stage:removeChild( enemy.label )
		self.enemies[ key ] = nil
	end
end

function GameMinerState:GenerateMap()
	local maxX = GLOBAL_CONFIG.SCREEN_WIDTH / self.tileWidth - 1
	local maxY = GLOBAL_CONFIG.SCREEN_WIDTH / self.tileWidth - 1
	-- Initialize all tiles as walls
	local tileCount = 0
	for y = 0, maxY do
		for x = 0, maxX do
			self.tiles[ x .. "-" .. y ] = {}
			self.tiles[ x .. "-" .. y ].type = "wall"
			self.tiles[ x .. "-" .. y ].x = x * self.tileWidth
			self.tiles[ x .. "-" .. y ].y = y * self.tileWidth
			tileCount = tileCount + 1
		end
	end
	
	local tileCount = math.random( 100, 120 )
	
	local startX = 0
	local startY = math.random( 0, maxY )
	local endX = 9
	local endY = math.random( 0, maxY )
	
	-- Traverse
	local x = startX
	local y = startY
	self.player:setPosition( x * self.tileWidth, y * self.tileWidth )
	self.player.moveAmount = self.tileWidth
	
	local roomPoints = {}
	table.insert( roomPoints, { x = endX, y = endY } )
	for i = 0, math.random( 5, 10 ) do
		local room = { x = math.random( 1, maxX-1 ), y = math.random( 1, maxY-1 ) }
		table.insert( roomPoints, room )
	end
	
	-- Add paths between each room
	for key, point in pairs( roomPoints ) do
		endX = point.x
		endY = point.y
		
		while ( x ~= endX or y ~= endY ) do
			self.tiles[ x .. "-" .. y ].type = "ground"
			self.tiles[ x .. "-" .. y ].itemType = "none"
			self.tiles[ x .. "-" .. y ].label = nil
			self.tiles[ x .. "-" .. y ].rock = nil
			
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
	end
	-- Last tile
	self.tiles[ x .. "-" .. y ].type = "ground"
	self.tiles[ x .. "-" .. y ].itemType = "ladder"
	self.tiles[ x .. "-" .. y ].rock = {}	
	self.tiles[ x .. "-" .. y ].rock.bitmap = Bitmap.new( self.textures.ladder )	
	self.tiles[ x .. "-" .. y ].rock.x = self.tiles[ x .. "-" .. y ].x
	self.tiles[ x .. "-" .. y ].rock.y = self.tiles[ x .. "-" .. y ].y
	self.tiles[ x .. "-" .. y ].rock.bitmap:setPosition( self.tiles[ x .. "-" .. y ].rock.x, self.tiles[ x .. "-" .. y ].rock.y )
	self.tiles[ x .. "-" .. y ].label = TextField.new( self.labelFont, GameText:Get( "target", "Down" ) )
	self.tiles[ x .. "-" .. y ].label:setTextColor( 0xFFFFFF )
	self.tiles[ x .. "-" .. y ].label:setPosition( self.tiles[ x .. "-" .. y ].x, self.tiles[ x .. "-" .. y ].y )
	
	-- Setup bitmaps
	local enemyMax = self.level
	if ( enemyMax > 5 ) then enemyMax = 5 end
	
	for key, tile in pairs( self.tiles ) do
		if ( tile.type == "wall" ) then
			tile.bitmap = Bitmap.new( self.textures.walls ) 
			
		else
			tile.bitmap = Bitmap.new( self.textures.ground )
			
			-- Should it have a rock?
			local rockYes = math.random( 1, 10 )
			local enemyYes = math.random( 1, 10 )
			if ( i ~= 0 and rockYes == 1 and tile.itemType == "none" and tile.x ~= startX * self.tileWidth and tile.y ~= startY * self.tileWidth ) then
				local rock = {}
				rock.x = tile.x
				rock.y = tile.y
				rock.bitmap = Bitmap.new( self.textures.rock )
				rock.bitmap:setPosition( rock.x, rock.y )
				tile.itemType = "rock"
				tile.rock = rock
				
				tile.label = TextField.new( self.labelFont, GameText:Get( "target", "Rock" ) )
				tile.label:setTextColor( 0xFFFFFF )
				tile.label:setPosition( tile.x, tile.y )
			
			-- What about an enemy?
			elseif ( enemyMax > 0 and enemyYes == 1 and tile.itemType == "none" and tile.x ~= startX * self.tileWidth and tile.y ~= startY * self.tileWidth ) then
				local enemy = {}
				enemy.x = tile.x
				enemy.y = tile.y
				
				local enemyType = math.random( 1, 2 )
				if ( enemyType == 1 ) then
					enemy.type = "snail"
					enemy.bitmap = Bitmap.new( self.textures.snail )
					enemy.label = TextField.new( self.labelFont, GameText:Get( "target", "Snail" ) )
				else
					enemy.type = "mole"
					enemy.bitmap = Bitmap.new( self.textures.mole )
					enemy.label = TextField.new( self.labelFont, GameText:Get( "target", "Mole" ) )
				end
				enemy.bitmap:setPosition( enemy.x, enemy.y )
				enemy.label:setPosition( enemy.x, enemy.y )
				enemy.label:setTextColor( 0xFFFFFF )
				enemy.alive = true
				
				table.insert( self.enemies, enemy )
				enemyMax = enemyMax - 1
				
			end
		
		end
		
		tile.bitmap:setPosition( tile.x, tile.y )
	end
	
	self:Draw()
	self:TurnBasedUpdate()
	stage:addChild( self.fadeBitmap )
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
	if ( self.transition == true) then return end
	
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
			
			local randomItem = math.random( 1, 8 )	-- 4 gems, 3 coins
			
			if ( randomItem == 1 ) then 				self.tiles[ tileName ].itemType = "gemA"
			elseif ( randomItem == 2 ) then 		self.tiles[ tileName ].itemType = "gemB"
			elseif ( randomItem == 3 ) then 		self.tiles[ tileName ].itemType = "gemC"
			elseif ( randomItem == 4 ) then 		self.tiles[ tileName ].itemType = "gemD"
			elseif ( randomItem == 5 ) then 		self.tiles[ tileName ].itemType = "coinA"
			elseif ( randomItem == 6 ) then 		self.tiles[ tileName ].itemType = "coinB"
			elseif ( randomItem == 7 ) then 		self.tiles[ tileName ].itemType = "coinC"
			elseif ( randomItem == 8 ) then 		self.tiles[ tileName ].itemType = "sandwich"
			end
			
			self.tiles[ tileName ].label:setText( GameText:Get( "target", self.tiles[ tileName ].itemType ) )			
			self.tiles[ tileName ].rock.bitmap:setTexture( self.textures[ self.tiles[ tileName ].itemType ] )
		end
		
	
	elseif ( clickedButton == "btn_sword" ) then
		-- Check enemies
		local adjX = x
		local adjY = y
		for key, enemy in pairs ( self.enemies ) do
			if 			( self.player.direction == "north" ) then		adjY = adjY - self.moveAmount
			elseif 	( self.player.direction == "south" ) then		adjY = adjY + self.moveAmount
			elseif 	( self.player.direction == "east" ) then		adjX = adjX + self.moveAmount
			elseif 	( self.player.direction == "west" ) then		adjX = adjX - self.moveAmount
			end
			
			if ( ( adjX == enemy.x and adjY == enemy.y ) or ( x == enemy.x and y == enemy.y ) ) then
				enemy.bitmap:setColorTransform( 1, 0.5, 0.5, 0.5 )
				--enemy.bitmap:setAnchorPoint( 0.5, 0.5 )
				enemy.bitmap:setRotation( 180 )
				enemy.bitmap:setPosition( enemy.x + self.moveAmount, enemy.y + self.moveAmount )
				enemy.alive = false
				self.swordSfx:play() 
			end
			
		end
	end
	
	if ( tryToMove ) then
		self.player:Face( dir )
		
		if ( self.tiles[ tileName ] ~= nil ) then
			-- Movable Tile
			if ( self.tiles[ tileName ].type == "ground" and self.tiles[ tileName ].itemType ~= "rock" ) then
				self.player:Move( dir )
			end
			
			-- Go downwards
			if ( self.tiles[ tileName ].itemType == "ladder" ) then
				self.footstepsSfx:play()
				stage:addChild( self.fadeBitmap )
				self.fadeBitmap:setAlpha( 0 )
				self.transition = true
				self.fadeCounter = 100
			
			-- Collectable
			elseif ( self.tiles[ tileName ].itemType ~= nil and self.tiles[ tileName ].itemType ~= "none" and self.tiles[ tileName ].itemType ~= "rock" ) then
				if ( self.tiles[ tileName ].rock ~= nil ) then
					stage:removeChild( self.tiles[ tileName ].rock.bitmap )
				end
				
				if 			( self.tiles[ tileName ].itemType == "gemA" ) then 		self.score = self.score + 20			
				elseif 	( self.tiles[ tileName ].itemType == "gemB" ) then 		self.score = self.score + 40		
				elseif 	( self.tiles[ tileName ].itemType == "gemC" ) then 		self.score = self.score + 60		
				elseif 	( self.tiles[ tileName ].itemType == "gemD" ) then 		self.score = self.score + 80		
				elseif 	( self.tiles[ tileName ].itemType == "coinA" ) then 		self.score = self.score + 5		
				elseif 	( self.tiles[ tileName ].itemType == "coinB" ) then 		self.score = self.score + 15		
				elseif 	( self.tiles[ tileName ].itemType == "coinC" ) then 		self.score = self.score + 50		
				elseif 	( self.tiles[ tileName ].itemType == "sandwich" and self.player.health < 3 ) then
					self.player.health = self.player.health + 1	
				
					local heart = Bitmap.new( self.textures.heart )
					heart:setPosition( 300 + 20 * (self.player.health - 1), 340 )
					table.insert( self.hearts, heart )
					stage:addChild( heart )
				end
				self.scoreText:setText( GameText:Get( "target", "Money" ) .. ": " .. self.score )
				
				if ( self.tiles[ tileName ].label ~= nil ) then stage:removeChild( self.tiles[ tileName ].label ) end
				self.tiles[ tileName ].itemType = "none"
				self.collectSfx:play()
				
			end
		end -- if ( self.tiles[ tileName ] ~= nil ) then
	end -- if ( tryToMove ) then
	
	self:TurnBasedUpdate()
end

function GameMinerState:TurnBasedUpdate()
	local r, g, b, a = self.player.bitmap:getColorTransform()
	if ( g < 1.0 ) then g = g + 0.1 end
	if ( b < 1.0 ) then b = b + 0.1 end
	self.player.bitmap:setColorTransform( r, g, b, a )
	-- adjust lighting
	if ( self.enableLighting ) then
		local x, y = self.player:getPosition()
		for key, tile in pairs( self.tiles ) do
			local distance = math.floor( self:GetDistance( x, y, tile.x, tile.y ) / 36 )
			local alpha = 1 - ( 0.25 * ( distance - 1 ) )
			tile.bitmap:setAlpha( alpha )
			
			if ( tile.rock ~= nil ) then
				tile.rock.bitmap:setAlpha( alpha )	
			end
			if ( tile.label ~= nil ) then
				tile.label:setAlpha( alpha )
			end
		end
		
		for key, enemy in pairs( self.enemies ) do
			local distance = math.floor( self:GetDistance( x, y, enemy.x, enemy.y ) / 36 )
			local alpha = 1 - ( 0.25 * ( distance - 1 ) )
			enemy.bitmap:setAlpha( alpha )
			enemy.label:setAlpha( alpha )
		end
	end
	
	-- enemy movement
	for key, enemy in pairs( self.enemies ) do
		if ( enemy.alive == true ) then
		
			-- Move towards player if in line-of-sight
			local tx = enemy.x / self.tileWidth
			local ty = enemy.y / self.tileWidth
			local dir = ""
			local tileName = ""
			local x, y = self.player:getPosition()
			
			if ( enemy.x == x ) then
				if ( y < enemy.y ) then
					dir = "north"
					tileName = tx .. "-" .. ty - 1
				
				elseif ( y > enemy.y ) then
					dir = "south"
					tileName = tx .. "-" .. ty + 1
				
				end
				
			elseif ( enemy.y == y ) then
				if ( x < enemy.x ) then
					dir = "west"
					tileName = tx - 1 .. "-" .. ty
				
				elseif ( x > enemy.x ) then
					dir = "east"
					tileName = tx + 1 .. "-" .. ty
				
				end
			
			end
			
			if ( self.tiles[ tileName ] ~= nil 
				and self.tiles[ tileName ].itemType ~= "rock" 
				and self.tiles[ tileName ].type == "ground" ) then
				
				if ( enemy.attackedLastTime or enemy.movedLastTime ) then dir = "none" end
				
				-- Move / attack			
				if ( dir == "north" ) then
					enemy.y = enemy.y - self.moveAmount
					enemy.movedLastTime = true
					
				elseif ( dir == "south" ) then
					enemy.y = enemy.y + self.moveAmount
					enemy.movedLastTime = true
				
				elseif ( dir == "east" ) then
					enemy.x = enemy.x + self.moveAmount 
					enemy.movedLastTime = true
				
				elseif ( dir == "west" ) then
					enemy.x = enemy.x - self.moveAmount 
					enemy.movedLastTime = true
				
				else
					enemy.movedLastTime = false
				
				end
				
				local r, g, b, a = self.player.bitmap:getColorTransform()
				if ( enemy.x == x and enemy.y == y
						and r >= 1.0 and g >= 1.0 and b >= 1.0 ) then
					if ( self.hearts[ self.player.health ] ~= nil ) then 
						stage:removeChild( self.hearts[ self.player.health ] )
						self.hearts[ self.player.health ] = nil
					end
					self.player.health = self.player.health - 1
					self.hurtSfx:play()
					self.player.bitmap:setColorTransform( 1.0, 0, 0, 1.0 )
					enemy.attackedLastTime = true
				else
					enemy.attackedLastTime = false
				end
				
				enemy.bitmap:setPosition( enemy.x, enemy.y )
				enemy.label:setPosition( enemy.x, enemy.y )
			end
			
			if ( self.player.health == -1 ) then
				-- Game over
				print( "Game over" )
			end
			
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
	
	if ( self.transition ) then
		self.fadeCounter = self.fadeCounter - 1
		
		-- Fade out
		if ( self.fadeCounter > 50 ) then
			self.fadeBitmap:setAlpha( self.fadeBitmap:getAlpha() + 0.05 )
		
		-- Change
		elseif ( self.fadeCounter == 50 ) then
			self:SetupMap()
			self.level = self.level + 1
			self.levelText:setText( GameText:Get( "target", "Level" ) .. ": " .. self.level )
		
		-- Fade in
		elseif ( self.fadeCounter > 0 ) then
			self.fadeBitmap:setAlpha( self.fadeBitmap:getAlpha() - 0.05 )
		
		-- Done
		else
			self.transition = false
			stage:removeChild( self.fadeBitmap )
		
		end
	end
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