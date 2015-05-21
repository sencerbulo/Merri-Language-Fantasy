CategoryClothesState = Core.class()

function CategoryClothesState:init( options )
	self.name = options.name
end

----------------------------
-- 1. SETUP AND BREAKDOWN --
----------------------------
function CategoryClothesState:Setup()
	self.textures = {
		background 		= Texture.new( "content/graphics/game/background_dressup.png" ),
		clothes_bg 			= Texture.new( "content/graphics/ui/bluemenu.png" ),
		pointer_left 		= Texture.new( "content/graphics/ui/pointer_left.png" ),
		pointer_right 		= Texture.new( "content/graphics/ui/pointer_right.png" ),
		category_clothes_menu 		= Texture.new( "content/graphics/ui/dressup_menu.png" ),
		
		body1 = Texture.new( "content/graphics/game/dressup/person1.png" ),
		body2 = Texture.new( "content/graphics/game/dressup/person2.png" ),
		body3 = Texture.new( "content/graphics/game/dressup/person3.png" ),
		hair1 = Texture.new( "content/graphics/game/dressup/hair1.png" ),
		hair2 = Texture.new( "content/graphics/game/dressup/hair2.png" ),
		hair3 = Texture.new( "content/graphics/game/dressup/hair3.png" ),
		hair4 = Texture.new( "content/graphics/game/dressup/hair4.png" ),
		
		baseballhat = Texture.new( "content/graphics/game/dressup/baseballcap.png" ),
		coat = Texture.new( "content/graphics/game/dressup/coat.png" ),
		dress = Texture.new( "content/graphics/game/dressup/dress.png" ),
		jacket = Texture.new( "content/graphics/game/dressup/jacket.png" ),
		pants = Texture.new( "content/graphics/game/dressup/pants.png" ),
		shorts = Texture.new( "content/graphics/game/dressup/shorts.png" ),
		shoes = Texture.new( "content/graphics/game/dressup/shoes.png" ),
		socks = Texture.new( "content/graphics/game/dressup/socks.png" ),
		tophat = Texture.new( "content/graphics/game/dressup/tophat.png" ),
		tshirt = Texture.new( "content/graphics/game/dressup/tshirt.png" ),
		skirt = Texture.new( "content/graphics/game/dressup/skirt.png" ),
	}
	
	self.buttons = {}
	self.labels = {}
	self.images = {}	
	self.menu_options = {}
	
	self.cooldown = 0
	
	audioManager:PlaySong( "minigame3" )
	
	self.images.body = Bitmap.new( self.textures[ "body1" ] )
	self.images.hair = Bitmap.new( self.textures[ "hair1" ] )
	
	self.clothes = {}
	self.clothes.jacket = nil
	self.clothes.top = nil
	self.clothes.bottom = nil
	self.clothes.hat = nil
	self.clothes.socks = nil
	self.clothes.shoes = nil
	
	self.background = Bitmap.new( self.textures.background )
	
	self.view = "dressup" -- dressup or menu
	self.menuScroll = 1
	
	self:SetupUI()
	
	self.background:addEventListener( Event.MOUSE_DOWN, self.Event_MouseClick, self )
	stage:addEventListener(Event.KEY_DOWN, self.Event_AndroidKey, self )
	self.background:addEventListener( Event.ENTER_FRAME, self.Event_Update, self )
end

function CategoryClothesState:BreakDown()
	self:Clear()
	self.background:removeEventListener( Event.MOUSE_DOWN, self.Event_MouseClick, self )
	stage:removeEventListener(Event.KEY_DOWN, self.Event_AndroidKey, self )
	self.background:removeEventListener( Event.ENTER_FRAME, self.Event_Update, self )
end

function CategoryClothesState:ReloadLanguage()
end

function CategoryClothesState:ClearUI()
	if stage:contains( self.background ) then stage:removeChild( self.background ) end
	
	-- Clear and re-setup UI
	for key, button in pairs( self.buttons ) do
		button:Clear()
		self.buttons[ key ] = nil
	end
	
	for key, label in pairs( self.labels ) do
		label:Clear()
		self.labels[ key ] = nil
	end
	
	for key, button in pairs( self.menu_options ) do
		button:Clear()
		self.menu_options[ key ] = nil
	end
	
	for key, clothing in pairs( self.clothes ) do
		if clothing ~= nil and stage:contains( clothing ) then
			stage:removeChild( clothing )
		end
	end
	
	if stage:contains( self.images.body ) then stage:removeChild( self.images.body ) end
	if stage:contains( self.images.hair ) then stage:removeChild( self.images.hair ) end
