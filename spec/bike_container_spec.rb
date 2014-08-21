require 'bike_container'

shared_examples_for 'a bike container' do

	let(:container) { described_class.new }
	let(:bike) { double :bike, rented_at: nil, broken?: false }
	let(:bike2) { double :bike, rented_at: nil, broken?: false }
	let(:broken_bike) { double :bike, broken?: true, rented_at: nil }
	let(:broken_bike2) { double :bike, broken?: true, rented_at: nil }
	let(:holder) { DockingStation.new }

	def receive_rented_at
		allow(bike).to receive(:rented_at)
	end

	def fill_holder(holder)
		holder.capacity.times { holder.accept(Bike.new)}
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
		container.release_a_bike
		expect(container.bike_count).to eq(0)
	end

	it "when releasing a bike it returns a bike" do 
		allow(bike).to receive(:rented_at=).with(anything())
		container.accept(bike)
		expect(container.release_a_bike).to eq bike
	end

	it 'generates an error message when trying to release a bike when the container is empty' do
		expect{container.release_a_bike}.to raise_error CustomError
	end

	it 'can provide a list of broken bikes' do
		container.accept(broken_bike)
		container.accept(broken_bike2)
		container.accept(bike)
		container.accept(bike2)
		expect(container.broken_bikes).to eq [broken_bike, broken_bike2]
	end

	it "to know when it is full" do
		expect(holder).not_to be_full
		fill_holder holder
		expect(holder).to be_full
	end

	it "should not accept a bike it is full" do
		fill_holder holder
		expect{holder.accept(bike)}.to raise_error(RuntimeError)
	end

	it "should not accept a bike that is not there" do
		bike = nil
		expect{holder.accept(bike)}.to raise_error "Nothing to dock"
	end

end