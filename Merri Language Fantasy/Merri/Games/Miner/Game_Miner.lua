GameMinerState = Core.class( StateBase )

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
			heart = Texture.new( "Content/Games/Miner/UI/hud_heart.png" ),
			menu = Texture.new( "Content/Graphics/UI/btn_menu.png" ),
			
			hud_south = Texture.new( "Content/Games/Miner/UI/hud_down.png" ),
			hud_west = Texture.new( "Content/Games/Miner/UI/hud_left.png" ),
			hud_east = Texture.new( "Content/Games/Miner/UI/hud_right.png" ),
			hud_north = Texture.new( "Content/Games/Miner/UI/hud_up.png" ),
			
			hud_pick = Texture.new( "Content/Games/Miner/UI/hud_pick.png" ),
			hud_sword = Texture.new( "Content/Games/Miner/UI/hud_sword.png" ),
			
			shopkeeper = Texture.new( "Content/Games/Miner/UI/shopkeeper.png" ),
			
			itemBackground = Texture.new( "Content/Games/Miner/UI/inventory_bg.png" ),
			inventoryPotion = Texture.new( "Content/Games/Miner/UI/inventory_potion.png" ),
			inventoryEarthquake = Texture.new( "Content/Games/Miner/UI/inventory_earthquake.png" ),
			inventoryBlizzard = Texture.new( "Content/Games/Miner/UI/inventory_blizzard.png" ),
			inventoryDynamite = Texture.new( "Content/Games/Miner/UI/inventory_blizzard.png" ),
			inventoryRope = Texture.new( "Content/Games/Miner/UI/inventory_blizzard.png" ),
			
			dontbuy = Texture.new( "Content/Games/Miner/UI/dontbuy.png" ),
		}
	
	self.sounds = {
		mining = Sound.new( "Content/Audio/mining.wav" ),
		collect = Sound.new( "Content/Audio/collect.wav" ),
		footsteps = Sound.new( "Content/Audio/footsteps.wav" ),
		hurt = Sound.new( "Content/Audio/hurt.wav" ),
		sword = Sound.new( "Content/Audio/sword.wav" ),
	}
	
	self.images = {}
	
	GameMinerState.fonts = {
		overhead = TTFont.new( "Content/Fonts/NotoSans-Bold.ttf", 8 ),
		hud = TTFont.new( "Content/Fonts/NotoSans-Bold.ttf", 14 ),
		shop = TTFont.new( "Content/Fonts/NotoSans-Bold.ttf", 20 ),
	}
	
	-- Fade out graphic
	self.fadeCounter = 0
	self.transition = false
	self.fadeBitmap = Bitmap.new( self.textures.black )
	self.fadeBitmap:setAlpha( 0 )
	
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
	
	self.debugButton = Bitmap.new( Texture.new( "Content/Games/Miner/UI/hud_down.png" ) )
	self.debugButton:setPosition( 320, 600 )
	
	self.points = 0
	
	-- Labels
	self.labels = {}
	
	-- Narrative Line
	self.labels.narration = TextField.new( GameMinerState.fonts.hud, GameText:Get( "target", "miner-begin" ) )
	self.labels.narration:setTextColor( 0xFFFFFF )
	self.labels.narration:setPosition( 10, 560 )
	
	-- Health
	self.labels.health = TextField.new( GameMinerState.fonts.hud, GameText:Get( "target", "Health" ) )
	self.labels.health:setTextColor( 0xFFFFFF )
	self.labels.health:setPosition( 80, 590 )
	
	-- Hearts
	self.hudHearts = {}
	for i = 0, 3 do
		self.hudHearts[i] = Bitmap.new( self.textures.heart )
		self.hudHearts[i]:setPosition( 160 + ( i * 20 ), 575 )
	end
	
	-- Money
	self.labels.money = TextField.new( GameMinerState.fonts.hud, GameText:Get( "target", "Money" ) )
	self.labels.money:setTextColor( 0xFFFFFF )
	self.labels.money:setPosition( 80, 610 )
	
	self.labels.moneyValue = TextField.new( GameMinerState.fonts.hud, self.points )
	self.labels.moneyValue:setTextColor( 0xFFFFFF )
	self.labels.moneyValue:setPosition( 165, 610 )
	
	-- Floor
	self.labels.floor = TextField.new( GameMinerState.fonts.hud, GameText:Get( "target", "Floor" ) )
	self.labels.floor:setTextColor( 0xFFFFFF )
	self.labels.floor:setPosition( 80, 630 )
	
	self.labels.floorValue = TextField.new( GameMinerState.fonts.hud, self.map.floor )
	self.labels.floorValue:setTextColor( 0xFFFFFF )
	self.labels.floorValue:setPosition( 165, 630 )
	
	self.buttons = {}
	--self.buttons.menu = Bitmap.new( self.textures.menu )
	--self.buttons.menu:setPosition( 10, 580 )
	
	--self.labels.menu = TextField.new( GameMinerState.fonts.hud, GameText:Get( "helper", "Menu" ) )
	--self.labels.menu:setTextColor( 0xFFFFFF )
	--self.labels.menu:setPosition( 12, 623 )
	
	self.state = "game"
	
	self:SetupHud()
	self:Draw()
