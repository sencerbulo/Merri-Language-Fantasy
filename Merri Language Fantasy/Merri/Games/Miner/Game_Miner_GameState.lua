MinerGameState = Core.class( StateBase )

function MinerGameState:init( options )
	StateBase:init( options )
	StateBase:Setup( { backgroundScroll = false } )
	StateBase.transitioning = false
	MinerGameState.inventoryItem = ""
	MinerGameState.money = 0
end

-- Setup / Teardown --
function MinerGameState:Setup( options )
	self.enableLighting = true
	StateBase:SetGotoState( "" )
	
	-- Setup UI
	StateBase:SetBackground( { id = "background", 		path = "Content/Games/Miner/UI/miner_background.png",  pos_x = 0, pos_y = 0 } )
	
	self.textures = {
			black = Texture.new( "Content/Graphics/UI/blank_background.png" ),
			heart = Texture.new( "Content/Games/Miner/UI/hud_heart.png" ),
			menu = Texture.new( "Content/Graphics/UI/btn_menu.png" ),
			
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
		hurt = Sound.new( "Content/Audio/hurt.wav" ),
		sword = Sound.new( "Content/Audio/sword.wav" ),
	}
	
	self.images = {}
	
	MinerGameState.fonts = {
		overhead = TTFont.new( "Content/Fonts/NotoSans-Bold.ttf", 8 ),
		hud = TTFont.new( "Content/Fonts/NotoSans-Bold.ttf", 14 ),
		shop = TTFont.new( "Content/Fonts/NotoSans-Bold.ttf", 20 ),
	}
	
	-- Fade out graphic
	if ( StateBase.transitioning ) then
		self.sounds.footsteps:play()
		self.fadeCounter = 49
		self.transition = true
		self.fadeBitmap = Bitmap.new( self.textures.black )
		self.fadeBitmap:setAlpha( 1 )
		stage:addChild( self.fadeBitmap )
		self.labels.narration:setText( GameText:Get( "target", "miner-go-down-ladder" ) )
	
	else
		self.fadeCounter = 0
		self.transition = false
		self.fadeBitmap = Bitmap.new( self.textures.black )
		self.fadeBitmap:setAlpha( 0 )
	
	end
	
	-- Set up map
	self.map = MinerMap.new()
	self.map:Generate()
	--GetPlayerCoordinates	
	-- Create player control buttons
	self.hud = {
		topButton = {
			action = "move",
			direction = "north",
			bitmap = Bitmap.new( self.textures.hud_north ),
			xOffset = 0,
			yOffset = -36,
		},
		bottomButton = {
			action = "move",
			direction = "south",
			bitmap = Bitmap.new( self.textures.hud_south ),
			xOffset = 0,
			yOffset = 36,
		},
		leftButton = {
			action = "move",
			direction = "west",
			bitmap = Bitmap.new( self.textures.hud_west ),
			xOffset = -36,
			yOffset = 0,
		},
		rightButton = {
			action = "move",
			direction = "east",
			bitmap = Bitmap.new( self.textures.hud_east ),
			xOffset = 36,
			yOffset = 0,
		},
	}
	
	--self.debugButton = Bitmap.new( Texture.new( "Content/Games/Miner/UI/hud_down.png" ) )
	--self.debugButton:setPosition( 320, 600 )
	
	-- Labels
	self.labels = {}
	
	-- Narrative Line
	self.labels.narration = TextField.new( MinerGameState.fonts.hud, GameText:Get( "target", "miner-begin" ) )
	self.labels.narration:setTextColor( 0xFFFFFF )
	self.labels.narration:setPosition( 10, 560 )
	
	-- Health
	self.labels.health = TextField.new( MinerGameState.fonts.hud, GameText:Get( "target", "Health" ) )
	self.labels.health:setTextColor( 0xFFFFFF )
	self.labels.health:setPosition( 80, 590 )
	
	-- Hearts
	self.hudHearts = {}
	for i = 0, 3 do
		self.hudHearts[i] = Bitmap.new( self.textures.heart )
		self.hudHearts[i]:setPosition( 160 + ( i * 20 ), 575 )
	end
	
	-- Money
	self.labels.money = TextField.new( MinerGameState.fonts.hud, GameText:Get( "target", "Money" ) )
	self.labels.money:setTextColor( 0xFFFFFF )
	self.labels.money:setPosition( 80, 610 )
	
	self.labels.moneyValue = TextField.new( MinerGameState.fonts.hud, MinerGameState.money )
	self.labels.moneyValue:setTextColor( 0xFFFFFF )
	self.labels.moneyValue:setPosition( 165, 610 )
	
	-- Floor
	self.labels.floor = TextField.new( MinerGameState.fonts.hud, GameText:Get( "target", "Floor" ) )
	self.labels.floor:setTextColor( 0xFFFFFF )
	self.labels.floor:setPosition( 80, 630 )
	
	self.labels.floorValue = TextField.new( MinerGameState.fonts.hud, self.map.floor )
	self.labels.floorValue:setTextColor( 0xFFFFFF )
	self.labels.floorValue:setPosition( 165, 630 )
	
	self.buttons = {}
	self.buttons.inventory = {}
	if ( MinerGameState.inventoryItem == "" ) then
		self.buttons.inventory.bitmap = Bitmap.new( self.textures.itemBackground )
		self.buttons.inventory.item = ""
	
	else
		self.buttons.inventory.bitmap = Bitmap.new( self.textures[ "inventory" .. MinerGameState.inventoryItem ] )
		self.buttons.inventory.item = MinerGameState.inventoryItem
	
	end
	self.buttons.inventory.bitmap:setPosition( 267, 572 )
	
	self.buttons.menu = {}
	self.buttons.menu.bitmap	= Bitmap.new( self.textures.menu )
	self.buttons.menu.bitmap:setPosition( 10, 580 )
	
	--self.labels.menu = TextField.new( MinerGameState.fonts.hud, GameText:Get( "helper", "Menu" ) )
	--self.labels.menu:setTextColor( 0xFFFFFF )
	--self.labels.menu:setPosition( 12, 623 )
	
	self:SetupHud()
	self:Draw()
