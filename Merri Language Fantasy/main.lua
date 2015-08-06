currentState = LanguageSelectState.new()
currentState:Setup()

function Handle_EnterFrame( event )
	print( "Cheese" )
	currentState:Handle_EnterFrame( event )
end

stage:addEventListener( Event.ENTER_FRAME, Handle_EnterFrame, self )

print( "Hi" )