QuizManager = Core.class()

function QuizManager:init( options )
	self.wordList = {}
	
	self.questionsAsked = 0
	self.correctAnswers = 0
	
	self.questionType = options.type
	
    if options.type == "food" then
		-- Words will be translated through the language manager
		table.insert( self.wordList, "apple" )
		table.insert( self.wordList, "orange" )
		table.insert( self.wordList, "pear" )
		table.insert( self.wordList, "strawberry" )
		table.insert( self.wordList, "banana" )
		table.insert( self.wordList, "cherry" )
		table.insert( self.wordList, "watermelon" )
		table.insert( self.wordList, "tomato" )
        table.insert( self.wordList, "broccoli" )
		table.insert( self.wordList, "carrot" )
		table.insert( self.wordList, "onion" )
		table.insert( self.wordList, "pepper" )
		table.insert( self.wordList, "potato" )
		table.insert( self.wordList, "steak" )
		table.insert( self.wordList, "chicken" )
		table.insert( self.wordList, "hotdog" )
		table.insert( self.wordList, "ham" )
		table.insert( self.wordList, "cheese" )
		table.insert( self.wordList, "bread" )
		table.insert( self.wordList, "candy" )
		table.insert( self.wordList, "cake" )
		table.insert( self.wordList, "egg" )
		table.insert( self.wordList, "icecream" )
		table.insert( self.wordList, "pizza" )
		table.insert( self.wordList, "hamburger" )
		table.insert( self.wordList, "salad" )
		table.insert( self.wordList, "sandwich" )
		table.insert( self.wordList, "water" )
		table.insert( self.wordList, "coffee" )
		table.insert( self.wordList, "milk" )
		table.insert( self.wordList, "soda" )
		table.insert( self.wordList, "tea" )

    elseif options.type == "numbers" then

        table.insert( self.wordList, "milk" )
		table.insert( self.wordList, "soda" )
		table.insert( self.wordList, "tea" )

	elseif options.type == "animals" then
		table.insert( self.wordList, "ant" )
		table.insert( self.wordList, "bear" )
		table.insert( self.wordList, "bee" )
		table.insert( self.wordList, "bird" )
		table.insert( self.wordList, "butterfly" )
		table.insert( self.wordList, "cat" )
		table.insert( self.wordList, "chicken" )
		table.insert( self.wordList, "cow" )
		table.insert( self.wordList, "crab" )
		table.insert( self.wordList, "crocodile" )
		table.insert( self.wordList, "dog" )
		table.insert( self.wordList, "dolphin" )
		table.insert( self.wordList, "elephant" )
		table.insert( self.wordList, "fox" )
		table.insert( self.wordList, "frog" )
		table.insert( self.wordList, "kangaroo" )
		table.insert( self.wordList, "llama" )
		table.insert( self.wordList, "lion" )
		table.insert( self.wordList, "monkey" )
		table.insert( self.wordList, "moose" )
		table.insert( self.wordList, "mouse" )
		table.insert( self.wordList, "owl" )
		table.insert( self.wordList, "penguin" )
		table.insert( self.wordList, "pig" )
		table.insert( self.wordList, "rabbit" )
		table.insert( self.wordList, "seal" )
		table.insert( self.wordList, "skunk" )
		table.insert( self.wordList, "sheep" )
		table.insert( self.wordList, "snake" )
		table.insert( self.wordList, "squirrel" )
		table.insert( self.wordList, "turkey" )
		table.insert( self.wordList, "turtle" )
		table.insert( self.wordList, "whale" )
	
	end
end

function QuizManager:GenerateQuestion()
	local phrasePrefix = ""
	
	if ( self.questionType == "food" ) then
		phrasePrefix = "iwant_"
		
	elseif ( self.questionType == "animals" ) then
		phrasePrefix = "attack_"
	
	end
	
	self.questionsAsked = self.questionsAsked + 1
	local randVal = math.random( 1, #self.wordList ) -- which item?
	local question = {
		word_english = self.wordList[ randVal ],
		word_translated = languageManager:GetString( self.wordList[ randVal ] ),
		phrase = languageManager:GetString( phrasePrefix .. self.wordList[ randVal ] )
	}
	return question
end

function QuizManager:GetRandomItem()
	
	local randVal = math.random( 1, #self.wordList ) -- which item?
	local question = {
		word_english = self.wordList[ randVal ],
		word_translated = languageManager:GetString( self.wordList[ randVal ] )
	}
	return question
end

function QuizManager:IncrementCorrectAnswers()
	self.correctAnswers = self.correctAnswers + 1
end

function QuizManager:GetQuestionsAskedCount()
	return self.questionsAsked
end

function QuizManager:GetCorrectAnswerCount()
	return self.correctAnswers
end
