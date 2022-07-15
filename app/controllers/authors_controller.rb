class AuthorsController < ApplicationController
  def index
    #@authors = Author.all
    @authors = Author.search(params[:search])
    p @authors
  end

  def new
    @author = Author.new()
  end

  def Literature
    render "literature"
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      redirect_to authors_path
    else
      render "new"
    end
  end
  
  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    if @author.update(author_params)
      flash[:notice] = "Edited"
      redirect_to authors_path
    else
      render "edit"
    end
  end

  def show
    @author=Author.find(params[:id])
    @books = @author.books
   
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy
    redirect_to authors_path
  end

  private
  def author_params
    params.require(:author).permit(:name,:country,:awards,:search)
  end
end
