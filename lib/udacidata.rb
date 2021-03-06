require_relative 'find_by'
require_relative 'errors'
require 'csv'

class Udacidata
  @@data_path = File.dirname(__FILE__) + "/../data/data.csv"
  @@attrs = [:brand, :name]
  
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
    found = all.select { |product| product.id == id }
    if found.first != nil
      return found.first
    else
      raise ProductNotFoundError, "No created product matches id '#{id}'"
    end
  end

  def self.destroy(id)
    destroyed_product = self.find(id)
    data = CSV.table(@@data_path, headers: false)
    data.delete_if { |row| row[0] == destroyed_product.id }
    CSV.open(@@data_path, "wb") do |csv|
      data.each { |row| csv << row }
    end
    return destroyed_product
  end

  def self.where(opts = {})
    array_of_products = all.select { |product| product.brand == opts[:brand]} if opts[:brand]
    array_of_products = all.select { |product| product.name == opts[:name]} if opts[:name]
    return array_of_products
  end

  def update(opts = {})
    @brand = opts[:brand] if opts[:brand]
    @price = opts[:price] if opts[:price]
    Product.destroy(self.id)
    Product.create(id: self.id, brand: self.brand, name: self.name, price: self.price)
    return self
  end

  create_finder_methods(:brand, :name)
end
