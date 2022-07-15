class SessionsController < ApplicationController
  before_action :set_session, only: %i[ show edit update destroy ]


  def new
    @session = Session.new
  end

 def create
    user=User.find_by_email(params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id 
            flash[:notice]="Logged in Successfully!"
            redirect_to '/orders'
        else
            flash.now[:alert]="Entered Wrong Credentials"
            render 'new'
        end
  end

  
  # DELETE /sessions/1 or /sessions/1.json
  def destroy
    session[:user_id] = nil
        flash[:notice] = "Logged Out Successfully"
        redirect_to '/'
  end

  
end
