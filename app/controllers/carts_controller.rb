class CartsController < ApplicationController


    def show
        cart = Cart.find(params[:id])
        render json: cart.display_cart
    end
    
    def add_item
        cart = Cart.find(params[:id])
        cart.add_item(cart_params[:item_id])
        render json: cart.total_items
    end

    def cart_item_qty
        cart = Cart.find(params[:id])
        render json: cart.total_items
    end
    

    def delete_item
        cart = Cart.find(params[:id])
        deleted_item = cart.delete_item(cart_params[:item_id])

        render json: {deleted_item: deleted_item.item.id, cart_totals: cart.cart_totals}
    end

    def make_purchase
        cart = Cart.find(params[:id])
        purchase = cart.make_purchase
        render json: purchase
    end
    




    private


    def cart_params
        params.permit(:item_id)
    end
    
    
    

end
