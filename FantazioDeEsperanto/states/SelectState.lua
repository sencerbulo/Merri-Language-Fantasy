SelectState = Core.class()

function SelectState:init( options )
	self.name = options.name
end

----------------------------
-- 1. SETUP AND BREAKDOWN --
----------------------------
function SelectState:Setup()
	self.textures = {
		background 		= Texture.new( "content/graphics/ui/bluemenu.png" ),
	}
	
	self.buttons = {}
	self.labels = {}
	self.images = {}
	
	self.background = Bitmap.new( self.textures.background )
	
	self.cooldown = 10
	self.scroll = 0
	self.maxScroll = 2
	self.scrollButton = Button.new( { name = "scrolldown", effect = "animated",
		texture = Texture.new( "content/graphics/ui/pointer_down_1.png" ),
		texture2 = Texture.new( "content/graphics/ui/pointer_down_2.png"), xPos = 320-60, yPos = 480-60 } )
	
	self:SetupUI( self.scroll )
	
	audioManager:PlaySong( "titlescreen" )
	
	self.background:addEventListener( Event.MOUSE_UP, self.Event_MouseClick, self )
	self.background:addEventListener( Event.ENTER_FRAME, self.Event_Update, self )
	stage:addEventListener(Event.KEY_DOWN, self.Event_AndroidKey, self )
end

function SelectState:BreakDown()
	self:Clear()
	self.background:removeEventListener( Event.MOUSE_UP, self.Event_MouseClick, self )
	self.background:removeEventListener( Event.ENTER_FRAME, self.Event_Update, self )
	stage:removeEventListener(Event.KEY_DOWN, self.Event_AndroidKey, self )
end

function SelectState:ReloadLanguage()
end

function SelectState:UpdateScroll()
	self:ClearScreen()

	if ( self.scroll == 0 ) then
		self:BuildGameScreen1()
		
	elseif ( self.scroll == 1 ) then
		self:BuildCreditScreen1()
	
	elseif ( self.scroll == 2 ) then
		self:BuildCreditScreen2()
	
	end
	
	for key, button in pairs( self.buttons ) do
		button:Draw()
	end
	
	for key, label in pairs( self.labels ) do
		label:Draw()
	end
	
	for key, image in pairs( self.images ) do
		stage:addChild( image )
	end
end

function SelectState:ClearScreen()
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
		self.images[ key ] =nil
	end
end

function SelectState:SetupUI()
	self:UpdateScroll()
end

