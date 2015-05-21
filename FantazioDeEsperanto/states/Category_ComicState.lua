CategoryComicState = Core.class()

function CategoryComicState:init( options )
	self.name = options.name
end

----------------------------
-- 1. SETUP AND BREAKDOWN --
----------------------------
function CategoryComicState:Setup()
	self.textures = {
		background 		= Texture.new( "content/graphics/ui/bluemenu.png" ),
		blackbg				= Texture.new( "content/graphics/ui/background_polkadot.png" ),
		scroll_left				= Texture.new( "content/graphics/ui/pointer_left.png" ),
		scroll_right			= Texture.new( "content/graphics/ui/pointer_right.png" ),
	}
	
	self.buttons = {}
	self.labels = {}
	self.images = {}
	
	self.screen = "select"
	-- select, lostcat, ???
	self.scroll = 1
	self.maxScroll = 5

	self.comicPath = "content/graphics/comics/"
	self.comicFile = ""
	
	self.background = Bitmap.new( self.textures.background )
	
	self:SetupUI()
	audioManager:PlaySong( "minigame1" )
	
	self.background:addEventListener( Event.MOUSE_DOWN, self.Event_MouseClick, self )
	stage:addEventListener(Event.KEY_DOWN, self.Event_AndroidKey, self )
end

function CategoryComicState:BreakDown()
	self:Clear()
	self.background:removeEventListener( Event.MOUSE_DOWN, self.Event_MouseClick, self )
	stage:removeEventListener(Event.KEY_DOWN, self.Event_AndroidKey, self )
end

function CategoryComicState:ReloadLanguage()
end

function CategoryComicState:SetupUI()
	self:ClearAndErase()
	if ( self.screen == "select" ) then
		self:SetupSelectScreen()
		
	elseif ( self.screen == "lostcat" ) then
		self:SetupComic( "lostcat", 1 )
		
	end
	self:Draw()
end

-----------------------------
-- 2. DRAWING AND CLEARING --
-----------------------------
function CategoryComicState:Draw()
	stage:addChild( self.background )
	
	for key, value in pairs( self.buttons ) do
		value:Draw()
	end
	
	for key, value in pairs( self.images ) do
		stage:addChild( value )
	end
	
	for key, value in pairs( self.labels ) do
		value:Draw()
	end
end

function CategoryComicState:Clear()
	if ( stage:contains( self.background ) ) then	stage:removeChild( self.background ) end
	
	for key, value in pairs( self.buttons ) do
		value:Clear()
	end
	
	for key, value in pairs( self.images ) do
		if stage:contains( value ) then  stage:removeChild( value )	end
	end
	
	for key, value in pairs( self.labels ) do
		value:Clear()
	end
end

function CategoryComicState:ClearAndErase()
	if ( stage:contains( self.background ) ) then	stage:removeChild( self.background ) end
	
	for key, value in pairs( self.buttons ) do
		value:Clear()
		--self.buttons[key] = nil
	end
	
	for key, value in pairs( self.labels ) do
		value:Clear()
		--self.labels[key] = nil
	end
	
	for key, value in pairs( self.images ) do
		if stage:contains( value ) then stage:removeChild( value ) end
		--self.images[key] = nil
	end	
	
end

-----------------------
-- 3. EVENT HANDLING --
-----------------------
function CategoryComicState:Event_AndroidKey( event )
	if event.keyCode == KeyCode.BACK then
		if ( self.screen == "select" ) then
			StateManager:StateSetup( "select" )
			
		else
			--self.screen = "select"
			--self:Clear()
			--self:SetupUI()
			StateManager:StateSetup( "select" )
			
		end
		
	end
end

function CategoryComicState:Event_MouseClick( event )
	
	for key, button in pairs( self.buttons ) do
		if ( button:IsClicked( event ) ) then
		
			if ( button.name == "scroll_left" ) then
				self.scroll = self.scroll - 1
				if ( self.scroll < 1 ) then	
					self.scroll = 1
				end
				self:Scroll()
				audioManager:PlayEffect( "confirm" )	
		
		
			elseif ( button.name == "scroll_right" ) then
				self.scroll = self.scroll + 1
				if ( self.scroll > self.maxScroll ) then
					self.scroll = self.maxScroll
				end
				self:Scroll()
				audioManager:PlayEffect( "confirm" )	
		
		
			elseif ( button.name == "lostcat" ) then
				self.screen = "lostcat"
				self.scroll = 1
				self:SetupUI()
				audioManager:PlayEffect( "confirm" )	
			end
			
		end
	end
end

function CategoryComicState:Event_Update()
end
	
function CategoryComicState:SetupSelectScreen()
	self.background:setTexture( self.textures.background )
	local x = 20
	local y = 20
	self.buttons.lostcat = Button.new( {
		text = languageManager:GetString( "lostcat_title" ), texture = Texture.new( "content/graphics/comics/button_lostcat.png" ), name = "lostcat",
		xPos = x, yPos = y, xPosText = x + 110, yPosText = y + 55, font = fontManager.small, color = "0xffffff",
	} )
end

function CategoryComicState:SetupComic()
	self.background:setTexture( self.textures.blackbg )
	local x = 10
	local y = 480 - 10 - 80
	
	self.buttons.scroll_left 		= Button.new( { texture = self.textures.scroll_left, name = "scroll_left", xPos = x, yPos = y, size="double" } )
	x = 320 - 10 - 80
	self.buttons.scroll_right 	= Button.new( { texture = self.textures.scroll_right, name = "scroll_right", xPos = x, yPos = y, size="double" } )
	
	if ( self.screen == "lostcat" ) then
		self.maxScroll = 27
	end
	
	self.comicFile = self.screen .. "_" .. self.scroll .. ".png"
	self.images.page = Bitmap.new( Texture.new( self.comicPath .. self.comicFile ) )
	self.labels.page = Label.new( {
		text = self.scroll .. " / " .. self.maxScroll, color = "0xffffff", font = fontManager.small, centered = true, yPos = y+50, xPos = 0,
	} )
	
	-- Setup text
	self:SetupDialogue()
end

function CategoryComicState:SetupDialogue()
	local textString = languageManager:GetString( self.screen .. self.scroll )
	local string1, string2 = "", ""
	
	print( #textString )
	if ( #textString > 30 ) then
		-- Find whitespace we can split on
		local lastWhitespace = 0
		for i = 1, 30 do
			if ( string.sub( textString, i, i ) == " " ) then
				lastWhitespace = i
			end
		end
		
		print( "Last whitespace:", lastWhitespace )
		
		string1 = string.sub( textString, 1, lastWhitespace )
		string2 = string.sub( textString, lastWhitespace )
		
	else
		string1 = textString
	end
	
	if ( self.labels.dialogue == nil ) then
		self.labels.dialogue = Label.new( {
			text = string1, color = "0x000000", font = fontManager.smaller, centered = true, yPos = 15, xPos = 0,
		} )
		self.labels.dialogue2 = Label.new( {
			text = string2, color = "0x000000", font = fontManager.smaller, centered = true, yPos = 30, xPos = 0,
		} )
		
	else
		self.labels.dialogue:SetText( string1 )
		self.labels.dialogue2:SetText( string2 )
	
	end
end

function CategoryComicState:Scroll()
	self.comicFile = self.screen .. "_" .. self.scroll .. ".png"
	
	self.images.page:setTexture( Texture.new( self.comicPath .. self.comicFile ) )
	
	self.labels.page:SetText( self.scroll .. " / " .. self.maxScroll )
	
	self:SetupDialogue()
	--self.labels.dialogue:SetText( languageManager:GetString( self.screen .. self.scroll ) )
	
end




