AnimalBattleState = Core.class( StateBase )

function AnimalBattleState:init( options )
	StateBase:init( options )
	StateBase:Setup( { backgroundScroll = true } )
end

-- Setup / Teardown --
function AnimalBattleState:Setup( options )
	StateBase:SetGotoState( "" )
	self:Draw()
end

function AnimalBattleState:Cleanup()
	StateBase:ClearWidgets()
end

function AnimalBattleState:Draw()
	StateBase:Draw()
end

-- Callbacks --
function AnimalBattleState:Handle_AndroidKey( event )
end

function AnimalBattleState:Handle_KeyDown( event )
end

function AnimalBattleState:Handle_MouseDown( event )
	clickedButton = StateBase:ClickedButtonName( event )
	print( "Clicked ", clickedButton )
--	if ( clickedButton == "btn_play" ) then
--		StateBase:SetGotoState( "MinerGameState" )	
--	end
end

function AnimalBattleState:Handle_EnterFrame( event )
	StateBase:Update()
end

function AnimalBattleState:ClearScreen()
	StateBase:ClearScreen()	
end

function AnimalBattleState:ClearWidgets()
	StateBase:ClearWidgets()
end

function AnimalBattleState:GotoState()
	return StateBase:GotoState()
end
