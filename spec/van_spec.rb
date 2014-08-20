require 'van'

describe Van do

	let(:van) { Van.new }
	let(:bike) { double :bike }
	let(:bike2) { double :bike }

	it 'should be empty when it is created' do
		expect(van.bike_count).to eq(0)
	end

	it 'should be able to contain a bike' do
		van.accept(bike)
		expect(van.empty?).to be false
	end

	it 'can accept a bike' do 
		van.accept(bike)
		expect(van.bike_count).to eq(1)
	end

	it 'can accept another bike' do
		van.accept(bike)
		van.accept(bike2)
		expect(van.bike_count).to eq(2)
	end

	it 'can release a bike' do
		van.accept(bike)
		van.release
		expect(van.bike_count).to eq(0)
	end

	it 'generates an error message when trying to release a bike when the van is empty' do
		expect(van.release).to eq("This van has no bikes")
	end

	xit 'generates an error message when trying to release a bike when the van is empty' do
		expect{van.release}.to raise_error(CustomError)
	end

end