CategoryAnimalState = Core.class()

function CategoryAnimalState:init( options )
	self.name = options.name
end

----------------------------
-- 1. SETUP AND BREAKDOWN --
----------------------------
function CategoryAnimalState:Setup()
	self.textures = {
		background 		= Texture.new( "content/graphics/game/background_animals.png" ),
		button					= Texture.new( "content/graphics/ui/choice_button.png" ),
		button_long			= Texture.new( "content/graphics/ui/choice_button_long.png" ),
		disabledButton = Texture.new( "content/graphics/ui/choice_disabled.png" ),
		disabledButton_long = Texture.new( "content/graphics/ui/choice_button_long_disabled.png" ),
		
		girl_idle = Texture.new( "content/graphics/game/characters/fighter_idle.png" ),
		girl_attack1 = Texture.new( "content/graphics/game/characters/fighter_attack1.png" ),
		girl_attack2 = Texture.new( "content/graphics/game/characters/fighter_attack2.png" ),
	}
	
	self.buttons = {}
	self.labels = {}
	self.images = {}
	
	self.deadAnimals = {}
	
	self.score = 0
	self.scoreText = Label.new( { text = languageManager:GetString( "correct" ) .. ": " .. self.score, 
			font = fontManager.smaller, xPos = 170, yPos = 60, centered = false, color="0xffffff" } )
			
	self.questions = 0
	self.totalQuestions = Label.new( { text = languageManager:GetString( "questions" ) .. ": " .. self.questions, 
			font = fontManager.smaller, xPos = 30, yPos = 60, centered = false, color="0xffffff" } )
	
	self.cooldown = 0
	self.firstGuess = true
	
	self.background = Bitmap.new( self.textures.background )
	self:SetupUI()
	
	self.images.player = Bitmap.new( self.textures.girl_idle )
	self.images.player:setPosition( 200, 150 )
	
	audioManager:PlaySong( "minigame2" )
	self.quizzer = QuizManager.new( { type = "animals" } )
	
	self.currentQuestion = nil
	self.questionType = nil
	
	self.animateArrival = 0
	self.animateLeaving = 0
	self.counter = 0
	self:NewQuestion_Transition_Begin()
	
	self.background:addEventListener( Event.MOUSE_DOWN, self.Event_MouseClick, self )
	self.background:addEventListener( Event.ENTER_FRAME, self.Event_Update, self )
	stage:addEventListener(Event.KEY_DOWN, self.Event_AndroidKey, self )
end

function CategoryAnimalState:NewQuestion_Transition_Begin()
	self.animateArrival = 60
	
	for key, value in pairs( self.deadAnimals ) do
		self.deadAnimals[ key ] = nil
	end
	
	self:GetNewQuestion()
	self.images.player:setTexture( self.textures.girl_idle )
	
	-- Setup animal starting points
	if ( self.questionType == "PhraseToIcon" ) then
		-- Three animals
	
	elseif ( self.questionType == "IconToWord" ) then
		-- One animal
	
	end
end

function CategoryAnimalState:NewQuestion_Transition_Update()
	-- Continue with animations
	--self.animateArrival = self.animateArrival - 1

	-- Animate
	if ( self.questionType == "PhraseToIcon" ) then
		-- Three animals
		for i = 1, 3 do
			local x, y = self.buttons[ "animal" .. i ]:GetPosition()
			self.buttons[ "animal" .. i ]:SetPosition( x + 3, y )
		end
	
	elseif ( self.questionType == "IconToWord" ) then
		-- One animal
		local x, y = self.buttons[ "animal1" ]:GetPosition()
		self.buttons[ "animal1" ]:SetPosition( x + 3, y )
	
	end

	-- Check for question begin
	local maxX = 80
	local x, y = self.buttons[ "animal1" ]:GetPosition()
	if ( x >= maxX ) then
		self.animateArrival = 0
		self.buttons[ "animal1" ]:SetPosition( maxX, y )
		-- Display question
		
		if ( self.questionType == "PhraseToIcon" ) then -- "Attack the ____!"
			self.labels.question = Label.new( { text = self.currentQuestion.phrase, 
				font = fontManager.small, xPos = 20, yPos = 25, centered = true, color="0xffffff" } )
			self.labels.question:Draw()
			audioManager:PlaySpecial( "animals_attack_" .. self.currentQuestion.word_english )
			
		else -- "What is that?"
		
			self.labels.question = Label.new( { text = languageManager:GetString( "what_is_that" ), 
				font = fontManager.small, xPos = 20, yPos = 25, centered = true, color="0xffffff" } )
			self.labels.question:Draw()			
			audioManager:PlaySpecial( "animals_what_is_that" )
			
		end
	end


