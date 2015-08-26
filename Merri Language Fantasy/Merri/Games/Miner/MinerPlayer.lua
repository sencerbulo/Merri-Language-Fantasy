MinerPlayer = Core.class()

function MinerPlayer:init( options )
	self.textures = {}
	self.textures.south1 = Texture.new( "Content/Games/Miner/Characters/miner_down.png" )
	self.textures.south2 = Texture.new( "Content/Games/Miner/Characters/miner_down2.png" )
	self.textures.north1 = Texture.new( "Content/Games/Miner/Characters/miner_up.png" )
	self.textures.north2 = Texture.new( "Content/Games/Miner/Characters/miner_up2.png" )
	self.textures.east1 = Texture.new( "Content/Games/Miner/Characters/miner_right.png" )
	self.textures.east2 = Texture.new( "Content/Games/Miner/Characters/miner_right2.png" )
	self.textures.west1 = Texture.new( "Content/Games/Miner/Characters/miner_left.png" )
	self.textures.west2 = Texture.new( "Content/Games/Miner/Characters/miner_left2.png" )
	self.bitmap = Bitmap.new( self.textures.south1 )
	self.moveAmount = options.moveAmount
	self.frame = 1
	self.direction = "south"
	self.health = 3
	
	self.label = TextField.new( MinerGameState.fonts.overhead, GameText:Get( "target", "Miner" ) )
	self.label:setTextColor( 0xFFFFFF )
	
	MinerPlayer.hp = options.hp
	self.alive = true
	self.maxHp = 4
	self.exp = 0
	self.level = 1
	self.hurtCooldown = 0
end

function MinerPlayer:Face( direction )
	self.direction = direction
end

function MinerPlayer:Die( tileWidth )
	local x, y = self:getPosition()
	self.bitmap:setRotation( 180 )
	self.bitmap:setPosition( x + tileWidth, y + tileWidth )
	self.alive = false
end

function MinerPlayer:AddHealth( amount )
	print( "Heal ", amount )
	MinerPlayer.hp = MinerPlayer.hp + amount
	if ( MinerPlayer.hp > self.maxHp ) then		MinerPlayer.hp = self.maxHp 	end
end

function MinerPlayer:GetHurt()
	if ( self.hurtCooldown == 0 ) then
		self.hurtCooldown = 3
		MinerPlayer.hp = MinerPlayer.hp - 1
		self.bitmap:setColorTransform( 1, 0, 0, 1 )
	end
end

function MinerPlayer:GetHealth()
	return MinerPlayer.hp
end

function MinerPlayer:TurnBasedUpdate()
	if ( self.hurtCooldown > 0 ) then
		self.hurtCooldown = self.hurtCooldown - 1
		local r, g, b, a = self.bitmap:getColorTransform()
		
	
		if ( self.hurtCooldown == 1 ) then
			self.bitmap:setColorTransform( 1, 1, 1, 1 )
		else
			g = g + 0.2
			b = b + 0.2
			self.bitmap:setColorTransform( 1, g, b, 1 )
		end
	end
end

function MinerPlayer:Move( direction, amount )
	local x, y = self:getPosition()
	self:Face( direction )
	
	if ( direction == "south" ) then 		y = y + self.moveAmount		end
	if ( direction == "north" ) then 		y = y - self.moveAmount		end
	if ( direction == "east" ) then 		x = x + self.moveAmount		end
	if ( direction == "west" ) then 		x = x - self.moveAmount		end
	
	self:setPosition( x, y )
end

function MinerPlayer:Draw()
	stage:addChild( self.bitmap )
	stage:addChild( self.label )
end

function MinerPlayer:setPosition( x, y )
	self.bitmap:setPosition( x, y )
	self.label:setPosition( x, y )
end

function MinerPlayer:getPosition()
	return self.bitmap:getPosition()
end

function MinerPlayer:Update()
	if ( self.alive ) then
		self.frame = self.frame + 0.05
		if ( self.frame >= 3 ) then
			self.frame = 1
		end
		local fr = math.floor( self.frame )
		self.bitmap:setTexture( self.textures[ self.direction .. fr ] )
	end
end