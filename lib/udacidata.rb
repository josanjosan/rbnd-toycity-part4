require_relative 'find_by'
require_relative 'errors'
require 'csv'

class Udacidata
  @@data_path = "../data/data.csv"
  @@all = []

  def self.create(opts = {})
  	new_item = Product.new(brand: opts[:brand], name: opts[:name], price: opts[:price])
  	@@all.push(new_item)
    CSV.open(@@data_path, "ab") do |csv|
      csv << [new_item.id, new_item.brand, new_item.name, new_item.price]
    end
    return new_item
  end

  def self.all
   	@@all
  end

  def self.first(n = 1)
    first_n = all.first(n)
 	n = 1 ? first_n.first : first_n
  end
end
