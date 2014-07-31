class Person
	attr_reader :name, :cash  # don't quite understand what the attr_'s do.  Probably where I'm going wrong????
	$personinfo = {}
	def initialize (name, cash)
		@name = name
		@cash = cash
		$personinfo[@name] = @cash
		puts "Hi, #{@name}. You have $#{@cash}!"
	end
end

class Bank 
	@@accounts = {}
	def initialize (bName)
		@bName = bName
		@accName = ""
		@balance = 0
		@amount = 0
		@@accounts[@accName] = @balance
		puts "#{@bName} bank was just created."
	end
	
	def personinfo
		puts $personinfo
	end

	def open_account (accName, balance = 0)
		
		@@accounts[accName] = balance
		##@holder == $accounts trying to solve inheriting name from Person class.
		puts "#{$personinfo[@accName]}, thanks for opening an account at #{@bName}!"
	end

	def balance_check?
		puts "#{@@accounts[accName]}"
	end

	def bank_total?
		puts "There is currently $" + @@accounts.values.inject {|a, b| a + b } + " in the bank."
	end

	def deposit (accName, amount)
		@accName = accName
		@amount = amount
		#if @amount > $personinfo
			#@@accounts[accName] + amount
			#puts "$#{amount} was deposited into #{accName}. There is a $#{@@accounts[accName]} balance remaining."
		#else
		#end
	end

	def withdraw (accName, amount)
		@accName = accName
		@amount = amount
		if 
			(@@accounts[accName] - amount) < 0
			puts "Cannot withdraw #{amount} from #{accName} because of insufficient funds.  Current balance is: #{balance_check?}"
		else
			@@accounts[accName] - amount
		puts "$#{amount} was withrawn from #{accName}.  There is $#{@@accounts[accName]} remaining."
		end
	end

	def transfer(from, to, amount)
		@amount = amount
		@from = from
		(@@accounts[from] - amount)

		@to = to
		(@@accounts[to] + amount)# won't work becaue the wells_fargo (to) parameter is not defined.  I think that I need to store
		puts "$#{@amount} was transferred from #{@from} to #{@to}.  #{@from} has a remaining balance of $#{@@accounts[@from]}. #{@to} has a remaining balance of $#{accounts[@to]}."
		
	end	
end

chase = Bank.new("JP Morgan Chase")
wells_fargo = Bank.new("Wells Fargo")
me = Person.new("Shehzan", 500)
friend1 = Person.new("John", 1000)
chase.open_account(me)
chase.open_account(friend1)
wells_fargo.open_account(me)
wells_fargo.open_account(friend1)
chase.deposit(me, 200)
chase.deposit(friend1, 300)
chase.withdraw(me, 50)
chase.transfer(me, wells_fargo, 100)