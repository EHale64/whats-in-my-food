class FoodsController < ApplicationController
  def search
    food = params[:q]
    conn = Faraday.new(url: 'https://api.nal.usda.gov') do |f|
      f.params['api_key'] = ENV['FOODS_API']
    end

    response = conn.get('/fdc/v1/foods/search') do |f|
      f.params['query'] = food
    end

    json = JSON.parse(response.body, symbolize_names: true)
    @results = json[:totalHits]
    @foods = json[:foods].first(10).map do |food_data|
      Food.new(food_data)
    end
  end
end
