require_relative 'custom_error'

class Van

	attr_reader :bikes

	def initialize(bikes = [])
		@bikes = bikes
	end

	def empty?
		@bikes.empty?
	end

	def accept(bike)
		@bikes << bike
	end

	def bike_count
		@bikes.count
	end	

	def release
		raise CustomError.new("This #{self.class.to_s.downcase} has no bikes") if self.empty?
			@bikes.pop
		rescue CustomError => error
			p error.message
	end

end

