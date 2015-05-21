CategoryColorState = Core.class()

function CategoryColorState:init( options )
	self.name = options.name
end

----------------------------
-- 1. SETUP AND BREAKDOWN --
----------------------------
function CategoryColorState:Setup()
	self.textures = {
		background 		= Texture.new( "content/graphics/ui/background_painting.png" ),
		clothes_bg 			= Texture.new( "content/graphics/ui/bluemenu.png" ),
		pointer_left 		= Texture.new( "content/graphics/ui/pointer_left.png" ),
		pointer_right 		= Texture.new( "content/graphics/ui/pointer_right.png" ),
		colors_menu 		= Texture.new( "content/graphics/ui/colors_menu.png" ),
		
		color_black 		= Texture.new( "content/graphics/ui/color_black.png" ),
		color_blue 			= Texture.new( "content/graphics/ui/color_blue.png" ),
		color_brown 		= Texture.new( "content/graphics/ui/color_brown.png" ),
		color_green 		= Texture.new( "content/graphics/ui/color_green.png" ),
		color_grey			= Texture.new( "content/graphics/ui/color_grey.png" ),
		color_orange 	= Texture.new( "content/graphics/ui/color_orange.png" ),
		color_pink 			= Texture.new( "content/graphics/ui/color_pink.png" ),
		color_purple 		= Texture.new( "content/graphics/ui/color_purple.png" ),
		color_red 			= Texture.new( "content/graphics/ui/color_red.png" ),
		color_white 		= Texture.new( "content/graphics/ui/color_white.png" ),
		color_yellow 		= Texture.new( "content/graphics/ui/color_yellow.png" ),
		color_bg 		= Texture.new( "content/graphics/ui/color_bg.png" ),
		
		brush_black 		= Texture.new( "content/graphics/ui/brush_black.png" ),
		brush_blue 			= Texture.new( "content/graphics/ui/brush_blue.png" ),
		brush_brown 		= Texture.new( "content/graphics/ui/brush_brown.png" ),
		brush_green 		= Texture.new( "content/graphics/ui/brush_green.png" ),
		brush_grey			= Texture.new( "content/graphics/ui/brush_grey.png" ),
		brush_orange 	= Texture.new( "content/graphics/ui/brush_orange.png" ),
		brush_pink 			= Texture.new( "content/graphics/ui/brush_pink.png" ),
		brush_purple 		= Texture.new( "content/graphics/ui/brush_purple.png" ),
		brush_red 			= Texture.new( "content/graphics/ui/brush_red.png" ),
		brush_white 		= Texture.new( "content/graphics/ui/brush_white.png" ),
		brush_yellow 		= Texture.new( "content/graphics/ui/brush_yellow.png" ),
	}
	
	self.buttons = {}
	self.labels = {}
	self.images = {}	
	self.menu_options = {}
	self.drawing = {}
	
	self.cooldown = 0
	self.currentColor = "red"
	
	audioManager:PlaySong( "minigame3" )
	
	self.clothes = {}
	self.clothes.jacket = nil
	self.clothes.top = nil
	self.clothes.bottom = nil
	self.clothes.hat = nil
	self.clothes.socks = nil
	self.clothes.shoes = nil
	
	self.background = Bitmap.new( self.textures.background )
	
	self.view = "canvas" -- category_clothes or menu
	self.menuScroll = 1
	
	self:SetupUI()
	
	self.background:addEventListener( Event.MOUSE_MOVE, self.Event_Paint, self )
	self.background:addEventListener( Event.MOUSE_DOWN, self.Event_MouseClick, self )
	stage:addEventListener(Event.KEY_DOWN, self.Event_AndroidKey, self )
	self.background:addEventListener( Event.ENTER_FRAME, self.Event_Update, self )
end

function CategoryColorState:BreakDown()
	self:Clear()
	self.background:removeEventListener( Event.MOUSE_MOVE, self.Event_Paint, self )
	self.background:removeEventListener( Event.MOUSE_DOWN, self.Event_MouseClick, self )
	stage:removeEventListener(Event.KEY_DOWN, self.Event_AndroidKey, self )
	self.background:removeEventListener( Event.ENTER_FRAME, self.Event_Update, self )
end

function CategoryColorState:ReloadLanguage()
end

function CategoryColorState:ClearUI()
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
	
	for key, image in pairs( self.images ) do
		stage:removeChild( image )
		self.images[ key ] = nil
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
end

