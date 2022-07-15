class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  def new
    @user = User.new
  end

  def edit
  end

  def show
    @user=User.find(params[:id])
    @orders = @user.orders
  end

  def create
    @user = User.new(user_params)
        if @user.save
          flash[:notice]="Registered Successfully!!"
          redirect_to login_path
        else
          render 'new'
        end
  end

  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username,:email,:password)
      
    end
end
