require_relative 'custom_error'
require_relative 'bike_container'

class Van

	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
		@bikes = []
	end

	def collect_broken_bikes_from(station)
		until station.broken_bikes.empty?
			accept(station.release_a_bike)
		end
	end

	def release_broken_bikes_to(garage)
		until self.broken_bikes.empty?
			garage.accept(release_a_bike)
		end
	end

end

