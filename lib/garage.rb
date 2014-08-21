require_relative 'boris_bikes'
require_relative 'bike_container'

class Garage

	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
		@bikes        = options.fetch(:bikes, [])
	end

	def fix_all_broken_bikes
		broken_bikes.each(&:fix!)
	end

end