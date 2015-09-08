MinerGameState = Core.class( StateBase )

function MinerGameState:init( options )
	StateBase:init( options )
	StateBase:Setup( { backgroundScroll = false } )
	StateBase.transitioning = false
	MinerGameState.inventoryItem = ""
	MinerGameState.money = 0
	MinerGameState.floor = 1
	MinerGameState.playerHealth = 4
	MinerGameState.moveFloorViaItem = false
	MinerGameState.gameOver = false
end

-- Setup / Teardown --
function MinerGameState:Setup( options )
	StateBase:SetGotoState( "" )
	
	-- Setup UI
	StateBase:SetBackground( { id = "background", 		path = "Content/Games/Miner/UI/miner_background.png",  pos_x = 0, pos_y = 0 } )
	
	self.textures = {
			black = Texture.new( "Content/Graphics/UI/blank_background.png" ),
			heart = Texture.new( "Content/Games/Miner/UI/hud_heart.png" ),
			menu = Texture.new( "Content/Graphics/UI/btn_menu.png" ),
			
			hud_empty = Texture.new( "Content/Games/Miner/UI/button_bg.png" ),
			
			hud_south = Texture.new( "Content/Games/Miner/UI/hud_down.png" ),
			hud_west = Texture.new( "Content/Games/Miner/UI/hud_left.png" ),
			hud_east = Texture.new( "Content/Games/Miner/UI/hud_right.png" ),
			hud_north = Texture.new( "Content/Games/Miner/UI/hud_up.png" ),
			
			hud_pick = Texture.new( "Content/Games/Miner/UI/hud_pick.png" ),
			hud_sword = Texture.new( "Content/Games/Miner/UI/hud_sword.png" ),
			
			itemBackground = Texture.new( "Content/Games/Miner/UI/inventory_bg.png" ),
			inventoryPotion = Texture.new( "Content/Games/Miner/UI/inventory_potion.png" ),
			inventoryEarthquake = Texture.new( "Content/Games/Miner/UI/inventory_earthquake.png" ),
			inventoryBlizzard = Texture.new( "Content/Games/Miner/UI/inventory_blizzard.png" ),
			inventoryDynamite = Texture.new( "Content/Games/Miner/UI/inventory_dynamite.png" ),
			inventoryRope = Texture.new( "Content/Games/Miner/UI/inventory_rope.png" ),
		}
	
	self.sounds = {
		mining = Sound.new( "Content/Audio/mining.wav" ),
		collect = Sound.new( "Content/Audio/collect.wav" ),
		footsteps = Sound.new( "Content/Audio/footsteps.wav" ),
		sword = Sound.new( "Content/Audio/sword.wav" ),
		Potion = Sound.new( "Content/Audio/potion.wav" ),
		Earthquake = Sound.new( "Content/Audio/earthquake.wav" ),
		Blizzard = Sound.new( "Content/Audio/blizzard.wav" ),
		Dynamite = Sound.new( "Content/Audio/dynamite.wav" ),
		Rope = Sound.new( "Content/Audio/rope.wav" ),
	}
	
	self.images = {}
	
	MinerGameState.fonts = {
		overhead = TTFont.new( "Content/Fonts/NotoSans-Bold.ttf", 8 ),
		hud = TTFont.new( "Content/Fonts/NotoSans-Bold.ttf", 14 ),
		shop = TTFont.new( "Content/Fonts/NotoSans-Bold.ttf", 20 ),
	}
	
	-- Fade out graphic
	if ( StateBase.transitioning ) then
		if ( MinerGameState.moveFloorViaItem == false ) then
			self.sounds.footsteps:play()
		end
		self.fadeCounter = 49
		self.transition = true
		self.fadeBitmap = Bitmap.new( self.textures.black )
		self.fadeBitmap:setAlpha( 1 )
		stage:addChild( self.fadeBitmap )
		MinerGameState.floor = MinerGameState.floor + 1
	
	else
		self.fadeCounter = 0
		self.transition = false
		self.fadeBitmap = Bitmap.new( self.textures.black )
		self.fadeBitmap:setAlpha( 0 )
		MinerGameState.transitionText = GameText:Get( "target", "miner-begin" )
	
	end
	
	-- Set up map=
	self.map = MinerMap.new( { floor = MinerGameState.floor, hp = MinerGameState.playerHealth } )
	self.map:Generate()
	--GetPlayerCoordinates	
	-- Create player control buttons
	self.hud = {
		topButton = {
			action = "move",
			direction = "north",
			bitmap = Bitmap.new( self.textures.hud_empty ),
			xOffset = 0,
			yOffset = -36,
			xPosition = 155,
			yPosition = 447,
		},
		bottomButton = {
			action = "move",
			direction = "south",
			bitmap = Bitmap.new( self.textures.hud_empty ),
			xOffset = 0,
			yOffset = 36,
			xPosition = 155,
			yPosition = 551,
		},
		leftButton = {
			action = "move",
			direction = "west",
			bitmap = Bitmap.new( self.textures.hud_empty ),
			xOffset = -36,
			yOffset = 0,
			xPosition = 103,
			yPosition = 499,
		},
		rightButton = {
			action = "move",
			direction = "east",
			bitmap = Bitmap.new( self.textures.hud_empty ),
			xOffset = 36,
			yOffset = 0,
			xPosition = 207,
			yPosition = 499,
		},
	}
	
	self.frozenEnemies = false
	
	self.debugButton = Bitmap.new( Texture.new( "Content/Games/Miner/UI/hud_down.png" ) )
	self.debugButton:setPosition( 0, 600 )
	
	-- Labels
	self.labels = {}
	-- Narrative Line
	self.labels.narration = TextField.new( MinerGameState.fonts.hud, MinerGameState.transitionText )
	self.labels.narration:setTextColor( 0xFFFFFF )
	self.labels.narration:setPosition( 10, 415 )
	
	
	local statTextX = 10
	-- Health
	self.labels.health = TextField.new( MinerGameState.fonts.hud, GameText:Get( "target", "Health" ) )
	self.labels.health:setTextColor( 0xFFFFFF )
	self.labels.health:setPosition( statTextX, 450 )
	
	-- Hearts
	self.hudHearts = {}
	for i = 0, 3 do
		self.hudHearts[i] = Bitmap.new( self.textures.heart )
		self.hudHearts[i]:setPosition( statTextX + ( i * 20 ), 460 )
	end
	self:UpdateHearts()
	
	-- Money
	self.labels.money = TextField.new( MinerGameState.fonts.hud, GameText:Get( "target", "Money" ) )
	self.labels.money:setTextColor( 0xFFFFFF )
	self.labels.money:setPosition( statTextX, 500 )
	
	self.labels.moneyValue = TextField.new( MinerGameState.fonts.hud, MinerGameState.money )
	self.labels.moneyValue:setTextColor( 0xFFFFFF )
	self.labels.moneyValue:setPosition( statTextX, 520 )
	
	-- Floor
	self.labels.floor = TextField.new( MinerGameState.fonts.hud, GameText:Get( "target", "Floor" ) )
	self.labels.floor:setTextColor( 0xFFFFFF )
	self.labels.floor:setPosition( statTextX, 550 )
	
	self.labels.floorValue = TextField.new( MinerGameState.fonts.hud, self.map.floor )
	self.labels.floorValue:setTextColor( 0xFFFFFF )
	self.labels.floorValue:setPosition( statTextX, 570 )
	
	local inventoryX = 267
	self.buttons = {}
	self.buttons.inventory = {}
	if ( MinerGameState.inventoryItem == "" ) then
		self.buttons.inventory.bitmap = Bitmap.new( self.textures.itemBackground )
		self.buttons.inventory.item = ""
	
	else
		self.buttons.inventory.bitmap = Bitmap.new( self.textures[ "inventory" .. MinerGameState.inventoryItem ] )
		self.buttons.inventory.item = MinerGameState.inventoryItem
	
	end
	self.buttons.inventory.bitmap:setPosition( inventoryX, 572 )
	
	self.buttons.menu = {}
	self.buttons.menu.bitmap	= Bitmap.new( self.textures.menu )
	self.buttons.menu.bitmap:setPosition( statTextX, 585 )
	
	self.labels.menu = TextField.new( MinerGameState.fonts.hud, GameText:Get( "helper", "menu" ) )
	self.labels.menu:setTextColor( 0xFFFFFF )
	self.labels.menu:setPosition( statTextX+3, 630 )
	
	self:SetupHud()
	self:Draw()
