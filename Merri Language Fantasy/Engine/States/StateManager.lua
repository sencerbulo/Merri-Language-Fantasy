StateManager  = Core.class()

function StateManager:init()
	self.states = {}
	self.currentState = nil
end

function StateManager:AddState( name, object )
	print( "Add state \"" .. name .. "\", object address ", object )
	self.states[ name ] = object
end

function StateManager:ChangeState( name )
	if ( self.currentState ~= nil ) then
		self.currentState:ClearScreen()
		self.currentState:ClearWidgets()
	end

	if ( self.states[ name ] ~= nil ) then
		self.currentState = self.states[ name ]
		self.currentState:Setup()
		print( "State changed to \"" .. name .. "\"" )
	else
		print( "Error: State \"" .. name .. "\" doesn't exist!" )
	end
end

function StateManager:Handle_EnterFrame( options )

	print( "Set goto state ", self.currentState:GotoState() )
	
	if ( self.currentState:GotoState() ~= "" ) then
		self:ChangeState( self.currentState:GotoState() )
	end


	if ( self.currentState == nil ) then return end
	self.currentState:Handle_EnterFrame( options )
end

function StateManager:Handle_MouseDown( options )
	if ( self.currentState == nil ) then return end
	self.currentState:Handle_MouseDown( options )
end