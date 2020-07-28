class CartsController < ApplicationController


    def show
        cart = Cart.find(params[:id])
        render json: cart.display_cart
    end
    
    def add_item
        cart = Cart.find(params[:id])
        cart.add_item(cart_params[:item_id])
        render json: cart.to_json( include: :items)
    end

    private


    def cart_params
        params.permit(:item_id)
    end
    
    
    

end
