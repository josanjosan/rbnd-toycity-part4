class Module
  def create_finder_methods(*attributes)
    attributes.each do |attr|
      find_by_method = %Q{
        def find_by_#{attr}(attr_value)
          found = all.select { |product| product.#{attr} ==  attr_value}
          return found.first
        end
        }
      instance_eval(find_by_method)
    end# Your code goes here!
  end# Hint: Remember attr_reader and class_eval
end
