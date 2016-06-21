module Analyzable
  @@attrs = [:brand, :name]

  def average_price(array_of_products)# Your code goes here!
  	price_sum = 0
  	array_of_products.each { |product| price_sum += product.price}
  	exact_average = price_sum / array_of_products.length
  	return exact_average.round(2)
  end

  def self.create_count_by_methods
    @@attrs.each do |attr|
      count_by_method = %Q{
        def count_by_#{attr}(array_of_products)
          attrs_values = []
          array_of_products.each { |product| attrs_values.push(product.#{attr}) }
          attrs_values.uniq!
          by_attr_hash = {}
          attrs_values.each do |value|
            products_with_value = array_of_products.select { |product| product.#{attr} == value }
            n_with_value = products_with_value.length
            by_attr_hash.merge!(value => n_with_value)
          end
          return by_attr_hash
        end
        }
      module_eval(count_by_method)
    end
  end

  create_count_by_methods
  
  def print_report(array_of_products)
  	report = ["Inventory by Brand"]
    brands_hash = count_by_brand(array_of_products)
    brands_hash.each { |k, v| report.push("\t- #{k}: #{v}") }
    report.push("Inventory by Name")
    names_hash = count_by_name(array_of_products)
    names_hash.each { |k, v| report.push("\t- #{k}: #{v}") }
  	puts report
    return "Average price: $#{average_price(array_of_products)}"
  end
end