end

function CategoryAnimalState:AnsweredQuestion_Transition_Begin()
	self.animateLeaving = 60
	
	if ( self.questionType == "PhraseToIcon" ) then
		-- Three animals
	
	elseif ( self.questionType == "IconToWord" ) then
		-- One animal
	
	end
end

function CategoryAnimalState:AnsweredQuestion_Transition_Update()
	-- Animate
	
	self.counter = self.counter + 1
	-- Player attack
	if ( self.counter %  20 < 10 ) then
		self.images.player:setTexture( self.textures.girl_attack1 )
		
	else
		self.images.player:setTexture( self.textures.girl_attack2 )
	
	end
	
	if ( self.counter % 20 == 0 ) then
		audioManager:PlayEffect( "attack" )
	end
	
	local notAnswerIndex = 0
	if ( self.questionType == "PhraseToIcon" ) then
		-- Three animals
		-- Correct answer animal falls over
		for i = 1, 3 do
			if ( self.buttons[ "animal" .. i ].purpose == "answer" and self.buttons[ "animal" .. i ].name == self.currentQuestion.word_translated ) then
				local rotation = self.buttons[ "animal" .. i ].bitmap:getRotation()
				self.buttons[ "animal" .. i ].bitmap:setRotation( -180 )
				
				local r, g, b, a = self.buttons[ "animal" .. i ].bitmap:getColorTransform()
				self.buttons[ "animal" .. i ].bitmap:setColorTransform( 1, 0.5, 0.5, a - 0.05 )
			
			elseif ( self.buttons[ "animal" .. i ].purpose == "answer" ) then
				if self.deadAnimals[ "animal" .. i ] == nil or self.deadAnimals[ "animal" .. i ] == false then
					local x, y = self.buttons[ "animal" .. i ]:GetPosition()
					self.buttons[ "animal" .. i ]:SetPosition( x - 3, y )			
					notAnswerIndex = i	
				else
					local r, g, b, a = self.buttons[ "animal" .. i ].bitmap:getColorTransform()
					self.buttons[ "animal" .. i ].bitmap:setColorTransform( 1, 0.5, 0.5, a - 0.05 )
				end
			
			end
		end
	
	elseif ( self.questionType == "IconToWord" ) then
		-- One animal
		local i = 1
		local rotation = self.buttons[ "animal" .. i ].bitmap:getRotation()
		self.buttons[ "animal" .. i ].bitmap:setRotation( -180 )
		
		local r, g, b, a = self.buttons[ "animal" .. i ].bitmap:getColorTransform()
		self.buttons[ "animal" .. i ].bitmap:setColorTransform( 1, 0.5, 0.5, a - 0.05 )
	
	end
	
	local ended = false
	if ( notAnswerIndex == 0 ) then
		self.animateLeaving = self.animateLeaving - 1
		if ( self.animateLeaving <= 0 ) then
			ended = true
		end
		
	else
		local x, y = self.buttons[ "animal" .. notAnswerIndex ]:GetPosition()
		if ( x < -150 ) then
			ended = true
		end
	
	end
	
	if ( ended ) then
		self.animateLeaving = 0
		-- End of the outgoing transition
		self:ClearUI()
		self:NewQuestion_Transition_Begin()
		
	end