function SelectState:BuildGameScreen1()
-- 3x3 game icon layout
	local thirdsH = 320/3
	local thirdsV = 640/6
	
	local offsetY = 75
	local setX, setY = 20, 20 + offsetY
	
	local labelFont = "tiny"
	
	table.insert( self.labels, Label.new( { text = languageManager:GetString( "full_title" ), 
		font = fontManager.small, xPos = 0, yPos = 40, centered = true, color="0xffffff" } ) )
	
	-- *** FOODS *** --
	table.insert( self.buttons, Button.new( { name = "foods", gotoState = "category_food", 
		texture = Texture.new( "content/graphics/ui/button_foods.png" ), xPos = setX, yPos = setY, size = "half",
		font = fontManager[labelFont], text = languageManager:GetString( "category_food" ), color = "0xffffff",
		xPosText = setX, yPosText = setY + 75 
		} ) )
	
	setX = setX + thirdsH
	-- *** CLOTHES *** --
		table.insert( self.buttons, Button.new( { name = "clothes", gotoState = "category_clothes", 
			texture = Texture.new( "content/graphics/ui/button_clothes.png" ), xPos = setX, yPos = setY, size = "half",
			font = fontManager[labelFont], text = languageManager:GetString( "category_clothes" ), color = "0xffffff",
			xPosText = setX, yPosText = setY + 75
			} ) )
			
	setX = setX + thirdsH
	-- *** NUMBERS *** --
	table.insert( self.buttons, Button.new( { name = "numbers", gotoState = "category_number", 
		texture = Texture.new( "content/graphics/ui/button_numbers.png" ), xPos = setX, yPos = setY , size = "half",
		font = fontManager[labelFont], text = languageManager:GetString( "category_numbers" ), color = "0xffffff",
		xPosText = setX, yPosText = setY + 75
		} ) )
		
	setX = 20
	setY = setY + thirdsV
	
	-- *** COLORS *** --
	table.insert( self.buttons, Button.new( { name = "colors", gotoState = "category_color", 
			texture = Texture.new( "content/graphics/ui/button_colors.png" ), xPos = setX, yPos = setY, size = "half",
		font = fontManager[labelFont], text = languageManager:GetString( "category_colors" ), color = "0xffffff",
		xPosText = setX, yPosText = setY + 75
		} ) )
	
	setX = setX + thirdsH
	-- *** ANIMALS *** --
		table.insert( self.buttons, Button.new( { name = "animals", gotoState = "category_animal", 
			texture = Texture.new( "content/graphics/ui/button_animals.png" ), xPos = setX, yPos = setY, size = "half",
			font = fontManager[labelFont], text = languageManager:GetString( "category_animals" ), color = "0xffffff",
			xPosText = setX, yPosText = setY + 75
			} ) )
			
	setX = setX + thirdsH
	-- *** PHRASES *** --
	table.insert( self.buttons, Button.new( { name = "comics", gotoState = "category_comic", 
			texture = Texture.new( "content/graphics/ui/button_phrases.png" ), xPos = setX, yPos = setY , size = "half",
		font = fontManager[labelFont], text = languageManager:GetString( "category_comics" ), color = "0xffffff",
		xPosText = setX - 10, yPosText = setY + 75
		} ) )
		
	setX = 20
	setY = setY + thirdsV
	
	-- *** CALENDAR *** --
	table.insert( self.buttons, Button.new( { name = "calendar", gotoState = "category_calendar", 
			texture = Texture.new( "content/graphics/ui/button_calendar.png" ), xPos = setX, yPos = setY, size = "half",
		font = fontManager[labelFont], text = languageManager:GetString( "category_calendar" ), color = "0xffffff",
		xPosText = setX, yPosText = setY + 75
		} ) )
	
	setX = setX + thirdsH
	-- *** LOCATIONS *** --
		table.insert( self.buttons, Button.new( { name = "places", gotoState = "quiz_locations", 
			texture = Texture.new( "content/graphics/ui/button_locations.png" ), xPos = setX, yPos = setY, size = "half",
			font = fontManager[labelFont], text = languageManager:GetString( "category_places" ), color = "0xffffff",
			xPosText = setX, yPosText = setY + 75
			} ) )
			
	setX = setX + thirdsH
	-- *** FAMILY *** --
	table.insert( self.buttons, Button.new( { name = "family", gotoState = "category_family", 
			texture = Texture.new( "content/graphics/ui/button_family.png" ), xPos = setX, yPos = setY, size = "half",
		font = fontManager[labelFont], text = languageManager:GetString( "category_family" ), color = "0xffffff",
		xPosText = setX, yPosText = setY + 75
		} ) )
end

