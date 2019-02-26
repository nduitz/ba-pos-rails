class BasketsController < ApplicationController

  def index
    if params[:state].to_i == Basket.states["closed"]
      @baskets = Basket.closed
    else
      @baskets = Basket.open
    end

    render json: @baskets
  end

  def show
    @basket = Basket.find(params[:id])

    render json: @basket, include: {:product_positions => {include: :product, only: [:product, :amount]}}
  end

  def create
    @basket = Basket.create(basket_params)

    render json: @basket
  end

  def update
    @basket = Basket.find(params[:id])
    @basket.update(basket_params)

    render json: @basket
  end

  private
    def basket_params
      params.permit(:name, :product_position, :state)
    end
end