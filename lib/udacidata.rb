require_relative 'find_by'
require_relative 'errors'
require 'csv'

class Udacidata
  def self.create(opts = {})
  	data_path = "../data/data.csv"
    new_item = Product.new(opts = {})
    CSV.open(data_path, "ab") do |csv|
      csv << [new_item.id, new_item.brand, new_item.name, new_item.price]
    end
    return new_item
  end

  def self.all
  	data_path = "../data/data.csv"
  	CSV.read(data_path)
  end
end
