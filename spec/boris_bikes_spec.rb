require 'boris_bikes'



describe 'bike' do

	let (:bike) { Bike.new }

	it 'is a bike' do
		expect(bike).to be_a Bike
	end

	it 'should not be broken when it is created' do
		expect(bike).not_to be_broken
	end

	it 'should be able to be broken' do
		bike.break!
		expect(bike).to be_broken
	end

	it 'should be able to be fixed' do
		bike.break!
		bike.fix!
		expect(bike).not_to be_broken
	end

	it 'should know when it was hired' do
		bike.rented_at= Time.now
		expect(bike.rented_at.round(0)).to eq(Time.now.round(0))
	end

end