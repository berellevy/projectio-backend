class User < ApplicationRecord
    after_create :create_cart
    has_one :cart
    has_many :purchases

    def add_cart
        self.create_cart
    end
    


end
