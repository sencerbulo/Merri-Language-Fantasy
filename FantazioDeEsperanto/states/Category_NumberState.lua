CategoryNumberState = Core.class()

function CategoryNumberState:init( options )
	self.name = options.name
end

----------------------------
-- 1. SETUP AND BREAKDOWN --
----------------------------
function CategoryNumberState:Setup()
	self.textures = {
		background 		= Texture.new( "content/graphics/game/background_classroom.png" ),
		button_long			= Texture.new( "content/graphics/ui/choice_button_long.png" ),
		disabledButton_long = Texture.new( "content/graphics/ui/choice_button_long_disabled.png" ),
		
		teacher_idle = Texture.new( "content/graphics/game/characters/teacher_idle.png" ),
		teacher_angry = Texture.new( "content/graphics/game/characters/teacher_angry.png" ),
		teacher_pleased = Texture.new( "content/graphics/game/characters/teacher_pleased.png" ),
	}
	
	self.buttons = {}
	self.labels = {}
	self.images = {}
	
	self.score = 0
	self.scoreText = Label.new( { text = languageManager:GetString( "correct" ) .. ": " .. self.score, 
			font = fontManager.smaller, xPos = 170, yPos = 165, centered = false, color="0xffffff" } )
			
	self.questions = 0
	self.totalQuestions = Label.new( { text = languageManager:GetString( "questions" ) .. ": " .. self.questions, 
			font = fontManager.smaller, xPos = 20, yPos = 165, centered = false, color="0xffffff" } )
	
	self.cooldown = 0
	self.audioCounter = 0
	self.audioCounterMax = 120
	self.firstGuess = true
	self.newQuestionCountdown = 0
	
	self.background = Bitmap.new( self.textures.background )
	
	self.images.teacher = Bitmap.new( self.textures.teacher_idle )
	self.images.teacher:setPosition( 10, 175 )
	
	audioManager:PlaySong( "minigame2" )
	
	self:SetupUI()
	self:GetNewQuestion()
	
	self.background:addEventListener( Event.MOUSE_DOWN, self.Event_MouseClick, self )
	self.background:addEventListener( Event.ENTER_FRAME, self.Event_Update, self )
	stage:addEventListener(Event.KEY_DOWN, self.Event_AndroidKey, self )
end

function CategoryNumberState:BreakDown()
	self:Clear()
	self.background:removeEventListener( Event.MOUSE_DOWN, self.Event_MouseClick, self )
	self.background:removeEventListener( Event.ENTER_FRAME, self.Event_Update, self )
	stage:removeEventListener(Event.KEY_DOWN, self.Event_AndroidKey, self )
end

function CategoryNumberState:ReloadLanguage()
end

function CategoryNumberState:SetupUI()
end

function CategoryNumberState:ClearUI()
	-- Clear and re-setup UI
	for key, button in pairs( self.buttons ) do
		button:Clear()
		self.buttons[ key ] = nil
	end
	
	for key, label in pairs( self.labels ) do
		label:Clear()
		self.labels[ key ] = nil
	end
end

function CategoryNumberState:RedrawUI()
	-- Draw new assets
	for key, button in pairs( self.buttons ) do
		button:Draw()
	end
	
	for key, label in pairs( self.labels ) do
		label:Draw()
	end
end

function CategoryNumberState:GetNewQuestion()
	self:ClearUI()
	self.firstGuess = true
	
	-- Generate a math problem, that results in the correct answer
	
	local answer = math.random( 0, 30 )
	self.correctAnswer = answer
	
	local number1 = math.random( 0, answer )
	local number2 = answer - number1
	
	self.number1 = number1
	self.number2 = number2
	
	local whichIndexIsCorrect = math.random( 1, 3 )
	
	for i = 1, 3 do
		local buttonName = ""
		
		local height = 52
		local top = 480 - ( height * 3 )
		local offset = 3
		local x = 10
		
		if i == whichIndexIsCorrect then
			-- Correct answer
			buttonName = answer
			
		else
			-- Wrong answer
			local wrongAnswer = answer
			
			while wrongAnswer == answer do
				wrongAnswer = math.random( 0, 30 )
			end
			
			buttonName = wrongAnswer
		end
		
		local question = languageManager:GetString( "number" .. number1 ) .. " + " .. languageManager:GetString( "number" .. number2 ) .. " = ?"
			
		table.insert( self.labels, Label.new( { text = question, font = fontManager.small, xPos = 0, yPos = 100, centered = true, color="0xffffff" } ) )
	
		table.insert( self.buttons, Button.new( { name = buttonName, 
			texture = self.textures.button_long, xPos = x, yPos = top + height * (i-1), text = languageManager:GetString( "number" .. buttonName ), font = fontManager.small, color="0xffffff", 
			centered = true, yPosText = top + height * (i-1) + 30, purpose = "answer" } ) )
		
	end
	
	self:RedrawUI()
	
	self.audioCounter = self.audioCounterMax
