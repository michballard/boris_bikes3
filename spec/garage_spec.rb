require './lib/garage'
require './lib/boris_bikes'

describe Garage do 

	it_behaves_like 'a bike container'

	let(:garage)                   { Garage.new(:capacity => 500)         }
	let(:a_broken_bike)            { Bike.new.break!                      }
	let(:another_broken_bike)      { Bike.new.break!                      }
	let(:broken_bikes)             { [a_broken_bike, another_broken_bike] }
	let(:garage_with_broken_bikes) { Garage.new(bikes: broken_bikes)       }

	it "should allow setting default capacity on intialising" do
		expect(garage.capacity).to eq 500
	end

	it "should fix all broken bikes" do 
		garage_with_broken_bikes.fix_all_broken_bikes
		expect(garage_with_broken_bikes.available_bikes).to eq [a_broken_bike, another_broken_bike]
	end

	it "can be initialised with bikes" do 
		expect(garage_with_broken_bikes.bikes).to eq [a_broken_bike, another_broken_bike]
	end

end