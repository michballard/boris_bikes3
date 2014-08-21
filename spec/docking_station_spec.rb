require 'docking_station'
require 'boris_bikes'
require 'timecop'

describe DockingStation do

	it_behaves_like 'a bike container'

	let(:station) { DockingStation.new(:capacity => 20)}
	let(:bike) { Bike.new }
	let(:person) { double :person}
	let(:person2) { double :person, has_bike?: true }

	it "should allow setting default capacity on intialising" do
		expect(station.capacity).to eq 20
	end

	it 'releases bikes with their rental start time' do
		expect(person).to receive(:gets).with(bike)
		station.accept(bike)
		station.release_bike_to(person)
		expect(bike.rented_at.round(0)).to eq(Time.now.round(0))
	end

	it 'informs person when bike is rented for longer than 30 minutes' do
		allow(person).to receive(:gets).with(bike)
		station.accept(bike)
		Timecop.freeze(Time.local(2014))
		station.release_bike_to person
		Timecop.travel(Time.local(2014,1,1,0,31,0))
		expect(station.accept(bike)).to eq("Please pay for bike")
	end

	it 'only releases available bikes' do
		station.accept(bike)
		expect(person).to receive(:gets).with bike
		station.release_bike_to(person)
	end

	it "doesn't release broken bikes" do
		station.accept(bike.break!)
		expect(person).not_to receive(:gets).with bike
		expect{station.release_bike_to(person)}.to raise_error 
	end

	# this tests when broken bikes are docked but shouldn't be released to Persons
	it "raises an error if a person tries to rent a bike but can't" do 
		expect{station.release_bike_to(person)}.to raise_error NoAvailableBikesError
	end

end