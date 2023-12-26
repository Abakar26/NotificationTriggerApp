class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      # Successful signup, you can redirect to a different page or do something else
      redirect_to root_path, notice: 'User successfully created!'
    else
      # Signup failed, render the signup form again with error messages
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :password, :password_confirmation)
  end
end
