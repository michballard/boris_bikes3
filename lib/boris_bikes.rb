class Bike

	attr_accessor :rented_at # records time person receives the bike from docking station
	attr_reader :serial_number

	def initialize
		@broken
		@rented_at = nil
		@serial_number = generate_serial_number
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

	def generate_serial_number
		"#{[*"A".."Z"].sample(3).join}-#{rand(99999)}"
	end
end