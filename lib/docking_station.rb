require_relative 'bike_container'

class DockingStation

	HALF_HOUR = 30 * 60

	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
		@bikes = []
	end

	def after_release(bike)
		bike.rented_at = Time.now
		super
	end

	def accept(bike)
		raise "Nothing to dock" if bike == nil
		if bike.rented_at.nil?
			super
		elsif rental_time(bike) >= HALF_HOUR
			super
			return "Please pay for bike"
		else
			super
			return "Thank you"	
		end
	end

	def rental_time(bike)
		(Time.now - bike.rented_at)
	end

	def release_bike_to(person)
		raise NoAvailableBikesError unless available_bikes.any? 
		bike_to_be_rented = release_a_bike
		bike_to_be_rented.rented_at = Time.now
		person.gets bike_to_be_rented
	end

end