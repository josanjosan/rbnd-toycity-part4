require_relative 'find_by'
require_relative 'errors'
require 'csv'

class Udacidata
  @@data_path = "../data/data.csv"
  
  def self.create(opts = {})
  	new_item = Product.new(brand: opts[:brand], name: opts[:name], price: opts[:price])
  	CSV.open(@@data_path, "ab") do |csv|
      csv << [new_item.id, new_item.brand, new_item.name, new_item.price]
    end
    return new_item
  end

  def self.all
    all_products = []
   	all_data = CSV.read(@@data_path).drop(1)
    all_data.each do |row|
      item = Product.new(id: row[0].to_i, brand: row[1].to_s, name: row[2].to_s, price: row[3].to_f)
      all_products.push(item)
    end
    return all_products
  end

  def self.first(n = 1)
    n == 1 ? all.first : all.first(n)
  end

  def self.last(n = 1)
    n == 1 ? all.last : all.last(n)
  end

  def self.find(id)
    found = all.select { |product| product.id == id}
    return found.first
  end
end
