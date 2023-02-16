class MerchantsController < ApplicationController
  def index
    response = Faraday.get('http://localhost:3000/api/v1/merchants')
    @merchants = JSON.parse(response.body, symbolize_names: true)
  end

  def show
    mer_response = Faraday.get("http://localhost:3000/api/v1/merchants/#{params[:id]}")
    @merchant = JSON.parse(mer_response.body, symbolize_names: true)
    item_response = Faraday.get("http://localhost:3000/api/v1/merchants/#{params[:id]}/items")
    @items = JSON.parse(item_response.body, symbolize_names: true)
  end

end