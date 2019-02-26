class ProductPosition < ApplicationRecord
  belongs_to :product
  belongs_to :basket

  before_create do
    basket.sum += product.price * amount
    Basket.update(basket.id, sum: basket.sum)
  end
end