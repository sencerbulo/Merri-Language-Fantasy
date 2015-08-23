MinerShopState = Core.class( StateBase )

function MinerShopState:init( options )
	StateBase:init( options )
	StateBase:Setup( { backgroundScroll = false } )
end

-- Setup / Teardown --
function MinerShopState:Setup( options )	
	StateBase:SetGotoState( "" )
	StateBase:SetBackground( { id = "background", 		path = "Content/Graphics/UI/generalbgtile.png",  pos_x = 0, pos_y = 0 } )
	
	self.textures = {
			black = Texture.new( "Content/Graphics/UI/blank_background.png" ),
			
			shopkeeper = Texture.new( "Content/Games/Miner/UI/shopkeeper.png" ),
			
			itemBackground = Texture.new( "Content/Games/Miner/UI/inventory_bg.png" ),
			inventoryPotion = Texture.new( "Content/Games/Miner/UI/inventory_potion.png" ),
			inventoryEarthquake = Texture.new( "Content/Games/Miner/UI/inventory_earthquake.png" ),
			inventoryBlizzard = Texture.new( "Content/Games/Miner/UI/inventory_blizzard.png" ),
			inventoryDynamite = Texture.new( "Content/Games/Miner/UI/inventory_dynamite.png" ),
			inventoryRope = Texture.new( "Content/Games/Miner/UI/inventory_rope.png" ),
			
			dontbuy = Texture.new( "Content/Games/Miner/UI/dontbuy.png" ),
		}
		
	self.sounds = {
		error = Sound.new( "Content/Audio/error.wav" ),
		pay = Sound.new( "Content/Audio/payup.wav" ),
	}
		
	self.fonts = {
		hud = TTFont.new( "Content/Fonts/NotoSans-Bold.ttf", 14 ),
		shop = TTFont.new( "Content/Fonts/NotoSans-Bold.ttf", 20 ),
	}
	
	self.images = {}
	self.labels = {}
		
	self.images.shopkeeper = Bitmap.new( self.textures.shopkeeper )
	self.images.shopkeeper:setPosition( 65, 65 )
	
	StateBase:AddLabel( { id = "money", 			path = "Content/Fonts/NotoSans-Bold.ttf",		
		pos_x = 0, pos_y = 25, color = 0xFFFFFF, size = 20, text = GameText:Get( "target", "Money" ) .. " " .. MinerGameState.money, centered = true } )
	
	self.labels.dialog = TextField.new( self.fonts.shop, GameText:Get( "target", "Do you want to buy a tool?" ) )
	self.labels.dialog:setTextColor( 0xFFFFFF )
	local textX = GLOBAL_CONFIG.SCREEN_WIDTH / 2 - ( string.len( GameText:Get( "target", "Do you want to buy a tool?" ) ) * 20 / 2 ) / 2
	self.labels.dialog:setPosition( textX, 55 )
	
	self.shopItems = {}
	self.items = {
			{ name = "Potion", price = 50 },
			{ name = "Earthquake", price = 30 },
			{ name = "Blizzard", price = 60 },
			{ name = "Dynamite", price = 100 },
			{ name = "Rope", price = 30 },
		}
		
	local randomItems = {}
	local x = 32
	local y = 220
	local inc = 90
	for i = 1, 3 do
		local index = math.random( 1, #self.items )
		local itemName = self.items[ index ].name
		self.shopItems[ i ] = self.items[ index ]
		
		self.images[ "itemBackground" .. i ] = Bitmap.new( self.textures[ "inventory" .. itemName ] )
		self.images[ "itemBackground" .. i ]:setPosition( x, y + ( i * inc ) )
		
		self.labels[ "item" .. i ] = TextField.new( self.fonts.shop, GameText:Get( "target", itemName ) )
		self.labels[ "item" .. i ]:setPosition( x+100, y+20 + ( i * inc ) )
		self.labels[ "item" .. i ]:setTextColor( 0xFFFFFF )
		
		self.labels[ "itemDescription" .. i ] = TextField.new( self.fonts.hud, GameText:Get( "target", itemName .. "Description" ) )
		self.labels[ "itemDescription" .. i ]:setPosition( x+100, y+40 + ( i * inc ) )
		self.labels[ "itemDescription" .. i ]:setTextColor( 0xFFFFFF )
	
		self.labels[ "itemPrice" .. i ] = TextField.new( self.fonts.hud, GameText:Get( "target", "Price" ) .. " " .. self.items[ index ].price )
		self.labels[ "itemPrice" .. i ]:setPosition( x+100, y+60 + ( i * inc ) )
		self.labels[ "itemPrice" .. i ]:setTextColor( 0xFFFFFF )
		
		table.remove( self.items, index )
	end
	
	self.images.dontbuy = Bitmap.new( self.textures.dontbuy )
	self.images.dontbuy:setPosition( x, y+350 )
	self.labels.dontbuy = TextField.new( self.fonts.shop, GameText:Get( "target", "Don't buy anything" ) )
	self.labels.dontbuy:setPosition( x + 100, y + 385 )
	self.labels.dontbuy:setTextColor( 0xFFFFFF )

	self:Draw()
end

function MinerShopState:Cleanup()
	StateBase:Draw()
	
	for key, image in pairs( self.images ) do	
		stage:removeChild( image )
	end
	for key, label in pairs( self.labels ) do	
		stage:removeChild( label )
	end
end

function MinerShopState:Draw()
	StateBase:Draw()
	for key, image in pairs( self.images ) do	
		stage:addChild( image )
	end
	for key, label in pairs( self.labels ) do	
		stage:addChild( label )
	end
end

function MinerShopState:SetupMap()
end

function MinerShopState:Update()
end

-- Callbacks --
function MinerShopState:Handle_AndroidKey( event )
end

function MinerShopState:Handle_KeyDown( event )
end

function MinerShopState:Handle_MouseDown( event )
	if ( self.images.dontbuy:hitTestPoint( event.x, event.y ) ) then
		self:Cleanup()
		StateBase:SetGotoState( "MinerGameState" )
	end
	
	for i = 1, 3 do
		if ( self.images[ "itemBackground" .. i ] ~= nil and self.images[ "itemBackground" .. i ]:hitTestPoint( event.x, event.y ) ) then
		
			if ( MinerGameState.money >= self.shopItems[ i ].price ) then
				MinerGameState.money = MinerGameState.money - self.shopItems[ i ].price				
				-- Buyin' this thing
				self.sounds.pay:play()
				MinerGameState.inventoryItem = self.shopItems[ i ].name
				StateBase:SetGotoState( "MinerGameState" )
				
			else
				self.labels.dialog:setText( GameText:Get( "target", "You don't have enough money" ) )
				local textX = GLOBAL_CONFIG.SCREEN_WIDTH / 2 - ( string.len( GameText:Get( "target", "You don't have enough money" ) ) * 20 / 2 ) / 2
				self.labels.dialog:setPosition( textX, 55 )
				self.labels.dialog:setTextColor( 0xFFA3A3 )
				self.sounds.error:play()
			end
		end
	end
end

function MinerShopState:TurnBasedUpdate()
	self.map:TurnBasedUpdate()
end

function MinerShopState:Handle_EnterFrame( event )
	StateBase:Update()
end

function MinerShopState:ClearScreen()
	StateBase:ClearScreen()	
end

function MinerShopState:ClearWidgets()
	StateBase:ClearWidgets()
end

function MinerShopState:GotoState()
	return StateBase:GotoState()
end