end

function GameMinerState:SetupHud()
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

function GameMinerState:Cleanup()
end

function GameMinerState:Draw()
	StateBase:Draw()
	self.map:Draw()
	
	for key, button in pairs( self.hud ) do 
		stage:addChild( button.bitmap )
	end
	
	for key, button in pairs( self.buttons ) do
		stage:addChild( button )
	end
	
	for key, label in pairs( self.labels ) do
		stage:addChild( label )	
	end
	
	for key, heart in pairs( self.hudHearts ) do
		stage:addChild( heart )
	end
	
	self.map:UpdateLighting()
	
	stage:addChild( self.debugButton )
	
	if ( stage:contains( self.fadeBitmap ) ) then
		stage:addChild( self.fadeBitmap )
	end
end

function GameMinerState:SetupMap()
end

function GameMinerState:Update()
end

-- Callbacks --
function GameMinerState:Handle_AndroidKey( event )
end

function GameMinerState:InputAction( action, direction )
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
	
	self.points = self.points + points
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
	
	self.labels.moneyValue:setText( self.points )
	
	self:SetupHud()
	self:TurnBasedUpdate()
end

function GameMinerState:Handle_KeyDown( event )
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

function GameMinerState:Handle_MouseDown( event )
	if ( self.state == "game" ) then
		-- Hud buttons could be to move or mine or attack
		for key, button in pairs( self.hud ) do
			if ( button.bitmap:hitTestPoint( event.x, event.y ) ) then
				self:InputAction( button.action, button.direction )			
			end
		end
		
		if ( self.debugButton:hitTestPoint( event.x, event.y ) ) then
			self.sounds.footsteps:play()
			self.fadeCounter = 100
			self.transition = true
			stage:addChild( self.fadeBitmap )
			self.fadeBitmap:setAlpha( 0 )
			self.labels.narration:setText( GameText:Get( "target", "miner-go-down-ladder" ) )	
		end
	elseif ( self.state == "shop" ) then
		if ( self.images.dontbuy ~= nil and self.images.dontbuy:hitTestPoint( event.x, event.y ) ) then
			self:ToggleState( "game" )
			self.sounds.footsteps:play()
		end
	end
end

function GameMinerState:TurnBasedUpdate()
	self.map:TurnBasedUpdate()
end

function GameMinerState:Handle_EnterFrame( event )
	if ( self.transition ) then
		self.fadeCounter = self.fadeCounter - 1
		
		-- Fade out
		if ( self.fadeCounter > 50 ) then
			self.fadeBitmap:setAlpha( self.fadeBitmap:getAlpha() + 0.05 )
		
		-- Change
		elseif ( self.fadeCounter == 50 ) then
			self.map:GoDownstairs()
			self:Draw()
			self.labels.floorValue:setText( self.map.floor )
			self:ToggleState( "shop" )
		
		-- Fade in
		elseif ( self.fadeCounter > 0 ) then
			self.fadeBitmap:setAlpha( self.fadeBitmap:getAlpha() - 0.05 )
		
		-- Done
		else
			self.transition = false
			stage:removeChild( self.fadeBitmap )
			self:SetupHud()
		
		end	
	end

	self.map:Handle_EnterFrame( frame )
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

