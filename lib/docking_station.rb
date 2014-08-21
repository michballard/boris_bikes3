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
		raise "Station is full" if full?	
		super
		if !bike.rented_at.nil?
			return "Please pay for bike" if rental_time(bike) >= HALF_HOUR
		end
	end

	def rental_time(bike)
		(Time.now - bike.rented_at) 
	end

	def release_to_person(person)
		person.gets release(available_bikes) if available_bikes.any? 
		raise NoAvailableBikesError unless available_bikes.any? 
	end

end