end

function MinerGameState:SetupHud()
	self.hud.topButton.action,
	self.hud.bottomButton.action,
	self.hud.leftButton.action,
	self.hud.rightButton.action = self.map:GetHudActions()
	
	local x, y = self.map:GetPlayerCoordinates()
	for key, button in pairs( self.hud ) do
		-- Update Position
		button.bitmap:setPosition( x + button.xOffset, y + button.yOffset )
		
		-- Update actions
		button.bitmap:setAlpha( 1 )
		if ( button.action == "move" ) then
			button.bitmap:setTexture( self.textures[ "hud_" .. button.direction ] )
		
		elseif ( button.action == "mine" ) then
			button.bitmap:setTexture( self.textures.hud_pick )
		
		elseif ( button.action == "attack" ) then
			button.bitmap:setTexture( self.textures.hud_sword )
		
		else -- none
			button.bitmap:setAlpha( 0 )
		end
	end
end

function MinerGameState:Cleanup()
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
		self.labels.narration:setText( GameText:Get( "target", "miner-eat-sandwich" ) )
		
	elseif ( itemType == "ladder" ) then
		self.sounds.footsteps:play()
		self.fadeCounter = 100
		self.transition = true
		stage:addChild( self.fadeBitmap )
		self.fadeBitmap:setAlpha( 0 )
		self.labels.narration:setText( GameText:Get( "target", "miner-go-down-ladder" ) )
	
	elseif ( itemType == "star" ) then
		-- End of mini-game
		StateBase:SetGotoState( "GotStarState" )	
		
	end
	
	self.labels.moneyValue:setText( MinerGameState.money )
	
	self:SetupHud()
	self:TurnBasedUpdate()
end

function MinerGameState:Handle_KeyDown( event )
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

function MinerGameState:Handle_MouseDown( event )
	-- Hud buttons could be to move or mine or attack
	for key, button in pairs( self.hud ) do
		if ( button.bitmap:hitTestPoint( event.x, event.y ) ) then
			self:InputAction( button.action, button.direction )			
		end
	end
	
	if ( self.debugButton ~= nil and self.debugButton:hitTestPoint( event.x, event.y ) ) then
		self.sounds.footsteps:play()
		self.fadeCounter = 100
		self.transition = true
		stage:addChild( self.fadeBitmap )
		self.fadeBitmap:setAlpha( 0 )
		self.labels.narration:setText( GameText:Get( "target", "miner-go-down-ladder" ) )	
	end
end

function MinerGameState:TurnBasedUpdate()
	self.map:TurnBasedUpdate()
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
			StateBase:SetGotoState( "MinerShopState" )		-- show the shop
		
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



