class Shop < ApplicationRecord
	
	has_many :shelves
	has_many :candies
	scope :sorted, lambda {order("positin ASC")}
	scope :newest_first, lambda {order("created_at DESC")}
	scope :id, lambda {order("id ASC")}
	scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}

	end