function CategoryColorState:RedrawUI()
	stage:addChild( self.background )
	
	-- Draw new assets
	for key, image in pairs( self.images ) do
	stage:addChild( image )
	end
	
	for key, button in pairs( self.buttons ) do
		button:Draw()
	end
	
	for key, label in pairs( self.labels ) do
		label:Draw()
	end
	
	if self.view == "canvas" then
		for key, blob in pairs( self.drawing ) do
			stage:addChild( blob )
		end
	end
	
	for key, button in pairs( self.menu_options ) do
		button:Draw()
	end
end

function CategoryColorState:SetupUI()
	self:ClearUI()
	
	if self.view == "canvas" then
		self.background:setTexture( self.textures.background )
		table.insert( self.buttons, Button.new( { name = "color_menu", texture = self.textures.colors_menu, xPos = 5, yPos = 480 - 95, purpose = "open_colors" } ) )
			
	elseif self.view == "menu" then
		self.background:setTexture( self.textures.clothes_bg )

		local x, y, inc = 30, 30, 40
		local textX = x + 50
		
		local bg = nil
		
		local color = "red"
		bg = Bitmap.new( self.textures.color_bg ); bg:setPosition( x - 1, y - 1 ); table.insert( self.images, bg )
		
		table.insert( self.menu_options, Button.new( {
			name = color, texture = self.textures["color_" .. color] , xPos = x, yPos = y, purpose = "color",
			text = languageManager:GetString( color ), font = fontManager.smaller, color = "0xffffff", xPosText = textX, yPosText  = y + 12
		} ) )
		
		y = y + inc
		
		color = "orange"
		bg = Bitmap.new( self.textures.color_bg ); bg:setPosition( x - 1, y - 1 ); table.insert( self.images, bg )
		table.insert( self.menu_options, Button.new( {
			name = color, texture = self.textures["color_" .. color] , xPos = x, yPos = y, purpose = "color",
			text = languageManager:GetString( color ), font = fontManager.smaller, color = "0xffffff", xPosText = textX, yPosText  = y + 12
		} ) )
		
		y = y + inc
		
		color = "yellow"
		bg = Bitmap.new( self.textures.color_bg ); bg:setPosition( x - 1, y - 1 ); table.insert( self.images, bg )
		table.insert( self.menu_options, Button.new( {
			name = color, texture = self.textures["color_" .. color] , xPos = x, yPos = y, purpose = "color",
			text = languageManager:GetString( color ), font = fontManager.smaller, color = "0xffffff", xPosText = textX, yPosText  = y + 12
		} ) )
		
		y = y + inc
		
		color = "green"
		bg = Bitmap.new( self.textures.color_bg ); bg:setPosition( x - 1, y - 1 ); table.insert( self.images, bg )
		table.insert( self.menu_options, Button.new( {
			name = color, texture = self.textures["color_" .. color] , xPos = x, yPos = y, purpose = "color",
			text = languageManager:GetString( color ), font = fontManager.smaller, color = "0xffffff", xPosText = textX, yPosText  = y + 12
		} ) )
		
		y = y + inc
		
		color = "blue"
		bg = Bitmap.new( self.textures.color_bg ); bg:setPosition( x - 1, y - 1 ); table.insert( self.images, bg )
		table.insert( self.menu_options, Button.new( {
			name = color, texture = self.textures["color_" .. color] , xPos = x, yPos = y, purpose = "color",
			text = languageManager:GetString( color ), font = fontManager.smaller, color = "0xffffff", xPosText = textX, yPosText  = y + 12
		} ) )
		
		y = y + inc
		
		color = "purple"
		bg = Bitmap.new( self.textures.color_bg ); bg:setPosition( x - 1, y - 1 ); table.insert( self.images, bg )
		table.insert( self.menu_options, Button.new( {
			name = color, texture = self.textures["color_" .. color] , xPos = x, yPos = y, purpose = "color",
			text = languageManager:GetString( color ), font = fontManager.smaller, color = "0xffffff", xPosText = textX, yPosText  = y + 12
		} ) )
		
		y = y + inc
		
		color = "pink"
		bg = Bitmap.new( self.textures.color_bg ); bg:setPosition( x - 1, y - 1 ); table.insert( self.images, bg )
		table.insert( self.menu_options, Button.new( {
			name = color, texture = self.textures["color_" .. color] , xPos = x, yPos = y, purpose = "color",
			text = languageManager:GetString( color ), font = fontManager.smaller, color = "0xffffff", xPosText = textX, yPosText  = y + 12
		} ) )
		
		y = y + inc
		
		color = "white"
		bg = Bitmap.new( self.textures.color_bg ); bg:setPosition( x - 1, y - 1 ); table.insert( self.images, bg )
		table.insert( self.menu_options, Button.new( {
			name = color, texture = self.textures["color_" .. color] , xPos = x, yPos = y, purpose = "color",
			text = languageManager:GetString( color ), font = fontManager.smaller, color = "0xffffff", xPosText = textX, yPosText  = y + 12
		} ) )
		
		y = y + inc
		
		color = "brown"
		bg = Bitmap.new( self.textures.color_bg ); bg:setPosition( x - 1, y - 1 ); table.insert( self.images, bg )
		table.insert( self.menu_options, Button.new( {
			name = color, texture = self.textures["color_" .. color] , xPos = x, yPos = y, purpose = "color",
			text = languageManager:GetString( color ), font = fontManager.smaller, color = "0xffffff", xPosText = textX, yPosText  = y + 12
		} ) )
		
		y = y + inc
		
		color = "black"
		bg = Bitmap.new( self.textures.color_bg ); bg:setPosition( x - 1, y - 1 ); table.insert( self.images, bg )
		table.insert( self.menu_options, Button.new( {
			name = color, texture = self.textures["color_" .. color] , xPos = x, yPos = y, purpose = "color",
			text = languageManager:GetString( color ), font = fontManager.smaller, color = "0xffffff", xPosText = textX, yPosText  = y + 12
		} ) )
		
		y = y + inc
		
		color = "grey"
		bg = Bitmap.new( self.textures.color_bg ); bg:setPosition( x - 1, y - 1 ); table.insert( self.images, bg )
		table.insert( self.menu_options, Button.new( {
			name = color, texture = self.textures["color_" .. color] , xPos = x, yPos = y, purpose = "color",
			text = languageManager:GetString( color ), font = fontManager.smaller, color = "0xffffff", xPosText = textX, yPosText  = y + 12
		} ) )
		
	end
	
	self:RedrawUI()