end

function CategoryAnimalState:Event_Update()
	if ( self.animateArrival > 0 ) then
		self:NewQuestion_Transition_Update()
		
	elseif ( self.animateLeaving > 0 ) then
		self:AnsweredQuestion_Transition_Update()
		
	end	

	if self.cooldown > 0 then	
		self.cooldown = self.cooldown - 1
	end
end

function CategoryAnimalState:GetNewQuestion()
	-- TODO: Clean this up!!
	self.currentQuestion = self.quizzer:GenerateQuestion()
	self.firstGuess = true
		
	local randVal = math.random( 1, 2 )
	if randVal == 1 then -- EO phrase Question, icon answer
		self.questionType = "PhraseToIcon"
		
		local rightAnswer = math.random( 1, 3 ) -- Correct answer position
		local takenWords = {}
		table.insert( takenWords, self.currentQuestion.word_english )
		
		for i = 1, 3 do
			local buttonName = ""
			local foodTexture = nil
			local englishName = ""
		
			if i == rightAnswer then
				buttonName = self.currentQuestion.word_translated
				foodTexture = Texture.new( "content/graphics/game/animals/" .. self.currentQuestion.word_english .. ".png" )
			
			else
				local randomFood = nil
				
				local original = false
				while original == false do
					randomFood = self.quizzer:GetRandomItem()
					
					original = true
					for key, value in pairs( takenWords ) do
						if value == randomFood.word_english then
							original = false
						end
					end
				end
				
				englishName = randomFood.word_english
				table.insert( takenWords, randomFood.word_english )
				buttonName = randomFood.word_translated
				foodTexture = Texture.new( "content/graphics/game/animals/" .. randomFood.word_english .. ".png" )
			end
			
			local scaleSize = 1
			local yPosition = ( i - 1 ) * 130 + 75
			
			self.buttons[ "animal" .. i ] = Button.new( { 
				name = buttonName, texture = foodTexture, xPos = -150, yPos = yPosition + 60, purpose = "answer",
				size = scaleSize
				} )
			self.buttons[ "animal" .. i ].bitmap:setAnchorPoint( 0.5, 0.5 )
		end
				
	
	elseif randVal == 2 then -- Icon Question, EO word answer
		self.questionType = "IconToWord"
		local height = 52
		local top = 480 - ( height * 3 )
		local offset = 3
		local x = 10
		
		local rightAnswer = math.random( 1, 3 ) -- Correct answer position
		local takenWords = {}
		table.insert( takenWords, self.currentQuestion.word_english )
		
		for i = 1, 3 do
			local buttonName = ""
			local englishName
		
			if i == rightAnswer then
				buttonName = self.currentQuestion.word_translated
			
			else
				local randomFood = nil
				
				local original = false
				while original == false do
					randomFood = self.quizzer:GetRandomItem()
					
					original = true
					for key, value in pairs( takenWords ) do
						if value == randomFood.word_english then
							original = false
						end
					end
				end
			
				englishName = randomFood.word_english
				table.insert( takenWords, randomFood.word_english )
				buttonName = randomFood.word_translated
			end
			
			table.insert( self.buttons, Button.new( { name = buttonName, 
				texture = self.textures.button_long, xPos = x, yPos = top + height * (i-1), text = buttonName, font = fontManager.small, color="0xffffff", 
					centered = true, yPosText = top + height * (i-1) + 30, purpose = "answer", english = englishName } ) )
		end
			
		local foodTexture = Texture.new( "content/graphics/game/animals/" .. self.currentQuestion.word_english .. ".png" )
		self.buttons[ "animal1" ] = Button.new( {
			texture = foodTexture, xPos = -150, yPos = 200 
		} )
		self.buttons[ "animal1" ].bitmap:setAnchorPoint( 0.5, 0.5 )
	
	end
	
	self:RedrawUI()
