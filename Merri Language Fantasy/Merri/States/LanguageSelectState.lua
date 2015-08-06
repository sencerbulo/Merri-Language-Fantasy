LanguageSelectState = Core.class( StateBase )

function LanguageSelectState:init( options )
	StateBase:init( options )
	self:Setup( options )
end

-- Setup / Teardown --
function LanguageSelectState:Setup( options )
	StateBase:AddBitmap( { id = "bg", path = "Content/Graphics/UI/dnk-half.png",  pos_x = 10, pos_y = 0 } )
	self:Draw()
end

function LanguageSelectState:Cleanup()
end

function LanguageSelectState:Draw()
	StateBase:Draw()
end

-- Cyclical --
function LanguageSelectState:Update()
end

-- Callbacks --
function LanguageSelectState:Handle_AndroidKey( event )
end

function LanguageSelectState:Handle_KeyDown( event )
end

function LanguageSelectState:Handle_MouseDown( event )
end

function LanguageSelectState:Handle_EnterFrame( event )
end