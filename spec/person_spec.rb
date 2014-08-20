require 'person'

describe 'Person' do

	let (:person) {Person.new}
	let (:bike) { double :bike }
	let (:person_with_bike) {Person.new(bike)}
	let (:station) {double :station}

	it 'initially does not have a bike' do
		expect(person).not_to have_bike
	end

	it 'can have a bike' do
		expect(person_with_bike.has_bike?).to be true
	end

	it 'can break the bike' do
		expect(bike).to receive(:break!)
		person_with_bike.fall_down
	end

	it 'can return the bike to the station' do
		expect(station).to receive(:dock).with(bike)
		person_with_bike.returns_bike_to station
	end

	it 'once returning a bike should not have a bike' do
		expect(station).to receive(:dock).with(bike)
		person_with_bike.returns_bike_to station
		expect(person_with_bike).not_to have_bike
	end

	# it 'receives an error message when there is no bike' do
	# 	expect{person.has_bike?}.to raise_error(RuntimeError)
	# end 

end