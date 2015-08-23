MinerEnemy = Core.class()

function MinerEnemy:init( options )
	self.textures = {}
	self.alive = true
	self.frozen = false
	self.movementType = ""
	self.direction = ""
	self.moveAmount = options.moveAmount
end

function MinerEnemy:SetTextures( options )
	self.textures.normal = options.normalTexture
	self.textures.frozen = options.frozenTexture
	self.bitmap = Bitmap.new( self.textures.normal )
end

function MinerEnemy:SetType( options )
	self.type = options.type
	
	if ( self.type == "bat" ) then
		self.movementType = "left-right"
	
	elseif ( self.type == "snake" ) then
		self.movementType = "square"
	
	elseif ( self.type == "rabbit" ) then
		self.movementType = "random"
	
	elseif ( self.type == "skeleton" ) then
		self.movementType = "up-down"
	
	elseif ( self.type == "moose" ) then
		self.movementType = "follow"
	
	end
end

function MinerEnemy:Move( direction )
	local x, y = self:getPosition()
	if ( direction == "north" ) then
		y = y - self.moveAmount
		
	elseif ( direction == "south" ) then
		y = y + self.moveAmount
	
	elseif ( direction == "west" ) then
		x = x - self.moveAmount
	
	elseif ( direction == "east" ) then
		x = x + self.moveAmount
	
	end
	self:setPosition( x, y )
end

function MinerEnemy:DecideDirection( playerX, playerY )
	local x, y = self:getPosition()
	if ( self.movementType == "left-right" ) then
		local dir = math.random( 1, 2 )
		if ( dir == 1 ) then 		self.direction = "west"
		else									self.direction = "east"
		end
		
	elseif ( self.movementType == "up-down" ) then
		local dir = math.random( 1, 2 )
		if ( dir == 1 ) then 		self.direction = "north"
		else									self.direction = "south"
		end
		
	elseif ( self.movementType == "random" ) then
		local dir = math.random( 1, 4 )
		if ( dir == 1 ) then 		self.direction = "north"
		elseif ( dir == 2 ) then	self.direction = "south"
		elseif ( dir == 3 ) then	self.direction = "east"
		elseif ( dir == 4 ) then	self.direction = "west"
		end
	
	elseif ( self.movementType == "square" ) then
		if ( self.direction == "north" ) then
			self.direction = "west"
		elseif ( self.direction == "west" ) then
			self.direction = "south"
		elseif ( self.direction == "south" ) then
			self.direction = "east"
		else
			self.direction = "north"
		end
	
	elseif ( self.movementType == "follow" ) then
		local horizOrVert = math.random( 1, 2 )
		
		if ( horizOrVert == 1 ) then
			if ( playerX < x ) then
				self.direction = "west"
			elseif ( playerX > x ) then
				self.direction = "east"
			end
		else
			if ( playerY < y ) then
				self.direction = "north"
			elseif ( playerY > y ) then
				self.direction = "south"
			end
		
		end
	end
	
	return self.direction
end

function MinerEnemy:SetName( options )
	self.label = TextField.new( MinerGameState.fonts.overhead, GameText:Get( "target", options.type ) )
	self.label:setTextColor( 0xFFFFFF )
end

function MinerEnemy:Die( tileWidth )
	local x, y = self:getPosition()
	self.bitmap:setRotation( 180 )
	self.bitmap:setPosition( x + tileWidth, y + tileWidth )
	self.alive = false
end

function MinerEnemy:IsAlive()
	return self.alive
end

function MinerEnemy:IsFrozen()
	return self.frozen
end

function MinerEnemy:Clear()
	stage:removeChild( self.bitmap )
	stage:removeChild( self.label )
end

function MinerEnemy:Draw()
	stage:addChild( self.bitmap )
	stage:addChild( self.label )
end

function MinerEnemy:AdjustLighting( distance )
	local r = 1 - ( 0.25 * ( distance - 1 ) )
	local g = 1 - ( 0.25 * ( distance - 1 ) )
	local b = 1 - ( 0.25 * ( distance - 1 ) )
	local a = 1
	
	self.bitmap:setColorTransform( r, g, b, a )
	self.label:setColorTransform( r, g, b, a )
end

function MinerEnemy:setPosition( x, y )
	self.bitmap:setPosition( x, y )
	self.label:setPosition( x, y )
end

function MinerEnemy:Shiver( frame )
	if ( self.frozen == true ) then		
		if ( math.floor( frame ) % 2 == 0 ) then
			x = self.originalX + 1
		else
			x = self.originalX - 1
		end
		
		self:setPosition( x, self.originalY )
	end
end

function MinerEnemy:Freeze()
	local x, y = self:getPosition()
	self.originalX = x
	self.originalY = y
	self.frozen = true
	self.bitmap:setTexture( self.textures.frozen )
end

function MinerEnemy:Unfreeze()
	self:setPosition( self.originalX, self.originalY )
	self.frozen = false
	self.bitmap:setTexture( self.textures.normal )
end

function MinerEnemy:getPosition()
	return self.bitmap:getPosition()
end

function MinerEnemy:Update()
end
