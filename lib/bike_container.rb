require_relative 'custom_error'

module BikeContainer 

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
			raise CustomError.new("This container has no bikes") if empty?
			@bike = @bikes.pop
			after_release(@bike)
			@bike
			rescue CustomError => error
				return error.message
		end

		def after_release(bike)
		end

		def broken_bikes
			@bikes.select { |bike| bike.broken? }
		end

end