end

function MinerGameState:SetupHud()
	self.hud.topButton.action,
	self.hud.bottomButton.action,
	self.hud.leftButton.action,
	self.hud.rightButton.action = self.map:GetHudActions()

	for key, button in pairs( self.hud ) do
		-- Update Position
		button.bitmap:setPosition( button.xPosition, button.yPosition )
		
		-- Update actions
		if ( button.action == "move" ) then
			button.bitmap:setTexture( self.textures[ "hud_" .. button.direction ] )
		
		elseif ( button.action == "mine" ) then
			button.bitmap:setTexture( self.textures.hud_pick )
		
		elseif ( button.action == "attack" ) then
			button.bitmap:setTexture( self.textures.hud_sword )
		
		else -- none
			button.bitmap:setTexture( self.textures.hud_empty )
		end
	end
end

function MinerGameState:Cleanup()
	StateBase:Cleanup()
	
	self:ClearScreen()
	self:ClearWidgets()
	
	for key, button in pairs( self.hud ) do 
		if ( stage:contains( button.bitmap ) ) then stage:removeChild( button.bitmap ) end
		self.hud[ key ] = nil
	end
	
	for key, button in pairs( self.buttons ) do
		if ( stage:contains( button.bitmap ) ) then stage:removeChild( button.bitmap ) end
		self.buttons[ key ] = nil
	end
	
	for key, label in pairs( self.labels ) do
		if ( stage:contains( label ) ) then stage:removeChild( label ) end
		self.labels[ key ] = nil
	end
	
	for key, heart in pairs( self.hudHearts ) do
		if ( stage:contains( heart ) ) then stage:removeChild( heart ) end
		self.hudHearts[ key ] = nil
	end
	
	self.map:ClearMap()
