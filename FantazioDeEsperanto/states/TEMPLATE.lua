TemplateState = Core.class()

function TemplateState:init( options )
	self.name = options.name
end

----------------------------
-- 1. SETUP AND BREAKDOWN --
----------------------------
function TemplateState:Setup()
	self.textures = {
		background 		= Texture.new( "content/graphics/ui/background.png" ),
	}
	
	self.buttons = {}
	self.labels = {}
	
	self.background = Bitmap.new( self.textures.background )
	
	self:SetupUI()
	
	self.background:addEventListener( Event.MOUSE_DOWN, self.Event_MouseClick, self )
	stage:addEventListener(Event.KEY_DOWN, self.Event_AndroidKey, self )
end

function TemplateState:BreakDown()
	self:Clear()
	self.background:removeEventListener( Event.MOUSE_DOWN, self.Event_MouseClick, self )
	stage:removeEventListener(Event.KEY_DOWN, self.Event_AndroidKey, self )
end

function TemplateState:ReloadLanguage()
end

function TemplateState:SetupUI()
	--table.insert( self.labels, Label.new( { text = "Created by Moosader", font = fontManager.tiny, xPos = 185, yPos = 475, centered = false } ) )
end

-----------------------------
-- 2. DRAWING AND CLEARING --
-----------------------------
function TemplateState:Draw()
	stage:addChild( self.background )
	
	for key, value in pairs( self.buttons ) do
		value:Draw()
	end
	
	for key, value in pairs( self.labels ) do
		value:Draw()
	end
end

function TemplateState:Clear()
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
function TemplateState:Event_AndroidKey( event )
	if event.keyCode == KeyCode.BACK then
		--StateManager:StateSetup( "title" )
	end
end

function TemplateState:Event_MouseClick( event )
end

function TemplateState:Event_Update()
end