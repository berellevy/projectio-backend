class ItemsController < ApplicationController
	def index
		items = Item.all
		render json: items
	end

	def show 
		item = Item.find(params[:id])
		render json: item
	end

end

  # render json: @trainers, include: :pokemons, status: :ok