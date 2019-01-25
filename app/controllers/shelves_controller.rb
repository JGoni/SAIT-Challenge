class ShelvesController < ApplicationController
  before_action :find_shop
  def index
    # @shelves=Shelf.id
    @shelves=@shop.shelves.id
  end

  def show
    @shelf=Shelf.find(params[:id])
  end

  def new
   @shelf = Shelf.new(:shop_id => @shop.id)
  end

  def create
  # render plain :params[:shop].inspect
  # @shop= Shop.new(shop_params)
  #Instantiate a new object using form parameters
  @shelf = Shelf.new(shelf_params)
  # to save model/ save object

  if @shelf.save
    #If save succeds, redirect to the index action
    flash[:notice] = "Shelf Created Successfully!"
    # redirect_to @shop
    redirect_to(shelves_path(:shop_id => @shop.id) )
  else
    #If save fails, redisplay th eform so user can fix problems
    render('new')
  end
end
  def edit
     @shelf = Shelf.find(params[:id])
  end

  def update
    @shelf = Shelf.find(params[:id])
    if @shelf.update_attributes(shelf_params)
      flash[:notice] = "Shelf updated successfully."
      redirect_to(shelf_path(@shelf, :shop_id => @shop.id))
    else
      render('edit')
    end
  end

  def delete
    @shelf = Shelf.find(params[:id])
  end

  def destroy
    @shelf = Shelf.find(params[:id])
    @shelf.destroy
    flash[:notice] = "Shelf destroyed successfully."
    redirect_to(shelves_path(:shop_id => @shop.id) )
  end
  private
  def shelf_params
    params.require(:shelf).permit(:name, :position, :shop_id, :permalink)
  end
  def find_shop
    @shop = Shop.find(params[:shop_id])
  end

end

