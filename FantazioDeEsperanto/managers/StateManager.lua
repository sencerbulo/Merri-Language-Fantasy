StateManager = Core.class()

function StateManager:init()
	self.currentState = nil	
	self.playLevel = 0
	StateManager.gotoLevel = 1
end

function StateManager:StateSetup( state, transition )
	self:NextState( state )
end

function StateManager:NextState( state )
	if self.currentState ~= nil then
		self.currentState:BreakDown()
	end
	
	self.currentState = nil
	for key, value in pairs( states ) do
		if value.name == state then
			self.currentState = value
		end
	end
	
	if self.currentState == nil then
		print( "ERROR: Could not find state ", state )
	else
		self.currentState:Setup()
		self.currentState:ReloadLanguage()
		self.currentState:Draw()
	end	
end

function StateManager:ForwardTransition()
	transitioner.counter = transitioner.counter - transitioner.speed
	transitioner.curtain:setPosition( 0, transitioner.counter )
end

function StateManager:ReverseTransition()
	transitioner.counter = transitioner.counter + transitioner.speed
	transitioner.curtain:setPosition( 0, transitioner.counter )
end			