end

-----------------------------
-- 2. DRAWING AND CLEARING --
-----------------------------
function CategoryColorState:Draw()
	self:RedrawUI()
end

function CategoryColorState:Clear()
	self:ClearUI()
end

-----------------------
-- 3. EVENT HANDLING --
-----------------------
function CategoryColorState:Event_AndroidKey( event )
	if event.keyCode == KeyCode.BACK then
		if self.view == "canvas" then
			StateManager:StateSetup( "select" )
			
		else
			self.view = "canvas"
			audioManager:PlayEffect( "cancel" )
			self:SetupUI()
			
		end
	end
end

function CategoryColorState:Event_MouseClick( event )
	for key, button in pairs( self.menu_options ) do
		if button:IsClicked( event ) and self.cooldown <= 0 then
			
			if ( button.purpose == "color" ) then
				self.cooldown = 10
				self.currentColor = button.name
				self.view = "canvas"
				audioManager:PlaySpecial( "colors_" .. self.currentColor )
				self:SetupUI()
			end
			
		end
	end

	for key, button in pairs( self.buttons ) do
		
	
		if button:IsClicked( event ) and self.cooldown <= 0 then
			self.cooldown = 10
			
			print( button.name, button.purpose )
			
			if ( button.name == "color_menu" ) then
				self.cooldown = 10
				self.view = "menu"
				audioManager:PlayEffect( "confirm" )
				self:SetupUI()
	
			end
		
		end
	end
	
	
end

function CategoryColorState:Event_Update()
	if self.cooldown > 0 then
		self.cooldown = self.cooldown - 1
	end
end

function CategoryColorState:Event_Paint( event )

	if ( self.view == "canvas" and self.cooldown <= 0 ) then
		-- Add new thingy here
		local brush = Bitmap.new( self.textures["brush_" .. self.currentColor] )
		brush:setAnchorPoint( 0.5, 0.5 )
		brush:setPosition( event.x, event.y )
		brush:setScale( 0.5 )
		table.insert( self.drawing, brush )
		
		stage:addChild( brush )
	end

end