function GameMinerState:ToggleState( state )
	self.state = state
	
	if ( self.state == "shop" ) then
		self.transition = false
		
		self.images.bg = Bitmap.new( self.textures.black )
		
		self.images.shopkeeper = Bitmap.new( self.textures.shopkeeper )
		self.images.shopkeeper:setPosition( 65, 65 )
		
		
		self.labels.info1 = TextField.new( GameMinerState.fonts.shop, GameText:Get( "target", "Do you want to buy a tool?" ) )
		self.labels.info1:setPosition( 10, 50 )
		self.labels.info1:setTextColor( 0xFFFFFF )
		
		local items = { "Potion", "Earthquake", "Blizzard", "Dynamite", "Rope" }
		
		local randomItems = {}
		local x = 32
		local y = 220
		local inc = 90
		for i = 1, 3 do
			local index = math.random( 1, #items )
			local itemName = items[ index ]
			print( "Random item ", i, ": ", itemName )
			
			self.images[ "itemBackground" .. i ] = Bitmap.new( self.textures[ "inventory" .. itemName ] )
			self.images[ "itemBackground" .. i ]:setPosition( x, y + ( i * inc ) )
			
			self.labels[ "item" .. i ] = TextField.new( GameMinerState.fonts.shop, GameText:Get( "target", itemName ) )
			self.labels[ "item" .. i ]:setPosition( x+100, y+20 + ( i * inc ) )
			self.labels[ "item" .. i ]:setTextColor( 0xFFFFFF )
			
			self.labels[ "itemDescription" .. i ] = TextField.new( GameMinerState.fonts.hud, GameText:Get( "target", itemName .. "Description" ) )
			self.labels[ "itemDescription" .. i ]:setPosition( x+100, y+40 + ( i * inc ) )
			self.labels[ "itemDescription" .. i ]:setTextColor( 0xFFFFFF )
		
			self.labels[ "itemPrice" .. i ] = TextField.new( GameMinerState.fonts.hud, GameText:Get( "target", "Price" ) .. " 50" )
			self.labels[ "itemPrice" .. i ]:setPosition( x+100, y+60 + ( i * inc ) )
			self.labels[ "itemPrice" .. i ]:setTextColor( 0xFFFFFF )
		end
		
		self.images.dontbuy = Bitmap.new( self.textures.dontbuy )
		self.images.dontbuy:setPosition( x, y+350 )
		self.labels.dontbuy = TextField.new( GameMinerState.fonts.shop, GameText:Get( "target", "Don't buy anything" ) )
		self.labels.dontbuy:setPosition( x + 100, y + 385 )
		self.labels.dontbuy:setTextColor( 0xFFFFFF )
		
		stage:addChild( self.images.bg )
		stage:addChild( self.images.shopkeeper )
		stage:addChild( self.images.itemBackground1 )
		stage:addChild( self.images.itemBackground2 )
		stage:addChild( self.images.itemBackground3 )
		stage:addChild( self.labels.info1 )
		stage:addChild( self.labels.item1 )
		stage:addChild( self.labels.itemDescription1 )
		stage:addChild( self.labels.itemPrice1 )
		stage:addChild( self.labels.item2 )
		stage:addChild( self.labels.itemDescription2 )
		stage:addChild( self.labels.itemPrice2 )
		stage:addChild( self.labels.item3 )
		stage:addChild( self.labels.itemDescription3 )
		stage:addChild( self.labels.itemPrice3 )
		stage:addChild( self.images.dontbuy )
		stage:addChild( self.labels.dontbuy )
		
	else
		-- Game
		self.transition = true
		
		stage:removeChild( self.images.bg )
		stage:removeChild( self.images.shopkeeper )
		stage:removeChild( self.images.itemBackground1 )
		stage:removeChild( self.images.itemBackground2 )
		stage:removeChild( self.images.itemBackground3 )
		stage:removeChild( self.labels.info1 )
		stage:removeChild( self.labels.item1 )
		stage:removeChild( self.labels.itemDescription1 )
		stage:removeChild( self.labels.itemPrice1 )
		stage:removeChild( self.labels.item2 )
		stage:removeChild( self.labels.itemDescription2 )
		stage:removeChild( self.labels.itemPrice2 )
		stage:removeChild( self.labels.item3 )
		stage:removeChild( self.labels.itemDescription3 )
		stage:removeChild( self.labels.itemPrice3 )
		stage:removeChild( self.images.dontbuy )
		stage:removeChild( self.labels.dontbuy )
	
	end
end



