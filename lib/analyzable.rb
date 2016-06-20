module Analyzable
  def average_price(array_of_products)# Your code goes here!
  	price_sum = 0
  	array_of_products.each { |product| price_sum += product.price}
  	exact_average = price_sum / array_of_products.length
  	return exact_average.round(2)
  end
end
