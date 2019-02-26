class Product < ApplicationRecord

  def price=(price)
    write_attribute(:price, price * 100)
  end
  
  def price
    read_attribute(:price) / 100.0
  end
end