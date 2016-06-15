require 'faker'

# This file contains code that populates the database with
# fake data for testing purposes

def db_seed
  data_path = "../data/data.csv"# Your code goes here!
  100.times do
      Product.create(brand: Faker::Commerce.department, name: Faker::Commerce.product_name, price: Faker::Commerce.price)
  end
end
