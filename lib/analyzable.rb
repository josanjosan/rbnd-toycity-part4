module Analyzable
  def average_price(array_of_products)# Your code goes here!
  	price_sum = 0
  	array_of_products.each { |product| price_sum += product.price}
  	exact_average = price_sum / array_of_products.length
  	return exact_average.round(2)
  end

  def count_by_brand(array_of_products)
  	brands = []
  	array_of_products.each { |product| brands.push(product.brand) }
  	brands.uniq!
  	by_brand_hash = {}
  	brands.each do |brand|
  	  products_in_brand = array_of_products.select { |product| product.brand == brand }
  	  n_in_brand = products_in_brand.length
  	  by_brand_hash.merge!(brand => n_in_brand)
  	end
  	return by_brand_hash
  end

  def count_by_name(array_of_products)
  	names = []
  	array_of_products.each { |product| names.push(product.name) }
  	names.uniq!
  	by_name_hash = {}
  	names.each do |name|
  	  products_in_name = array_of_products.select { |product| product.name == name }
  	  n_in_name = products_in_name.length
  	  by_name_hash.merge!(name => n_in_name)
  	end
  	return by_name_hash
  end
end
