class ShopsController < ApplicationController

def index
	# find all shops: @shop=Shop.all
	#render('index')
	@shops=Shop.newest_first
	
end

 def show
 	@shop=Shop.find(params[:id])

 end

def new 
	@shop = Shop.new
end

def create
	# render plain :params[:shop].inspect
	# @shop= Shop.new(shop_params)
	#Instantiate a new object using form parameters
	@shop = Shop.new(shop_params)
	# to save model/ save object

	if @shop.save
		#If save succeds, redirect to the index action
		flash[:notice] = "Shop Created Successfully!"
		# redirect_to @shop
		redirect_to(shops_path)
	else
		#If save fails, redisplay th eform so user can fix problems
		render('new')
	end
end

def edit
	@shop=Shop.find(params[:id])
end


def update
	#find object using form parameters
	@shop=Shop.find(params[:id])
	# Update the object
	if @shop.update_attributes(shop_params)
		#If save succeds, redirect to the show action
		flash[:notice] = "Shop Updated Successfully!"
		# redirect_to @shop
		redirect_to(shops_path(@shop))
	else
		#If save fails, redisplay th eform so user can fix problems
		render('edit')
	end
end



def delete
	@shop=Shop.find(params[:id])
end

def destroy
	@shop=Shop.find(params[:id])
	@shop.destroy
	flash[:notice] = "Shop '#{@shop.name}' Deleted Successfully!"
	redirect_to(shops_path)
end

private
	def shop_params
		params.require(:shop).permit(:name, :position)
	end

end