function SelectState:BuildCreditScreen1()	
	local y = 40
	local inc = 20
	local x = 20
	
	local rachelTexture = Texture.new( "content/graphics/ui/credits-rachel.png" )
	local enmanuelTexture = Texture.new( "content/graphics/ui/credits-enmanuel.png" )
	
	table.insert( self.labels, Label.new( { text = languageManager:GetString( "full_title" ), 
		font = fontManager.small, xPos = x, yPos = y, centered = false, color="0xffffff" } ) ); y = y + inc
	
	table.insert( self.labels, Label.new( { text = languageManager:GetString( "by_moosader" ) .. ":", 
		font = fontManager.small, xPos = x, yPos = y, centered = false, color="0xffffff" } ) ); y = y + inc;  y = y + inc
	
	x = 40
	table.insert( self.labels, Label.new( { text = "Moosader.com", 
		font = fontManager.small, xPos = x, yPos = y, centered = true, color="0xffffff" } ) ); y = y + inc;  y = y + inc
		
	local rachelSprite = Bitmap.new( rachelTexture )
	rachelSprite:setPosition( 20, y-15 )
	table.insert( self.images, rachelSprite )
		
	x = 60
	table.insert( self.labels, Label.new( { text = "Rachel J. Morris", 
		font = fontManager.smaller, xPos = x, yPos = y, centered = false, color="0xffffff" } ) ); y = y + inc
		
	table.insert( self.labels, Label.new( { text = languageManager:GetString( "credits1" ), 
		font = fontManager.tiny, xPos = x, yPos = y, centered = false, color="0xffffff" } ) ); 
		
	x = 20
	y = y + inc; y = y + inc; y = y + (inc / 2)
	
	table.insert( self.labels, Label.new( { text = languageManager:GetString( "additional_help" ), 
		font = fontManager.small, xPos = x, yPos = y, centered = true, color="0xffffff" } ) ); y = y + inc; y = y + inc
		
		
	x = 60
	table.insert( self.labels, Label.new( { text = languageManager:GetString( "quality_review" ), 
		font = fontManager.smaller, xPos = x, yPos = y, centered = false, color="0xffffff" } ) ); 
		
	if ( languageManager:GetLanguage() == "en" ) then
		local sprite = Bitmap.new( rachelTexture )
		sprite:setPosition( 20, y-15 )
		table.insert( self.images, sprite )
		
	elseif ( languageManager:GetLanguage() == "eo" ) then
		local sprite = Bitmap.new( Texture.new( "content/graphics/ui/credits-tea.png" ) )
		sprite:setPosition( 20, y-15 )
		table.insert( self.images, sprite )
		
	elseif ( languageManager:GetLanguage() == "es" ) then
		local sprite = Bitmap.new( enmanuelTexture )
		sprite:setPosition( 20, y-15 )
		table.insert( self.images, sprite )
	
	end
	
	y = y + inc
		
	table.insert( self.labels, Label.new( { text = languageManager:GetString( "credits6" ), 
		font = fontManager.tiny, xPos =  x, yPos = y, centered = false, color="0xffffff" } ) ); y = y + inc; y = y + inc
		
	table.insert( self.labels, Label.new( { text = languageManager:GetString( "voices" ), 
		font = fontManager.smaller, xPos = x, yPos = y, centered = false, color="0xffffff" } ) ); 
		
	if ( languageManager:GetLanguage() == "en" or languageManager:GetLanguage() == "eo" ) then
		local sprite = Bitmap.new( rachelTexture )
		sprite:setPosition( 20, y-15 )
		table.insert( self.images, sprite )
		
	elseif ( languageManager:GetLanguage() == "es" ) then
		local sprite = Bitmap.new( enmanuelTexture )
		sprite:setPosition( 20, y-15 )
		table.insert( self.images, sprite )
	
	end
	
	y = y + inc
		
	table.insert( self.labels, Label.new( { text = languageManager:GetString( "credits7" ), 
		font = fontManager.tiny, xPos =  x, yPos = y, centered = false, color="0xffffff" } ) ); y = y + inc; y = y + inc
		
	table.insert( self.labels, Label.new( { text = languageManager:GetString( "testing" ), 
		font = fontManager.smaller, xPos = x, yPos = y, centered = false, color="0xffffff" } ) );
		
	local sprite = Bitmap.new( enmanuelTexture )
	sprite:setPosition( 20, y-15 )
	table.insert( self.images, sprite )
	
	 y = y + inc
		
	table.insert( self.labels, Label.new( { text = languageManager:GetString( "credits8" ), 
		font = fontManager.tiny, xPos =  x, yPos = y, centered = false, color="0xffffff" } ) ); 
	
		
		
		
end

