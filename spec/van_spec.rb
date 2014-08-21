require 'van'

describe Van do

	it_behaves_like 'a bike container'

	let(:van) { Van.new(:capacity => 40) }

	it "should allow setting default capacity on intialising" do
		expect(van.capacity).to eq 40
	end

end