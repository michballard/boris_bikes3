require './lib/van'
require './lib/bike_container'

describe Van do

	it_behaves_like 'a bike container'

	let(:van) { Van.new(:capacity => 40) }
	let(:docking_station) { DockingStation.new }
	let(:broken_bike1) { Bike.new.break! }
	let(:garage) { Garage.new }
	let(:bike) { Bike.new }
	let(:bike2) { Bike.new }
	let(:bikes_in_garage) { [bike, bike2] }
	let(:garage_with_available_bike) { Garage.new(bikes: bikes_in_garage) }

	it "should allow setting default capacity on intialising" do
		expect(van.capacity).to eq 40
	end

	it "should accept broken bikes from docking station" do
		docking_station.accept(broken_bike1)
		van.collect_broken_bikes_from(docking_station)
		expect(van.bikes).to eq [broken_bike1]
		expect(docking_station.broken_bikes).to eq []
	end

	it "should release broken bikes to garage" do
		docking_station.accept(broken_bike1)
		van.collect_broken_bikes_from(docking_station)
		van.release_broken_bikes_to(garage)
		expect(van.bikes).to eq []		
		expect(garage.broken_bikes).to eq [broken_bike1]
	end

	it "should accept available bikes from garage" do
		van.collect_available_bikes_from(garage_with_available_bike)
		expect(garage.available_bikes).to eq []
		expect(van.available_bikes).to eq [bike2, bike]
	end

	it "should release available bikes to docking station" do
		van.collect_available_bikes_from(garage_with_available_bike)
		van.release_fixed_bikes_to(docking_station)
		expect(van.available_bikes).to eq []
		expect(docking_station.available_bikes).to eq [bike, bike2]	
	end
end