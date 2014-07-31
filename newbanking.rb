class Person
	attr_accessor :name, :cash, :accounts							#allows me to access any .name or .cash in class
	def initialize (name, cash)
		self.name = name 												#defining .name to to act on self method and to take name parameter
		self.cash = cash 
		self.accounts = Hash.new(name)												#defining .cash to to act on self method and to take cash parameter
		puts "Hi, #{name}. You have $#{cash}!" 	#interpolating the parameters into the puts
	end
end

# class Bank2 < Bank

# 	def print_initialize
# 		puts "custom string"
# end

# module BankPrinter
# 	def print_intialize(bank_name)
# 	end
# end

class Bank
	# include BankPrinter
	attr_accessor :bank_name, :accounts					#allows read and write access to .bank_name and .accounts throughout class
	def initialize (bank_name)			
		self.bank_name = bank_name 								#self.bank_name defined as a particular instance of parameter bank_name
		self.accounts = {}												#creates empty hash accounts to store future account info in
		self.name_counter = {}
		print_initialize
	end

	def print_initialize
		puts "#{bank_name} bank was just created"
	end

	def open_account(accName, balance = 0)				#open_account takes 2 parameters. balance default value = 0
		# if self.accounts[accName.name].nil?
		# 	self.accounts[accName.name] = balance			#accName.name accesses the .name method of Person class.  This stores the name of user with a value of their account balance. 
		# else
		# 	self.accounts[accName.name + "1"] = balance
		# 	accName.accounts[bank_name] = accName.name + "1"
		# end
		self.accounts[accName] = balance
			"#{accName.name}, thanks for opening an account at #{bank_name}!"  #interpolate for puts
	end

	def deposit (accName, amount_depo)																			#deposit takes 2 parameters: accName and the amount to deposit
		if amount_depo <= accName.cash 																				#validation that the user has enough cash to make a valid deposit in his account
			accounts[accName.name] = accounts[accName.name] + amount_depo				# Person's name = Person's name + amount deposited = new value with amount deposited
			accName.cash = accName.cash - amount_depo														#subtracting the amount deposited from user's cash
			puts "#{accName.name} deposited $#{amount_depo} to #{bank_name}. #{accName.name} has $#{accName.cash}. #{accName.name}'s account has $#{accounts[accName.name]}."
		else
			puts "#{accName.name} does not have enough cash to deposit $#{amount_depo}."
		end
	end

	def withdraw (accName, amount_with)																			#withdraw takes two parameter: accName and withdraw amount
		if accounts[accName.name] > amount_with 															#validation that the user has enough money in his account to withdraw
			accounts[accName.name] = accounts[accName.name] - amount_with 			#actual withdrawal
			accName.cash = accName.cash + amount_with 													#change in cash
			puts "#{accName.name} withdrew $#{amount_with} to #{bank_name}. #{accName.name} has $#{accName.cash}. #{accName.name}'s account has $#{accounts[accName.name]}."
		else
			puts "#{accName.name} does not have enough money in the account to withdraw $#{amount_with}."
		end
	end

	def transfer (trans_from, bank_to, amount_tran) 												#transfer takes three parameters: from who's account within called bank, to what bank account within same Person, how much
		puts accounts																													#puts the hash just because I want to see what's in it currently *delete if using program*
		accounts[trans_from.name] = accounts[trans_from.name] - amount_tran 	#subtracting from user account
		bank_to.accounts[trans_from.name] = bank_to.accounts[trans_from.name] + amount_tran #Adding to bank account... have to add bank_to. to call new bank over the one currently called
		puts "#{trans_from.name} transferred $#{amount_tran} from the #{bank_name} account to the #{bank_to.bank_name} account.  The #{bank_to.bank_name} account has $#{bank_to.accounts[trans_from.name]}."
	end

	def total_cash_in_bank
		"#{bank_name} has $#{accounts.values.inject {|a, b| a + b}} in the bank."  #.values selects the values in accounts.  Inject gives them an action to do together {...} adds the values in the hash together.
	end
end

class CreditCards < Bank
	attr_accessor :accounts, :card_name, :bank_name, :credit_lim, :record_to_statem, :trans_count, :post			#grants access to all necessary variables
	def initialize (card_name, bank_name)
		self.bank_name = bank_name
		self.card_name = card_name
		self.accounts = {}																							#creates accounts hash to store credit card balance in
		self.credit_lim = 1000																					#creates a credit limit of 1000
		self.record_to_statem = {}
		self.trans_count = 0
		self.post = ""
	end


	def open_account(accName, balance = 0)
		super(accName, balance, false)
		puts "#{accName.name}, thanks for opening a credit card account at #{bank_name}! You have a $#{credit_lim} credit limit."   #How do I get rid of puts from super^
	end

	def charge (accName, amount_char)																									#charge to credit account
		if accounts[accName.name] + amount_char > credit_lim														#validation that user isn't going over credit limit.  balance + charge cannot be greater than the available credit != can't do it
			puts "#{accName.name} cannot charge $#{amount_char} because you will go over your limit.  Current balance is $#{accounts[accName.name]}. You have $#{credit_lim - accounts[accName.name]} credit remaining."
		else 
			accounts[accName.name] = accounts[accName.name] + amount_char									#actual charge recorded
			puts "$#{amount_char} was charged to the #{card_name} account.  You have a current balance of $#{accounts[accName.name]} with $#{credit_lim - accounts[accName.name]} credit remaining."
			@post = "#{Time.now} ---- $#{amount_char} charged ---- balance: $#{accounts[accName.name]}" #Saving transaction history to record_to_statement hash
			@trans_count += 1
			record_to_statem[@trans_count] = @post.chomp
		end
	end

	def view_statement
		puts record_to_statem 						#displays transaction history
	end

	def make_payment(trans_from, card_to, amount_tran)	
    #bank_to.accounts[trans_from.name] = bank_to.accounts[trans_from.name] + amount_tran #Adding to bank account... have to add bank_to. to call new bank over the one currently called

		trans_from.accounts[trans_from.name] = trans_from.accounts[trans_from.name] - amount_tran 	#subtracting from user account
		accounts[card_to.name] = accounts[card_to.name] + amount_tran #Adding to credit account... have to add Card_to. to call new card over the one currently called
		puts "#{trans_from.name} transferred $#{amount_tran} from the #{bank_name} account to the #{card_name} account.  The #{card_name} account has $#{accounts[trans_from.name]}."
	end
		#to do:	
		#pay credit card bill
		#make payment from account ie transfer
end

chase = Bank.new("JP Morgan Chase")
wells_fargo = Bank.new("Wells Fargo")
me = Person.new("Shehzan", 500)
friend1 = Person.new("Shehzan", 1000)
chase.open_account(me)
chase.open_account(friend1)
{
	"Shehzan" => 500,
	"Shehzan1" => 1000
}
friend1
me.name
wells_fargo.open_account(me)
wells_fargo.open_account(friend1)
chase.deposit(me, 200)
chase.deposit(friend1, 300)
chase.withdraw(me, 50)
chase.deposit(me, 5000)
chase.withdraw(me, 5000)
chase.transfer(me, wells_fargo, 100)
puts chase.total_cash_in_bank
puts wells_fargo.total_cash_in_bank

visa = CreditCards.new("Visa", "JP Morgan Chase")
visa.open_account(me)
visa.charge(me, 300)
visa.charge(me, 400)
visa.charge(me, 500)
visa.view_statement
visa.make_payment(chase, visa, 300)


Ruby cookbook and classes 2

