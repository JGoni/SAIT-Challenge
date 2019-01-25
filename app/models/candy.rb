class Candy < ApplicationRecord
	belongs_to :shop
	belongs_to :shelf, { :optional => true}
	scope :visible, lambda { where(:visible => true) }
  	scope :invisible, lambda { where(:visible => false) }
	scope :sorted, lambda {order("positin ASC")}
	scope :newest_first, lambda {order("created_at DESC")}
	scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}
	scope :id, lambda {order("id ASC")}
	# validates_presence_of :name
end
