class ProfilesController < ApplicationController
  
  def user_profile
    authenticate_user!
    @current_listings = []
    # storing all the current listings of the current user in an array where listing's sold_status isn't true
    current_user.listings.each do |l|
      if l.sold_status == nil
        @current_listings << l
      end
    end


    @purchases = []
    # storing all the purchased listings of curernt user in @purchases array by going through all the transactions of the current user
    current_user.transactions.each do |transaction|
      @purchases << transaction.listing
    end


    @sold_listings = []
    # stroring all the sold listings of current user in @sold_listings array where the sold_status of the listing is true
    current_user.listings.each do |l|
      if l.sold_status == true
        @sold_listings << l
      end
    end

    # storing all the prices of the sold listings in @sales array to calculate the revenue of the seller
    @sales = []
    @sold_listings.each do |listing|
      if listing.price != nil
        @sales << listing.price
      end
    end
  end

  def rate_seller

  end

  def rate_score
    #finds the user and listing through the id sent as hidden feild from the rate user form
    @user = User.find(params[:user_id])
    @listing = Listing.find(params[:listing_id])

    # storing the rating given by buyer in the seller's rating_scores_array field in user's table and then saving it
    @user.rating_scores_array << params[:rating_scores_array]
    @user.save

    # calculating the user rating by dividing the sum of rating_scores_array by the length of rating_scores_array
    @user.rating = @user.rating_scores_array.sum / @user.rating_scores_array.length.to_f
    @user.save

    # turning the rated status of the listing to true so it can't be rated again
    @listing.rated_status = true
    @listing.save
    
    redirect_to profiles_user_profile_path
  end

end

