class FoodFacade
  def self.foods(ingredient)
    FoodService.foods_data(ingredient).map do |food_data|
      Food.new(food_data)
    end
  end
end
