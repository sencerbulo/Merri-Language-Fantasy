currentState = LanguageSelectState.new()

function Handle_EnterFrame( event )
	currentState:Handle_EnterFrame( event )
end

stage:addEventListener( Event.ENTER_FRAME, Handle_EnterFrame, self )
