class ReviewsController < ApplicationController

  def review_params
    params.require(:review).permit(:comment, :all_rating, :rating1, :rating2, :rating3, :rating4).merge(
      user_id: current_user.id, item_id: params[:item_id]
    )
  end
end
