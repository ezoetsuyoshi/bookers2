class FavoritesController < ApplicationController

	def create
		@book = Book.find(params[:book_id])
		favorite = current_user.favorites.new(book_id: @book.id)
		favorite.save
		redirect_to book_path(@book.id)
	end

	def destroy
		book = Book.find(params[:book_id])
		favorite = current_user.favorites.find_by(book_id: params[:book_id])
		favorite.destroy
		redirect_to book_path(book.id)
	end

	private

	def favorite_params
		params.require(:favorite).permit(:book_id, :user_id)
	end
end
