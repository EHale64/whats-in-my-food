class FoodFacade
  def self.foods(ingredient)
    conn = Faraday.new(url: 'https://api.nal.usda.gov') do |f|
      f.params['api_key'] = ENV['FOODS_API']
    end

    response = conn.get('/fdc/v1/foods/search') do |f|
      f.params['query'] = ingredient
    end

    json = JSON.parse(response.body, symbolize_names: true)

    json[:foods].first(10).map do |food_data|
      Food.new(food_data)
    end
  end
end
