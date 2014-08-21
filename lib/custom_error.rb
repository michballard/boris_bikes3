class CustomError < StandardError

	def initialize(message)
		super(message)
	end

end

class NoAvailableBikesError < StandardError
end

class StationFullError < StandardError
end