require_relative 'find_by'
require_relative 'errors'
require 'csv'

class Udacidata
  @@data_path = "../data/data.csv"

  def self.create(opts = {})
  	new_item = Product.new(opts = {})
    CSV.open(@@data_path, "ab") do |csv|
      csv << [new_item.id, new_item.brand, new_item.name, new_item.price]
    end
    return new_item
  end

  def self.all
  	all_products = []
  	CSV.foreach(@@data_path, headers: true) do |row|
  		item = Product.new(brand: row["brand"], name: row["product"], price: row["price"])
  		all_products.push(item)
  	end
  	return all_products
  end
end
