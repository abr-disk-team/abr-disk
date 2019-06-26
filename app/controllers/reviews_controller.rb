class ReviewsController < ApplicationController
	before_action :authenticate_user!
	def new
		@item = Item.find(params[:item_id])
		@review = Review.new
	end

	def create
		review = Review.new(review_params)
		review.user_id = current_user.id
		review.item_id = params[:item_id]
		if review.save
			redirect_to item_path(review.item_id)
		else
			@item = Item.find(params[:item_id])
			@review = Review.new(review_params)
			render :new
		end
	end

	def edit
		@review = Review.find(params[:id])
	end

	def update
		review = Review.find(params[:id])
		review.user_id = current_user.id
		review.item_id = params[:id]
		if review.update(review_params)
			redirect_to item_path(review.item_id)
		else
			render :edit
		end
	end

	def destroy
		review = Review.find(params[:id])
		item = Item.find(review.item_id)
		review.destroy
		redirect_to item_path(item.id)
	end

  private

	def review_params
	    params.require(:review).permit(:review_comment,:review_star)
	end
end
