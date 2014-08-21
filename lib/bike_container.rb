require_relative 'custom_error'

module BikeContainer 

	DEFAULT_CAPACITY = 10

		attr_reader :bikes

		def initialize(bikes = [])
			@bikes = bikes
		end

		def capacity
			@capacity ||= DEFAULT_CAPACITY
		end

		def capacity=(value)
			@capacity = value
		end

		def empty?
			bikes.empty?
		end

		def accept(bike)
			bikes << bike
		end

		def bike_count
			bikes.count 
		end	

		def release(bikes_for_release = bikes)
			raise CustomError.new("This container has no bikes") if empty?
			after_release(bikes_for_release.pop)
		end

		def after_release(bike)
			bike
		end

		def broken_bikes
			bikes.select(&:broken?)
		end

		def available_bikes
			bikes.reject(&:broken?)
		end

		def full?
			bike_count == @capacity
		end

end

