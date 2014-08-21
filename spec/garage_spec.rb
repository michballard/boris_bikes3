require 'garage'

describe Garage do 

	it_behaves_like 'a bike container'

	let(:garage) { Garage.new(:capacity => 500) }

	it "should allow setting default capacity on intialising" do
		expect(garage.capacity).to eq 500
	end

end