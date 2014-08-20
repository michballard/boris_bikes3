class DockingStation

	HALF_HOUR = 30 * 60

	include BikeContainer

	def after_release(bike)
		bike.rented_at = Time.now
	end

	def accept(bike)
		super
		if !bike.rented_at.nil?
			return "Please pay for bike" if rental_time(bike) >= HALF_HOUR
		end
	end

	def rental_time(bike)
		(Time.now - bike.rented_at) 
	end
end