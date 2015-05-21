TitleState = Core.class()

function TitleState:init( options )
	self.name = options.name
end

----------------------------
-- 1. SETUP AND BREAKDOWN --
----------------------------
function TitleState:Setup()
	self.textures = {
		background 		= Texture.new( "content/graphics/ui/titlescreen.png" ),
	}
	
	self.buttons = {}
	self.labels = {}
	
	self.background = Bitmap.new( self.textures.background )
	
	self:SetupUI()
	
	audioManager:PlaySong( "titlescreen" )
	
	self.background:addEventListener( Event.MOUSE_DOWN, self.Event_MouseClick, self )
	stage:addEventListener(Event.KEY_DOWN, self.Event_AndroidKey, self )
end

function TitleState:BreakDown()
	self:Clear()
	self.background:removeEventListener( Event.MOUSE_DOWN, self.Event_MouseClick, self )
	stage:removeEventListener(Event.KEY_DOWN, self.Event_AndroidKey, self )
end

function TitleState:ReloadLanguage()
end

function TitleState:SetupUI()
	local centerX = SCREEN_WIDTH / 2 - fontManager.title.width * string.len( languageManager:GetString( "title1" ) ) / 2
	table.insert( self.labels, Label.new( { text = languageManager:GetString( "title1" ), 
		font = fontManager.title, xPos = centerX+1, yPos = 41, centered = false } ) )
		
	local centerX = SCREEN_WIDTH / 2 - fontManager.title.width * string.len( languageManager:GetString( "title2" ) ) / 2
	table.insert( self.labels, Label.new( { text = languageManager:GetString( "title2" ), 
		font = fontManager.title, xPos = centerX+1, yPos = 76, centered = false } ) )
		
	local centerX = SCREEN_WIDTH / 2 - fontManager.title.width * string.len( languageManager:GetString( "title3" ) ) / 2
	table.insert( self.labels, Label.new( { text = languageManager:GetString( "title3" ), 
		font = fontManager.title, xPos = centerX+1, yPos = 111, centered = false } ) )
		
	local centerX = SCREEN_WIDTH / 2 - fontManager.title.width * string.len( languageManager:GetString( "title1" ) ) / 2
	table.insert( self.labels, Label.new( { text = languageManager:GetString( "title1" ), 
		font = fontManager.title, xPos = centerX, yPos = 40, centered = false, color = "0xffffff" } ) )
		
	local centerX = SCREEN_WIDTH / 2 - fontManager.title.width * string.len( languageManager:GetString( "title2" ) ) / 2
	table.insert( self.labels, Label.new( { text = languageManager:GetString( "title2" ), 
		font = fontManager.title, xPos = centerX, yPos = 75, centered = false, color = "0xffffff" } ) )
		
	local centerX = SCREEN_WIDTH / 2 - fontManager.title.width * string.len( languageManager:GetString( "title3" ) ) / 2
	table.insert( self.labels, Label.new( { text = languageManager:GetString( "title3" ), 
		font = fontManager.title, xPos = centerX, yPos = 110, centered = false, color = "0xffffff" } ) )
		
	table.insert( self.labels, Label.new( { text = languageManager:GetString( "touch_to_begin" ), 
		font = fontManager.small, xPos = centerX+1, yPos = 200, centered = true, effect = "flash" } ) )
end

-----------------------------
-- 2. DRAWING AND CLEARING --
-----------------------------
function TitleState:Draw()
	stage:addChild( self.background )
	
	for key, value in pairs( self.buttons ) do
		value:Draw()
	end
	
	for key, value in pairs( self.labels ) do
		value:Draw()
	end
end

function TitleState:Clear()
	stage:removeChild( self.background )
	
	for key, value in pairs( self.buttons ) do
		value:Clear()
	end
	
	for key, value in pairs( self.labels ) do
		value:Clear()
	end
end

-----------------------
-- 3. EVENT HANDLING --
-----------------------
function TitleState:Event_AndroidKey( event )
	if event.keyCode == KeyCode.BACK then
		--StateManager:StateSetup( "title" )
	end
end

function TitleState:Event_MouseClick( event )
	StateManager:StateSetup( "select" )
end

function TitleState:Event_Update()
end