end

function CategoryClothesState:RedrawUI()
	stage:addChild( self.background )
	
	-- Draw new assets
	for key, button in pairs( self.buttons ) do
		button:Draw()
	end
	
	for key, label in pairs( self.labels ) do
		label:Draw()
	end
	
	for key, button in pairs( self.menu_options ) do
		button:Draw()
	end
	
	if self.view == "dressup" then
		stage:addChild( self.images.body )
		stage:addChild( self.images.hair )
		
		if self.clothes.socks ~= nil then		stage:addChild( self.clothes.socks ) end
		if self.clothes.shoes ~= nil then		stage:addChild( self.clothes.shoes ) end
		if self.clothes.bottom ~= nil then		stage:addChild( self.clothes.bottom ) end
		if self.clothes.top ~= nil then				stage:addChild( self.clothes.top ) end
		if self.clothes.jacket ~= nil then				stage:addChild( self.clothes.jacket ) end
		if self.clothes.hat ~= nil then				stage:addChild( self.clothes.hat ) end

	end
end

function CategoryClothesState:SetupUI()
	self:ClearUI()
	
	if self.view == "dressup" then
		self.background:setTexture( self.textures.background )
		
		self.currentBody = math.random( 1, 3 )
		self.images.body:setTexture( self.textures[ "body" .. self.currentBody ] )
		self.images.body:setPosition( 320/2 - 220/2, 0 )
		
		self.currentHair = math.random( 1, 4 )
		self.images.hair:setTexture( self.textures[ "hair" .. self.currentHair ] )
		self.images.hair:setPosition( 320/2 - 220/2, 0 )
		
		table.insert( self.buttons, Button.new( { name = "category_clothes_menu", texture = self.textures.category_clothes_menu, xPos = 5, yPos = 480 - 95, purpose = "open_clothes" } ) )
		
		table.insert( self.buttons, Button.new( { name = "body_left", 
			texture = self.textures.pointer_left, xPos = 10, yPos = 230,  purpose = "body_left" } ) )
			
		table.insert( self.buttons, Button.new( { name = "body_right", 
			texture = self.textures.pointer_right, xPos = 270, yPos = 230,  purpose = "body_right" } ) )
		
		table.insert( self.buttons, Button.new( { name = "hair_left", 
			texture = self.textures.pointer_left, xPos = 10, yPos = 100,  purpose = "hair_left" } ) )
			
		table.insert( self.buttons, Button.new( { name = "hair_right", 
			texture = self.textures.pointer_right, xPos = 270, yPos = 100,  purpose = "hair_right" } ) )
			
	elseif self.view == "menu" then
		self.background:setTexture( self.textures.clothes_bg )
		
		local x, y, inc = 30, 20, 75
		local textX = x + 100
		
		if self.menuScroll == 1 then
		
			table.insert( self.menu_options, Button.new( {
				name = "baseballhat", texture = self.textures.baseballhat , xPos = x, yPos = y, purpose = "clothes_baseballhat",
				size = "half", text = languageManager:GetString( "baseballhat" ), font = fontManager.smaller, color = "0xffffff", xPosText = textX, yPosText  = y + 15
			} ) )
			
			x = 25
			y = 60
			table.insert( self.menu_options, Button.new( {
				name = "tophat", texture = self.textures.tophat, xPos = x, yPos = y, purpose = "clothes_tophat",
				size = "half", text = languageManager:GetString( "tophat" ), font = fontManager.smaller, color = "0xffffff",  xPosText = textX, yPosText  = y + 25
			} ) )
			
			x = 30
			y = 130
			table.insert( self.menu_options, Button.new( {
				name = "shoes", texture = self.textures.shoes, xPos = x, yPos = y, purpose = "clothes_shoes",
				size = "half", text = languageManager:GetString( "shoes" ), font = fontManager.smaller, color = "0xffffff",  xPosText = textX, yPosText  = y + 10
			} ) )
			
			x = 25
			y = 160
			table.insert( self.menu_options, Button.new( {
				name = "coat", texture = self.textures.coat, xPos = x, yPos = y, purpose = "clothes_coat",
				size = "half", text = languageManager:GetString( "coat" ), font = fontManager.smaller, color = "0xffffff",  xPosText = textX, yPosText  = y + 25
			} ) )
			
			y = 230
			table.insert( self.menu_options, Button.new( {
				name = "jacket", texture = self.textures.jacket, xPos = x, yPos = y, purpose = "clothes_jacket",
				size = "half", text = languageManager:GetString( "jacket" ), font = fontManager.smaller, color = "0xffffff",  xPosText = textX, yPosText  = y + 25
			} ) )
			
			y = 300
			table.insert( self.menu_options, Button.new( {
				name = "tshirt", texture = self.textures.tshirt, xPos = x, yPos = y, purpose = "clothes_tshirt",
				size = "half", text = languageManager:GetString( "tshirt" ), font = fontManager.smaller, color = "0xffffff",  xPosText = textX, yPosText  = y + 25
			} ) )
			
			x = 40
			y = 350
			table.insert( self.menu_options, Button.new( {
				name = "shorts", texture = self.textures.shorts, xPos = x, yPos = y, purpose = "clothes_shorts",
				size = "half", text = languageManager:GetString( "shorts" ), font = fontManager.smaller, color = "0xffffff",  xPosText = textX, yPosText  = y + 25
			} ) )
			
			y = 400
			table.insert( self.menu_options, Button.new( {
				name = "pants", texture = self.textures.pants, xPos = x, yPos = y, purpose = "clothes_pants",
				size = "half", text = languageManager:GetString( "pants" ), font = fontManager.smaller, color = "0xffffff",  xPosText = textX, yPosText  = y + 25
			} ) )
			
		elseif self.menuScroll == 2 then
			y = 30
			table.insert( self.menu_options, Button.new( {
				name = "socks", texture = self.textures.socks, xPos = x, yPos = y, purpose = "clothes_socks",
				size = "half", text = languageManager:GetString( "socks" ), font = fontManager.smaller, color = "0xffffff",  xPosText = textX, yPosText  = y + 15
			} ) )
			
			x = 40
			y = 70
			table.insert( self.menu_options, Button.new( {
				name = "dress", texture = self.textures.dress, xPos = x, yPos = y, purpose = "clothes_dress",
				size = "half", text = languageManager:GetString( "dress" ), font = fontManager.smaller, color = "0xffffff", xPosText = textX, yPosText  = y + 40
			} ) )
			
			x = 40
			y = 175
			table.insert( self.menu_options, Button.new( {
				name = "skirt", texture = self.textures.skirt, xPos = x, yPos = y, purpose = "clothes_skirt",
				size = "half", text = languageManager:GetString( "skirt" ), font = fontManager.smaller, color = "0xffffff", xPosText = textX, yPosText  = y + 30
			} ) )
			
			
		end
		table.insert( self.buttons, Button.new( { name = "scrolldown1", effect = "animated",
			texture = Texture.new( "content/graphics/ui/pointer_down_1.png" ),
			texture2 = Texture.new( "content/graphics/ui/pointer_down_2.png"), xPos = 320-60, yPos = 480-60 } ) )
	
	end
	
	self:RedrawUI()
