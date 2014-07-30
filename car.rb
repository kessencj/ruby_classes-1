class Car

	def initialize (gas, position)
		@gas = gas
		@position = position
		@tank_capacity = 15
	end

	def setup
		@position = 0
		@gas = 10
		puts "Car is ready to go!"
	end

	def drive (miles_num, mileage)
		puts "Car drove #{miles_num} miles."
		position = @position + miles_num.to_i
		@@gas = @gas - (miles_num.to_i/mileage)

		puts "Car is now in #{position} position with #{@@gas} gallons of gas in the tank."
	end

	def fill_up(price)
	fill_capacity = (@tank_capacity - @@gas)
	cost_to_fill = (fill_capacity * price)
	puts "We filled up the remaining #{fill_capacity} gallons at $#{price} per gallon for a total cost of $#{cost_to_fill}."
	end
end
stallion = Car.new(7, 22)
stallion.setup
stallion.drive(33, 4)
stallion.fill_up(3.53)

car_b = Car.new(2, 14)
car_b.drive(22,3)
car_b.fill_up(6.00)
