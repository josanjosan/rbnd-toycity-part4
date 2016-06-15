require 'faker'

# This file contains code that populates the database with
# fake data for testing purposes

def db_seed
  data_path = "../data/data.csv"# Your code goes here!
    CSV.open(data_path, "ab") do |csv|
      100.times do |i|
        csv << [i, Faker::Commerce.department, Faker::Commerce.product_name, Faker::Commerce.price]
    end
  end
end
