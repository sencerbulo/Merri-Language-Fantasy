Template = Core.class( StateBase )

function Template:init( options )
	StateBase:init( options )
	StateBase:Setup( { backgroundScroll = true } )
end

-- Setup / Teardown --
function Template:Setup( options )
	StateBase:SetGotoState( "" )
	self:Draw()
end

function Template:Cleanup()
	StateBase:ClearWidgets()
end

function Template:Draw()
	StateBase:Draw()
end

-- Callbacks --
function Template:Handle_AndroidKey( event )
end

function Template:Handle_KeyDown( event )
end

function Template:Handle_MouseDown( event )
	clickedButton = StateBase:ClickedButtonName( event )
	print( "Clicked ", clickedButton )
--	if ( clickedButton == "btn_play" ) then
--		StateBase:SetGotoState( "MinerGameState" )	
--	end
end

function Template:Handle_EnterFrame( event )
	StateBase:Update()
end

function Template:ClearScreen()
	StateBase:ClearScreen()	
end

function Template:ClearWidgets()
	StateBase:ClearWidgets()
end

function Template:GotoState()
	return StateBase:GotoState()
end