end

-----------------------------
-- 2. DRAWING AND CLEARING --
-----------------------------
function CategoryClothesState:Draw()
	self:RedrawUI()
end

function CategoryClothesState:Clear()
	self:ClearUI()
end

-----------------------
-- 3. EVENT HANDLING --
-----------------------
function CategoryClothesState:Event_AndroidKey( event )
	if event.keyCode == KeyCode.BACK then
		if self.view == "dressup" then
			StateManager:StateSetup( "select" )
		else
			self.view = "dressup"
			self:SetupUI()
			audioManager:PlayEffect( "cancel" )
		end
	end
end

function CategoryClothesState:Event_MouseClick( event )
	for key, button in pairs( self.menu_options ) do
		if button:IsClicked( event ) and self.cooldown <= 0 then
		
			-- Item clicked, place on person?
				
			--self.clothes.jacket = nil
			--self.clothes.top = nil
			--self.clothes.bottom = nil
			--self.clothes.hat = nil
			--self.clothes.socks = nil
			--self.clothes.shoes = nil
			
			audioManager:PlaySpecial( button.name )
			
			if button.name == "baseballhat" then
				self.clothes.hat = Bitmap.new( self.textures.baseballhat )
				self.clothes.hat:setPosition( 100, 50 )
				
			elseif button.name == "tophat" then
				self.clothes.hat = Bitmap.new( self.textures.tophat )
				self.clothes.hat:setPosition( 80, 10 )
			
			elseif button.name == "coat" then
				self.clothes.jacket = Bitmap.new( self.textures.coat )
				self.clothes.jacket:setPosition( 92, 180 )
			
			elseif button.name == "jacket" then
				self.clothes.jacket = Bitmap.new( self.textures.jacket )
				self.clothes.jacket:setPosition( 92, 180 )
				
			elseif button.name == "pants" then
				self.clothes.bottom = Bitmap.new( self.textures.pants )
				self.clothes.bottom:setPosition( 126, 256 )
			
			elseif button.name == "shorts" then
				self.clothes.bottom = Bitmap.new( self.textures.shorts )
				self.clothes.bottom:setPosition( 128, 250 )
			
			elseif button.name == "shoes" then
				self.clothes.shoes = Bitmap.new( self.textures.shoes )
				self.clothes.shoes:setPosition( 116, 359 )
			
			elseif button.name == "socks" then
				self.clothes.socks = Bitmap.new( self.textures.socks )
				self.clothes.socks:setPosition( 116, 349 )
			
			elseif button.name == "tshirt" then
				self.clothes.top = Bitmap.new( self.textures.tshirt )
				self.clothes.top:setPosition( 100, 182 )
			
			elseif button.name == "dress" then
				self.clothes.top = Bitmap.new( self.textures.dress )
				self.clothes.top:setPosition( 128, 182 )
			
			elseif button.name == "skirt" then
				self.clothes.bottom = Bitmap.new( self.textures.skirt )
				self.clothes.bottom:setPosition( 124, 250 )
			
			end
			
			self.cooldown = 10
			audioManager:PlayEffect( "confirm" )
			self.view = "dressup"
			self:SetupUI()
			
		end
	end

	for key, button in pairs( self.buttons ) do
		if button:IsClicked( event ) and self.cooldown <= 0 then
			self.cooldown = 10
			if button.name == "body_left" then
				self.currentBody = self.currentBody - 1
				if self.currentBody < 1 then self.currentBody = 3 end
				audioManager:PlayEffect( "confirm" )
				
				self.images.body:setTexture( self.textures[ "body" .. self.currentBody ] )
				
			elseif button.name == "body_right" then
				self.currentBody = self.currentBody + 1
				if self.currentBody > 3 then self.currentBody = 1 end
				audioManager:PlayEffect( "confirm" )
				
				self.images.body:setTexture( self.textures[ "body" .. self.currentBody ] )
			
			elseif button.name == "hair_left" then
				self.currentHair = self.currentHair - 1
				if self.currentHair < 1 then self.currentHair = 4 end
				audioManager:PlayEffect( "confirm" )
				
				self.images.hair:setTexture( self.textures[ "hair" .. self.currentHair ] )
			
			elseif button.name == "hair_right" then
				self.currentHair = self.currentHair + 1
				if self.currentHair > 4 then self.currentHair = 1 end
				audioManager:PlayEffect( "confirm" )
				
				self.images.hair:setTexture( self.textures[ "hair" .. self.currentHair ] )
			
			elseif button.name == "category_clothes_menu" then
				self.view = "menu"
				audioManager:PlayEffect( "confirm" )
				self:SetupUI()
			
			elseif button.name == "scrolldown1" then
				self.menuScroll = self.menuScroll + 1
				if self.menuScroll > 2 then self.menuScroll = 1 end
				self:SetupUI()
				audioManager:PlayEffect( "confirm" )
			
			end
		end
	end
end

function CategoryClothesState:Event_Update()
	if self.cooldown > 0 then
		self.cooldown = self.cooldown - 1
	end
end
