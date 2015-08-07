currentState = DifficultySelectState.new()

function Handle_EnterFrame( event )
	currentState:Handle_EnterFrame( event )
end

function Handle_MouseDown( event )
	currentState:Handle_MouseDown( event )
end

stage:addEventListener( Event.ENTER_FRAME, Handle_EnterFrame, self )
stage:addEventListener( Event.MOUSE_DOWN, Handle_MouseDown, self )
