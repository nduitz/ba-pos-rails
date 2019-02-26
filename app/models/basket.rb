class Basket < ApplicationRecord
  has_many :product_positions
  has_many :products, through: :product_positions

  enum state: [:open, :closed]

  scope :open, -> () {where(state: :open).includes(:products)}
  scope :closed, -> () {where(state: :closed)}

  def sum=(sum)
    write_attribute(:sum, sum * 100)
  end
  
  def sum
    read_attribute(:sum) / 100.0
  end
end