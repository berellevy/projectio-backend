class ItemsController < ApplicationController
	def index
		items = Item.all
		render json: {items: items}
	end

	def show 
		item = Item.find(params[:id])
		render json: item
	end

	def search
		items = Item.search(params[:query])
		render json: {triggered: "items#search", query: params[:query], results: items}
	end
	


	

end

  # render json: @trainers, include: :pokemons, status: :ok