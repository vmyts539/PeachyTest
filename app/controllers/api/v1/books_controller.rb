class Api::V1::BooksController < ApplicationController
  def create
    @book = Book.new(resource_params)
    authorize! :create, @book

    if @book.save
      render json: {
        status: { code: 200 },
        message: 'Book is successfully created.',
        data: { book: BookSerializer.new(@book).serializable_hash[:data][:attributes] }
      }, status: :ok
    else
      render json: {
        status: 422,
        message: 'Failed to create a book.'
      }, status: :unprocessable_entity
    end
  end

  def destroy
    @book = Book.find(params[:id])
    authorize! :destroy, @book

    @book.destroy

    head :no_content
  end

  private

  def resource_params
    params.require(:book).permit(:title, :description, :user_id)
  end
end
