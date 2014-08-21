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
			raise "This #{self.class.to_s.downcase} is full" if full?	
			@bikes << bike
		end

		def bike_count
			bikes.count 
		end	

		def release_a_bike
			raise CustomError.new("This container has no bikes") if empty?
			@bikes.pop
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

