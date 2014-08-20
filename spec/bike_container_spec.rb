require 'bike_container'

shared_examples_for 'a bike container' do

	let(:container) { described_class.new }
	let(:bike) { double :bike }
	let(:bike2) { double :bike }
	let(:broken_bike) { double(:bike, :broken => true) }
	let(:broken_bike2) { double(:bike, :broken => true) }

	def receive_rented_at
		allow(bike).to receive(:rented_at)
	end

	it 'should be empty when it is created' do
		expect(container.bike_count).to eq(0)
	end

	it 'should be able to contain a bike' do
		receive_rented_at
		container.accept(bike)
		expect(container.empty?).to be false
	end

	it 'can accept a bike' do 
		receive_rented_at
		container.accept(bike)
		expect(container.bike_count).to eq(1)
	end

	it 'can accept another bike' do
		receive_rented_at
		allow(bike2).to receive(:rented_at)
		container.accept(bike)
		container.accept(bike2)
		expect(container.bike_count).to eq(2)
	end

	it 'can release a bike' do
		receive_rented_at
		allow(bike).to receive(:rented_at=)
		container.accept(bike)
		container.release
		expect(container.bike_count).to eq(0)
	end

	it 'generates an error message when trying to release a bike when the container is empty' do
		expect(container.release).to eq("This container has no bikes")
	end

	it 'can provide a list of broken bikes' do
		expect(bike).to receive(:broken?).and_return(false)
		expect(bike2).to receive(:broken?).and_return(false)
		expect(broken_bike).to receive(:broken?).and_return(true)
		expect(broken_bike2).to receive(:broken?).and_return(true)
		container.accept(broken_bike)
		container.accept(broken_bike2)
		container.accept(bike)
		container.accept(bike2)
		expect(container.broken_bikes.count).to eq(2)
	end
end