end

-----------------------------
-- 2. DRAWING AND CLEARING --
-----------------------------
function CategoryNumberState:Draw()
	stage:addChild( self.background )
	
	for key, value in pairs( self.buttons ) do
		value:Draw()
	end
	
	for key, value in pairs( self.labels ) do
		value:Draw()
	end
	
	for key, value in pairs( self.images ) do
		stage:addChild( value )
	end
			
	self.scoreText:Draw()
	self.totalQuestions:Draw()
	
	self:RedrawUI()
end

function CategoryNumberState:Clear()
	stage:removeChild( self.background )
	
	for key, value in pairs( self.buttons ) do
		value:Clear()
	end
	
	for key, value in pairs( self.labels ) do
		value:Clear()
	end
	
	for key, value in pairs( self.images ) do
		stage:removeChild( value )
	end
			
	self.scoreText:Clear()
	self.totalQuestions:Clear()
end

-----------------------
-- 3. EVENT HANDLING --
-----------------------
function CategoryNumberState:Event_AndroidKey( event )
	if event.keyCode == KeyCode.BACK then
		StateManager:StateSetup( "select" )
		audioManager:PlayEffect( "cancel" )
	end
end

function CategoryNumberState:Event_MouseClick( event )
	for key, button in pairs( self.buttons ) do
		if button:IsClicked( event ) and self.cooldown <= 0 then
			
			if self.correctAnswer == button.name then
				-- Correct
					self.cooldown = 10
					audioManager:PlayEffect( "correct" )
				
					self.questions = self.questions + 1
					self.totalQuestions:SetText( languageManager:GetString( "questions" ) .. ": " .. self.questions )
					
					self.images.teacher:setTexture( self.textures.teacher_idle )
					
					if self.firstGuess == true then						
						self.score = self.score + 1
						self.scoreText:SetText( languageManager:GetString( "correct" ) .. ": " .. self.score )
					self.images.teacher:setTexture( self.textures.teacher_pleased )
					end
					self.newQuestionCountdown = 50
					self:ClearUI()
					audioManager:PlaySpecial( "number" .. button.name )
			
			else
				-- Incorrect
					audioManager:PlayEffect( "incorrect" )
					self.firstGuess = false
					button.bitmap:setTexture( self.textures.disabledButton_long )
					self.images.teacher:setTexture( self.textures.teacher_angry )
					
					audioManager:PlaySpecial( "number" .. button.name )
				
			end
			
		end
	end
end

function CategoryNumberState:Event_Update()
	if self.cooldown > 0 then	
		self.cooldown = self.cooldown - 1
	end
	
	if self.audioCounter > 0 then
	
		if self.audioCounter == self.audioCounterMax then
			audioManager:PlaySpecial( "number" .. self.number1 )
			
		elseif self.audioCounter == math.floor( self.audioCounterMax * ( 2 / 3 ) ) then
			audioManager:PlaySpecial( "plus" )
		
		elseif self.audioCounter == math.floor( self.audioCounterMax / 3 ) then
			audioManager:PlaySpecial( "number" .. self.number2 )

		end
		
		self.audioCounter = self.audioCounter - 1
	end
	
	
	if self.newQuestionCountdown > 0 then
		self.newQuestionCountdown = self.newQuestionCountdown - 1
		if self.newQuestionCountdown == 0 then
					self:GetNewQuestion()		
		end
	end
	
end
