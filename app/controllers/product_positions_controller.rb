class ProductPositionsController < ApplicationController

  def create
    @product_position = ProductPosition.create(product_position_params)

    redirect_to(basket_url(@product_position.basket))
  end

  private
    def product_position_params
      params.permit(:basket_id, :product_id, :amount)
    end
end