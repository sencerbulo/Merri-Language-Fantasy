Button = Core.class()

function Button:init( options )
	self:Setup( options )
end

function Button:Setup( options )
	self.name = options.name
	self.gotoState = options.gotoState
	self.counter = 0
	
	self.position = { x = options.xPos, y = options.yPos }

	if options.purpose ~= nil then
		self.purpose = options.purpose
	end

	if options.texture ~= nil then
		self.bitmap = Bitmap.new( options.texture )
		self.bitmap:setPosition( options.xPos, options.yPos )
	end
	
	self.centered = false
	
	if options.effect ~= nil then
		self.effect = options.effect
		self.texture1 = options.texture
		self.texture2 = options.texture2
	end
	
	if options.english ~= nil then
		self.english = options.english
	end
	
	if options.text ~= nil then
		self.label = TextField.new( options.font.font, options.text )
		self.fontWidth = options.font.width
		local xPosition =  options.xPos
		
		if options.color ~= nil then
			self.label:setTextColor( options.color )
		end
		
		if options.centered == true then
			xPosition = 320/2-string.len( options.text )*options.font.width/2
			self.centered = true
		end
		
		local yPosition = options.yPos + 25
		if options.yPosText ~= nil then
			yPosition = options.yPosText
		end
		
		if options.xPosText ~= nil then
			xPosition = options.xPosText
		end
		
		self.label:setPosition( xPosition, yPosition )
	end
	
	if options.size ~= nil then
		if options.size == "half" then
			self.bitmap:setScale( 0.5, 0.5 )
			
		elseif options.size == "quarter" then
			self.bitmap:setScale( 0.25, 0.25 )
			
		elseif options.size == "double" then
			self.bitmap:setScale( 2, 2 )
			
		else
			self.bitmap:setScale( options.size, options.size )
			
		end
	end
	
	self.bitmap:addEventListener( Event.ENTER_FRAME, self.Event_Update, self )
end

function Button:SetText( text ) 
	self.label:setText( text )
	local positionX =  self.position.x + 20
	
	if self.centered == true then
		xPosition = 320/2-string.len( text )*self.fontWidth/2
	end
	
	self.label:setPosition( positionX, self.position.y + 25 )
end

function Button:GetPosition()
	return self.position.x, self.position.y
end

function Button:SetPosition( posX, posY )
	self.position.x = posX
	self.position.y = posY
	self.bitmap:setPosition( posX, posY )
end

function Button:Draw()
	if self.bitmap ~= nil then stage:addChild( self.bitmap ) end
	if self.label ~= nil then stage:addChild( self.label ) end
end

function Button:Clear()
	if self.bitmap ~= nil and stage:contains( self.bitmap ) then stage:removeChild( self.bitmap ) end
	if self.label ~= nil and stage:contains( self.label ) then stage:removeChild( self.label ) end
	self.bitmap:removeEventListener( Event.ENTER_FRAME, self.Event_Update, self )
end

function Button:IsClicked( event )
	if self.bitmap ~= nil then
		return self.bitmap:hitTestPoint( event.x, event.y )
	elseif self.label ~= nil then
		return self.label:hitTestPoint( event.x, event.y )
	
	end
	
	return false
end

function Button:Event_Update()
	self.counter = self.counter + 0.2
	if self.effect == "animated" and self.counter % 10 < 3 then
		self.bitmap:setTexture( self.texture1 )
		
	elseif self.effect == "animated" and self.counter % 10 >= 3 then
		self.bitmap:setTexture( self.texture2 )
	end
end