function SelectState:BuildCreditScreen2()
	-- *** SCROLL BUTTON *** --		
	local y = 40
	local inc = 20
	local x = 20
	
	table.insert( self.labels, Label.new( { text = languageManager:GetString( "additional_help" ), 
		font = fontManager.small, xPos = x, yPos = y, centered = true, color="0xffffff" } ) ); y = y + inc; y = y + inc
		
	x = 60
	table.insert( self.labels, Label.new( { text = "Jordan Trudgett", 
		font = fontManager.smaller, xPos = x, yPos = y, centered = false, color="0xffffff" } ) );
		
	local sprite = Bitmap.new( Texture.new( "content/graphics/ui/credits-tgfcoder.png"  ) )
	sprite:setPosition( 20, y-15 )
	table.insert( self.images, sprite )
	
	 y = y + inc
		
	table.insert( self.labels, Label.new( { text = languageManager:GetString( "credits2" ) .. " " .. languageManager:GetString( "credits2b" ), 
		font = fontManager.tiny, xPos =  x, yPos = y, centered = false, color="0xffffff" } ) ); y = y + inc
		
	table.insert( self.labels, Label.new( { text = languageManager:GetString( "credits3" ) .. " " .. languageManager:GetString( "credits3b" ), 
		font = fontManager.tiny, xPos =  x, yPos = y, centered = false, color="0xffffff" } ) ); y = y + inc; y = y + inc		
	
	x = 20
	table.insert( self.labels, Label.new( { text = "OpenFontLibrary.org", 
		font = fontManager.smaller, xPos = x, yPos = y, centered = false, color="0xffffff" } ) ); y = y + inc
		
	table.insert( self.labels, Label.new( { text = languageManager:GetString( "credits4" ), 
		font = fontManager.tiny, xPos =  x+10, yPos = y, centered = false, color="0xffffff" } ) ); y = y + inc
		
	table.insert( self.labels, Label.new( { text = languageManager:GetString( "credits5" ), 
		font = fontManager.tiny, xPos =  x+10, yPos = y, centered = false, color="0xffffff" } ) ); y = y + inc; y = y + inc
		
	table.insert( self.labels, Label.new( { text = "BFXR", 
		font = fontManager.smaller, xPos = x, yPos = y, centered = false, color="0xffffff" } ) ); y = y + inc
		
	table.insert( self.labels, Label.new( { text = languageManager:GetString( "sound_effects" ), 
		font = fontManager.tiny, xPos =  x+10, yPos = y, centered = false, color="0xffffff" } ) ); y = y + inc; y = y + inc
		
	table.insert( self.labels, Label.new( { text = "Gideros", 
		font = fontManager.smaller, xPos = x, yPos = y, centered = false, color="0xffffff" } ) ); y = y + inc
		
	table.insert( self.labels, Label.new( { text = languageManager:GetString( "framework" ), 
		font = fontManager.tiny, xPos =  x+10, yPos = y, centered = false, color="0xffffff" } ) ); 
		
		
		
		y = y + inc; y = y + inc; y = y + inc
		
	table.insert( self.labels, Label.new( { text = languageManager:GetString( "thank_you_for_buying1" ), 
		font = fontManager.smaller, xPos = 20, yPos = y, centered = true, color="0xffffff" } ) ); y = y + inc
		
	table.insert( self.labels, Label.new( { text = languageManager:GetString( "thank_you_for_buying2" ), 
		font = fontManager.smaller, xPos = 20, yPos = y, centered = true, color="0xffffff" } ) ); y = y + inc
		
end

-----------------------------
-- 2. DRAWING AND CLEARING --
-----------------------------
function SelectState:Draw()
	stage:addChild( self.background )

	for key, value in pairs( self.buttons ) do
		value:Draw()
	end
	
	for key, value in pairs( self.labels ) do
		value:Draw()
	end
	
	self.scrollButton:Draw()
end

function SelectState:Clear()
	if stage:contains( self.background ) then stage:removeChild( self.background ) end
	
	for key, value in pairs( self.buttons ) do
		value:Clear()
	end
	
	for key, value in pairs( self.labels ) do
		value:Clear()
	end
	
	self.scrollButton:Clear()
end

-----------------------
-- 3. EVENT HANDLING --
-----------------------
function SelectState:Event_AndroidKey( event )
	if event.keyCode == KeyCode.BACK then
		StateManager:StateSetup( "title" )
		audioManager:PlayEffect( "cancel" )
	end
end

function SelectState:Event_MouseClick( event )
	if ( self.scrollButton:IsClicked( event ) and self.cooldown <= 0 ) then
		self.scroll = self.scroll + 1
		if ( self.scroll > self.maxScroll ) then	self.scroll = 0 		end
		self:UpdateScroll( 1 )
		self.cooldown = 10	
		audioManager:PlayEffect( "confirm" )	
	
	end

	for key, button in pairs( self.buttons ) do	
		if button:IsClicked( event ) and self.cooldown <= 0 then
		
			if button.gotoState ~= nil then
				print( "Go to " .. button.gotoState )
				StateManager:StateSetup( button.gotoState )
				audioManager:PlayEffect( "confirm" )	
			end
			
		end
		
	end
end

function SelectState:Event_Update()
	if self.cooldown > 0 then self.cooldown = self.cooldown - 1 end
end