end

function MinerGameState:Draw()
	StateBase:Draw()
	self.map:Draw()
	
	for key, button in pairs( self.hud ) do 
		stage:addChild( button.bitmap )
	end
	
	for key, button in pairs( self.buttons ) do
		stage:addChild( button.bitmap )
	end
	
	for key, label in pairs( self.labels ) do
		stage:addChild( label )	
	end
	
	for key, heart in pairs( self.hudHearts ) do
		stage:addChild( heart )
	end
	
	self.map:UpdateLighting()
	
	--stage:addChild( self.debugButton )
	
	if ( stage:contains( self.fadeBitmap ) ) then
		stage:addChild( self.fadeBitmap )
	end
end

function MinerGameState:SetupMap()
end

function MinerGameState:Update()
end

-- Callbacks --
function MinerGameState:Handle_AndroidKey( event )
end

function MinerGameState:InputAction( action, direction )
	local points = 0
	local itemType = ""
	
	if ( action == "move" ) then
		points, itemType = self.map:MovePlayer( direction, self.map.tileWidth )
		self.labels.narration:setText( GameText:Get( "target", "miner-move-" .. direction ) )
	
	elseif ( action == "mine" ) then
		self.map:UsePick( direction )
		self.sounds.mining:play()
		self.labels.narration:setText( GameText:Get( "target", "miner-mine" ) )
	
	elseif ( action == "attack" ) then
		local attacked = self.map:UseSword( direction )
		self.sounds.sword:play()
		self.labels.narration:setText( GameText:Get( "target", "miner-attack-" .. attacked ) )
		
	end
	
	MinerGameState.money = MinerGameState.money + points
	if ( points > 0 ) then
		self.sounds.collect:play()
		self.labels.narration:setText( GameText:Get( "target", "miner-collect-" .. itemType ) )
		
	elseif ( itemType == "sandwich" ) then
		-- eat sound effect
		self.sounds.collect:play()
		self.map:EatSandwich()
		self.labels.narration:setText( GameText:Get( "target", "miner-eat-sandwich" ) )
		MinerGameState.playerHealth = self.map.player:GetHealth()
		self:UpdateHearts()
		
	elseif ( itemType == "ladder" ) then
		self.sounds.footsteps:play()
		self:BeginTransition()
		
		MinerGameState.moveFloorViaItem = false
		MinerGameState.transitionText = GameText:Get( "target", "miner-go-down-ladder" )
	
	elseif ( itemType == "star" ) then
		-- End of mini-game
		StateBase:SetGotoState( "GotStarState" )	
		
	end
	
	if ( self.frozenEnemies and self.freezeCountdown == 0 ) then
		self.frozenEnemies = false
		self.labels.narration:setText( GameText:Get( "target", "enemies-thaw" ) )	
	end
	
	self.labels.moneyValue:setText( MinerGameState.money )
	
	self:TurnBasedUpdate()
	
	self:SetupHud()
