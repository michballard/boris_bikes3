class Bike

	attr_accessor :rented_at # records time person receives the bike from docking station

	def initialize
		@broken
		@rented_at = nil
	end

	def broken?
		@broken
	end

	def break!
		@broken = true
		self
	end

	def fix!
		@broken = false
		self
	end

end