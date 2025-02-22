require 'date'

def random_date_within_last_year
  start_date = Date.today - 1.year
  end_date = Date.today
  rand(start_date..end_date)
end


puts "Cleaning database..."

Transaction.destroy_all
Account.destroy_all
Category.destroy_all
Budget.destroy_all
User.destroy_all

puts "Cleaned the DB!"

puts "Creating 1 admin user..."

admin_user = User.create!(first_name: "test", last_name: "Blogs", email: "admin@finacet.com", password: "123456")

puts "Finished creating 1 admin user"

puts "---------------------------------"
puts "Creating accounts..."

account = Account.new(name: "Savings", balance: 1000, user: User.first)
account.save

account = Account.new(name: "Checking", balance: 500, user: User.first)
account.save
puts "Finished creating accounts"

puts "---------------------------------"



puts "Creating categories..."

category_names = ["Salary", "Groceries", "Rent", "Utilities", "Transportation", "Entertainment", "Health", "Insurance", "Clothing", "Education", "Gifts", "Investments", "Savings", "Taxes", "Travel", "Other"]
categories = category_names.map do |name|
  Category.create(name: name, user: User.first)
end

puts "Finished creating categories"

puts "---------------------------------"

puts "Creating transactions..."

accounts = Account.all
transaction_types = ["income", "expense"]

20.times do
  accounts.each do |account|
    transaction_types.each do |transaction_type|

      Transaction.create(
        amount: rand(100..500),
        description: transaction_type,
        account: account,
        transaction_date: random_date_within_last_year,
        category: categories.sample
      )
    end
  end
end

puts "Finished creating transactions"

puts "---------------------------------"


puts "Finished seeding the database!"
