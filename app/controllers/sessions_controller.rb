class SessionsController < ApplicationController
    def new; end
    def create
      user = User.find_by(email: params[:email])
      # finds existing user, checks to see if user can be authenticated
      if user.present? && user.authenticate(params[:password])
      # sets up user.id sessions
        session[:user_id] = user.id
        redirect_to root_path, notice: 'Logged in successfully'
      else
        flash.now[:alert] = 'Invalid email or password'
        render :new
      end
    end


  # def edit
  #   @user = User.find(params[:id])
  # end
   def edit; end

  def update
    @user = User.find(params[:id])
    if @user.present?
      @user.update(params_data)
    else
      redirect_to root_path
    end

  end
    def destroy
      # deletes user session
      session[:user_id] = nil
      redirect_to root_path, notice: 'Logged Out'
    end

     private
    def params_data
      # strong parameters
      params.require(:user).permit(:email,:first_name, :last_name, :role)
    end
  end
