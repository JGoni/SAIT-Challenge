class CandiesController < ApplicationController

  before_action :find_shop
  def index
    # @candies=Candy.id
    @candies=@shop.candies.newest_first
    
  end

  def show
    @candy=Candy.find(params[:id])
  end

  def new
   @candy = Candy.new(:shop_id => @shop.id)
  end

  def create

  @candy = Candy.new(candy_params)
  # to save model/ save object

  if @candy.save
    #If save succeds, redirect to the index action
    flash[:notice] = "Candy Created Successfully!"
    # redirect_to @shop
    redirect_to(candies_path(:shop_id => @shop.id))
  else
    #If save fails, redisplay th eform so user can fix problems
    render('new')
  end
end
  def edit
     @candy = Candy.find(params[:id])
  end

  def update
    @candy= Candy.find(params[:id])
    if @candy.update_attributes(candy_params)
      flash[:notice] = "Candy updated successfully."
      redirect_to(candies_path(@candy, :shop_id => @shop.id))
    else
      render('edit')
    end
  end

  def delete
    @candy = Candy.find(params[:id])
  end

  def destroy
    @candy = Candy.find(params[:id])
    @candy.destroy
    flash[:notice] = "Candy has been deleted successfully!"
    redirect_to(candies_path(:shop_id => @shop.id))
  end

  private
  def candy_params
    params.require(:candy).permit(:name, :shop_id, :position, :visible)
  end

  def find_shop
    @shop = Shop.find(params[:shop_id])
  end
  def find_shelf
    @shelf = Shelf.find(params[:shelf_id])
  end
end

