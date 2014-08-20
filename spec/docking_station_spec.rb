require 'docking_station'
require 'boris_bikes'
require 'timecop'

describe DockingStation do

	it_behaves_like 'a bike container'

	let(:station) { DockingStation.new }
	let(:bike) { Bike.new }

	it 'releases bikes with their rental start time' do
		station.accept(bike)
		station.release
		expect(bike.rented_at.round(0)).to eq(Time.now.round(0))
	end

	it 'informs person when bike is rented for longer than 30 minutes' do
		station.accept(bike)
		Timecop.freeze(Time.local(2014))
		station.release
		Timecop.travel(Time.local(2014,1,1,0,31,0))
		expect(station.accept(bike)).to eq("Please pay for bike")
	end

end