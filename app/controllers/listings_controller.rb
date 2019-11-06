class ListingsController < ApplicationController
  # before_action :listing_params
  before_action :authenticate_user!,except: :index
  def index
    @listings = Listing.all
    @is_sold = params[:sold_status]
  end

  def new
    @listing = Listing.new
    @bundle = params[:bundle]
    if @bundle == "true"
      @bundle = true
    else
      @bundle = false
    end
  end

  def create
    @listing = current_user.listings.create(listing_params)
    redirect_to listings_path
  end

  
  def show
    @listing = Listing.find(params[:id])
  end
  
  def edit
    # only allows user to access the edit page of his own listings
    if current_user.id == Listing.find(params[:id]).user.id
      @listing = Listing.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def update
    # execute "if" if coming from buy page and execute "else" if coming from edit page
    @listing = Listing.find(params[:id])
    if params["sold_status"]
      @listing.sold_status = true
      @listing.save
      Transaction.create(user_id: current_user.id, listing_id: @listing.id)
      if @listing.save
        redirect_to listings_path
      else
        redirect_to edit_listing_path
      end
    else
      @listing.update(listing_params)
      redirect_to listings_path 
    end
  end

  def delete
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    redirect_to listings_path
  end

  def type_selection
    
  end
  
  

  private
  def listing_params
    params.require(:listing).permit(:title, :description, :price, :category_id, :brand_id, :size_id, pictures: [])
  end
end