end

function CategoryAnimalState:ReloadLanguage()
end

function CategoryAnimalState:SetupUI()
	-- Build background
	self.images.questionbg = Bitmap.new( Texture.new( "content/graphics/ui/question_box.png" ) )
	self.images.questionbg:setPosition( 0, -50 )
end


-----------------------------
-- 2. DRAWING AND CLEARING --
-----------------------------
function CategoryAnimalState:Draw()
	stage:addChild( self.background )
	
	for key, value in pairs( self.images ) do
		stage:addChild( value ) 
	end
	
	for key, value in pairs( self.buttons ) do
		value:Draw()
	end
	
	for key, value in pairs( self.labels ) do
		value:Draw()
	end
	
	self.scoreText:Draw()
	self.totalQuestions:Draw()
end

function CategoryAnimalState:Clear()
	stage:removeChild( self.background )
	
	for key, value in pairs( self.images ) do
		if stage:contains( value ) then stage:removeChild( value ) end
	end
	
	for key, value in pairs( self.buttons ) do
		value:Clear()
	end
	
	for key, value in pairs( self.labels ) do
		value:Clear()
	end
	
	self.scoreText:Clear()
	self.totalQuestions:Clear()
end

-----------------------
-- 3. EVENT HANDLING --
-----------------------
function CategoryAnimalState:Event_AndroidKey( event )
	if event.keyCode == KeyCode.BACK then
		StateManager:StateSetup( "select" )
		audioManager:PlayEffect( "cancel" )
	end
end

function CategoryAnimalState:Event_MouseClick( event )
	-- TODO: Clean this shit up. So much nesting.
	for key, button in pairs( self.buttons ) do
		if button:IsClicked( event ) and self.cooldown <= 0 then			
			if button.purpose == "answer" then
			
				if button.name == self.currentQuestion.word_translated then
					-- Correct
					self.quizzer:IncrementCorrectAnswers()
					self.cooldown = 10				
				
					self.questions = self.questions + 1
					self.totalQuestions:SetText( languageManager:GetString( "questions" ) .. ": " .. self.questions )
					
					-- Speak answer
					audioManager:PlaySpecial( "animals_" .. self.currentQuestion.word_english )
					
					if self.firstGuess == true then						
						self.score = self.score + 1
						self.scoreText:SetText( languageManager:GetString( "correct" ) .. ": " .. self.score )
					end
					
					self:AnsweredQuestion_Transition_Begin()
				
				else
					-- Incorrect
					audioManager:PlayEffect( "incorrect" )
					
					if self.questionType == "IconToWord" then
						button.bitmap:setTexture( self.textures.disabledButton_long )
					
					elseif self.questionType == "PhraseToIcon" then				
						button.bitmap:setRotation( -180 )
						button.bitmap:setColorTransform( 1, 0.5, 0.5, 0.5 )
						local x, y = button:GetPosition()
						button:SetPosition( x, y + 25 )
						
						self.deadAnimals[ key ] = true
					
					end
					-- Speak answer
					--audioManager:PlaySpecial( button.english )
					
					self.firstGuess = false
	
				end
			end
			
		end	
	end
end

function CategoryAnimalState:BreakDown()
	self:Clear()
	self.background:removeEventListener( Event.MOUSE_DOWN, self.Event_MouseClick, self )
	self.background:removeEventListener( Event.ENTER_FRAME, self.Event_Update, self )
	stage:removeEventListener(Event.KEY_DOWN, self.Event_AndroidKey, self )
end

function CategoryAnimalState:ClearUI()
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

function CategoryAnimalState:RedrawUI()
	-- Draw new assets
	for key, button in pairs( self.buttons ) do
		button:Draw()
	end
	
	for key, label in pairs( self.labels ) do
		label:Draw()
	end
end