end

function MinerGameState:Handle_KeyDown( event )
	if ( MinerGameState.gameOver ) then
		return
	end

	local action, direction

	if ( event.keyCode == KeyCode.W or event.keyCode == KeyCode.UP ) then
		action = self.hud.topButton.action
		direction = self.hud.topButton.direction
		
	elseif ( event.keyCode == KeyCode.S or event.keyCode == KeyCode.DOWN ) then
		action = self.hud.bottomButton.action
		direction = self.hud.bottomButton.direction
	
	elseif ( event.keyCode == KeyCode.A or event.keyCode == KeyCode.LEFT ) then
		action = self.hud.leftButton.action
		direction = self.hud.leftButton.direction
	
	elseif ( event.keyCode == KeyCode.D or event.keyCode == KeyCode.RIGHT ) then
		action = self.hud.rightButton.action
		direction = self.hud.rightButton.direction
	
	end
	
	self:InputAction( action, direction )
end

function MinerGameState:UpdateHearts()
	local hp = self.map.player:GetHealth()
	for key, heart in pairs( self.hudHearts ) do
		if ( key >= hp ) then
			heart:setColorTransform( 0, 0, 0, 1 )
		else
			heart:setColorTransform( 1, 1, 1, 1 )
		end
	end
end

function MinerGameState:UseItem( type )
	local success = false
	if ( type == "Potion" ) then
		success = true
		self.sounds.Potion:play()
		self.map:ConsumePotion()
		self:UpdateHearts()
		self.labels.narration:setText( GameText:Get( "target", "use-potion" ) )
	
	elseif ( type == "Earthquake" ) then
		-- Break all rocks
		success = true
		self.map:BreakAllRocks()
		self.sounds.Earthquake:play()
		self.labels.narration:setText( GameText:Get( "target", "use-earthquake" ) )
	
	elseif ( type == "Blizzard" ) then
		-- Freeze all enemies
		success = true
		self.map:FreezeAllEnemies()
		self.sounds.Blizzard:play()
		self.labels.narration:setText( GameText:Get( "target", "use-blizzard" ) )
		self.frozenEnemies = true
	
	elseif ( type == "Rope" and MinerGameState.floor > 1 ) then
		-- Cannot use on the first floor, but you shouldn't have it anyway
		MinerGameState.moveFloorViaItem = true
		MinerGameState.floor = MinerGameState.floor - 2 -- will add 1 to the floor
		MinerGameState.transitionText = GameText:Get( "target", "miner-rope" )
		self:BeginTransition()
		self.sounds.Rope:play()
		
	elseif ( type == "Dynamite" and MinerGameState.floor < 20 ) then
		-- Cannot use on the final floor
		MinerGameState.moveFloorViaItem = true
		MinerGameState.transitionText = GameText:Get( "target", "miner-dynamite" )
		self:BeginTransition()
		self.sounds.Dynamite:play()
	end
	
	if ( success ) then
		self.buttons.inventory.bitmap:setTexture( self.textures.itemBackground )
		self.buttons.inventory.item = ""
		MinerGameState.inventoryItem = ""
	end
end

function MinerGameState:BeginTransition()
	self.fadeCounter = 100
	self.transition = true
	stage:addChild( self.fadeBitmap )
	self.fadeBitmap:setAlpha( 0 )
end

