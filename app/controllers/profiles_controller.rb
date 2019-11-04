class ProfilesController < ApplicationController
  
  def user_profile
  
    # finding all the current listings of the current user
    @current_listings = current_user.listings.map do |l|
      if l.sold_status == nil
        l
      end
    end

    # finding all the purchased listings of the current user
    @purchases = current_user.transactions.map do |transaction|
      transaction.listing
      byebug
    end

    # finding all the sold listings of the current user
    @sold_listings = current_user.listings.map do |l|
      if l.sold_status == true
        l
      end
    end

    # calculating total earnings by summing the prices of all the sold listigns of current user
    @sales = @sold_listings.map do |listing|
      if listing.price != nil
        return listing.price
      end
    end
  end

  def rate_seller

  end

  def rate_score
    @user = User.find(params[:user_id])
    @listing = Listing.find(params[:listing_id])

    # using an array (rating_scores_array) to store all individual rating scores and then calculating the rating and storing it in the user rating column 

    @user.rating_scores_array << params[:rating_scores_array]
    @user.save
    @user.rating = @user.rating_scores_array.sum / @user.rating_scores_array.length.to_f
    @user.save

    # changing the rated_status in given listing so it can only be rated once
    @listing.rated_status = true
    @listing.save

  end

end

# <ActionController::Parameters {"utf8"=>"✓", "authenticity_token"=>"5eL1LZ5D/04teku+afi2DND/UsT3qdbbze6xIDNCW0DLv29aUPtUU5FBAHFGr1o9/ekdaDd9SrRR1gkizk9ffA==", "rating_score_total"=>"1", "user_id"=>"2", "commit"=>"rate", "controller"=>"profiles", "action"=>"rate_score"} permitted: false>

