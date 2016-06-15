require 'faker'

# This file contains code that populates the database with
# fake data for testing purposes

def db_seed
  100.times do# Your code goes here!
      Product.create(brand: Faker::Commerce.department, name: Faker::Commerce.product_name, price: Faker::Commerce.price)
  end
end
