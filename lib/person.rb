class Person

	def initialize(bike=nil)
		@bike = bike
	end

	def has_bike?
		!@bike.nil?
	end

	def gets(bike)
		@bike = bike
	end

	def fall_down
		@bike.break!
	end

	def returns_bike_to(station)
		station.dock(@bike)
		@bike = nil
	end

end