function MinerGameState:Handle_MouseDown( event )
	if ( StateBase.paused ) then
		StateBase:Handle_MouseDown_Paused( event )
	
	else
		if ( MinerGameState.gameOver  ) then
			clickedButton = StateBase:ClickedButtonName( event )
			
			if ( clickedButton == "btn_back" ) then
				MinerGameState.gameOver = false -- Reset
				MinerGameState.playerHealth = 4
				MinerGameState.inventoryItem = ""
				MinerGameState.money = 0
				MinerGameState.floor = 1
				MinerGameState.moveFloorViaItem = false
				StateBase:SetGotoState( "TitleState" )
			
			end
			
			return
		end

		-- Hud buttons could be to move or mine or attack
		for key, button in pairs( self.hud ) do
			if ( button.bitmap:hitTestPoint( event.x, event.y ) ) then
				self:InputAction( button.action, button.direction )			
			end
		end
		
		if ( self.buttons.inventory.bitmap:hitTestPoint( event.x, event.y ) ) then
			self:UseItem( self.buttons.inventory.item )
		end
		
		if ( self.buttons.menu.bitmap:hitTestPoint( event.x, event.y ) ) then
			StateBase:CreateGameMenu()
		end
		
		if ( self.debugButton ~= nil and self.debugButton:hitTestPoint( event.x, event.y ) ) then
		end
		
	end
end

function MinerGameState:TurnBasedUpdate()
	self.map:TurnBasedUpdate()
	self:UpdateHearts()
	
	if ( self.map.player:GetHealth() == 0 ) then
		self:GameOver()
	end
end

function MinerGameState:Handle_EnterFrame( event )
	if ( self.transition ) then
		self.fadeCounter = self.fadeCounter - 1
		
		-- Fade out
		if ( self.fadeCounter > 50 ) then
			self.fadeBitmap:setAlpha( self.fadeBitmap:getAlpha() + 0.05 )
		
		-- Change
		elseif ( self.fadeCounter == 50 ) then
			StateBase.transitioning = true								-- when we reload shop, this will have it fade in
			MinerGameState.playerHealth = self.map.player:GetHealth()
			
			if ( MinerGameState.moveFloorViaItem == true ) then
				StateBase:SetGotoState( "MinerGameState" )
				
			else
				StateBase:SetGotoState( "MinerShopState" )		-- show the shop
			end
		
		-- Fade in
		elseif ( self.fadeCounter > 0 ) then
			self.fadeBitmap:setAlpha( self.fadeBitmap:getAlpha() - 0.05 )
		
		-- Done
		else
			self.transition = false
			StateBase.transitioning = false
			stage:removeChild( self.fadeBitmap )
			self:SetupHud()
		
		end	
	end

	self.map:Handle_EnterFrame( frame )
end

function MinerGameState:ClearScreen()
	StateBase:ClearScreen()	
end

function MinerGameState:ClearWidgets()
	StateBase:ClearWidgets()
end

function MinerGameState:GotoState()
	return StateBase:GotoState()
end

function MinerGameState:GameOver()
	self.map:DimTiles()
	
	for key, button in pairs( self.hud ) do
		stage:removeChild( button.bitmap )
	end

	self.map.player:Die( self.map.tileWidth )
	
	StateBase:AddLabelAndDraw( { id = "gameOver3", path = "Content/Fonts/NotoSans-Bold.ttf",		pos_x = 10, pos_y = 300, color = 0xFF0000, size = 40, text = GameText:Get( "target", "Game Over" ), centered = true } )
	StateBase:AddLabelAndDraw( { id = "gameOver4", path = "Content/Fonts/NotoSans-Bold.ttf",		pos_x = 10, pos_y = 350, color = 0xFF0000, size = 35, text = GameText:Get( "helper", "Game Over" ), centered = true } )
	
	StateBase:AddButtonAndDraw( { 
		button = { id = "btn_back", 	path = "Content/Graphics/UI/btn_back.png",  	pos_x = 130, pos_y = 400  },
		label 	= { id = "btn_back", 	path = "Content/Fonts/NotoSans-Bold.ttf",   			pos_x = 135, pos_y = 400+95, color = 0xFFFFFF, size = 14, text = GameText:Get( "helper", "Back" ) }
		} )
		
	MinerGameState.gameOver = true
end
