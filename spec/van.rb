class Van

	attr_reader :bikes

	def initialize(bikes = nil)
		@bikes = []
	end

	def empty?
		@bikes.nil?
	end

	def accept(bike)
		@bikes << bike
	end

	def bike_count
		@bikes.count
	end	

	def release
		@bikes.pop
	end

end