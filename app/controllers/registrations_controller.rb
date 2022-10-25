class RegistrationsController < ApplicationController
    # instantiates new user

    def index
      @users = User.all
    end
    def new
      @user = User.new
    end

    def show
    @user = User.find(params[:id])
    end

    def create
    @user = User.new(user_params)
    if @user.save
      WelcomeMailer.with(user: @user).welcome_email.deliver_now
      # deliver_now is provided by ActiveJob.
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Successfully created account'
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  

  def update
    # byebug
    @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to root_path
    else
      render 'edit'
    end

  end

    private
    def user_params
      # strong parameters
      params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :role)
    end
  end