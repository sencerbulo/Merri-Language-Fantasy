Label = Core.class()

function Label:init( options )
	self:Setup( options )
end

function Label:Setup( options )
	self.label = TextField.new( options.font.font, options.text )
	self.label:setTextColor( 0x000000 )
	self.fontWidth = options.font.width
	self.centered = options.centered
	self.counter = 0
		
	if options.xPos ~= nil then
		self.position = { x = options.xPos, y = options.yPos }
	end
	
	if options.color ~= nil then
		self.label:setTextColor( options.color )
	end
	
	local xPosition = options.xPos
	self.centered = options.centered
	if options.centered == true then
		xPosition =  320/2-string.len( options.text )*options.font.width/2
		
		if self.position ~= nil then
			self.position.x = xPosition
		end
	end
	
	if options.effect ~= nil then
		self.effect = options.effect
		self.originalPositionY = self.position.y
	end
	
	self.label:setPosition( xPosition, options.yPos )
	self.label:addEventListener( Event.ENTER_FRAME, self.Event_Update, self )
end

function Label:SetText( text ) 
	self.label:setText( text )
	
	if self.centered == true then
		self.position.x = 320/2 - string.len( text ) * self.fontWidth/2
	end
	
	self.label:setPosition( self.position.x, self.position.y )
end

function Label:Draw()
	stage:addChild( self.label )
end

function Label:Clear()
	if ( stage:contains( self.label ) ) then		stage:removeChild( self.label )		end
	self.label:removeEventListener( Event.ENTER_FRAME, self.Event_Update, self )
end

function Label:Event_Update()
	self.counter = self.counter + 0.2
	if self.effect == "flash" and self.counter % 10 < 3 then
		self.position.y = -200
		
	elseif self.effect == "flash" and self.counter % 10 >= 3 then
		self.position.y = self.originalPositionY
	end
	
	self.label:setPosition( self.position.x, self.position.y )
end