class FoodsController < ApplicationController
  def search
    @foods = FoodFacade.foods(params[:q])
  end
end
