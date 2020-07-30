class Item < ApplicationRecord
    def self.search(query)
		where(
            "lower(items.description) LIKE :query OR lower(items.name) LIKE :query",
            query: "%#{query}%".downcase
        )
	end
end
