class BooksController < ApplicationController
    #before_action :authenticate_user!, only: [:create, :update]
   
    before_action :set_book, only: %i[ show update destroy ]

    def index
        @books = Book.all

        render json: @books
    end

    def show
        render json: @book
    end
    def new
        @book = current_user.books.build
      end

    def create

            @book = Book.new(book_params)

            if @book.save
            render json: @book, status: :created, location: @book
            else
            render json: @book.errors, status: :unprocessable_entity
            end
        end
    end

    def update
        if @book.update(book_params)
        render json: @book
        else
        render json: @book.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @book.destroy
    end

    private


        def set_book
        @book = Book.find(params[:id])
        end

        def book_params
        params.require(:book).permit(:title, :description, :author_id)
        end
end
