class BooksController < ApplicationController
  def index
  # @books = Book.all 
    @books = Book.search(params[:search])
    p @books
  end

  def new
    #@author_p=params[:author_id]
    p "params"
    p params
    p "*****author_P"
    #p @author_p
    @author = Author.find(params[:author_id])
    @book = Book.new() 
  end
  
  def create 
    p "create params"
    p book_params
    @author = Author.find(params[:author_id])
    @book = @author.books.new(book_params)
     p @new_author_book_path
     @book.author_id=params[:author_id]
    if @book.save
      p "***save"
      p @book 
      redirect_to books_path
    else
      render "new"
    end
  end
  
  

  def show
  end

  def edit
    p "ffggfhgh"
    p params
    @author = Author.find(params[:author_id])
    @book = @author.books.find(params[:id])
    p @book 
  end

  def update
    p "updatehjjhjh"
     @author = Author.find(params[:author_id])
    @book = @author.books.find(params[:id])
  p @book 
    if @book.update(book_params)
      flash[:notice] = "Edited"
      redirect_to author_path(@author)
    else
      render "edit"
    end
  end

  def destroy
    @author = Author.find(params[:author_id])
    @book = @author.books.find(params[:id])
    @book.destroy
    redirect_to author_path(@author)
  end

  private
  def book_params
    params.require(:book).permit(:name,:content,:genre,:published,:author_id,:search)
  end
end
