class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def edit
    @personal_info = PersonalInfo.new
  end

  def show
  end

  def update
  end

  def destroy
  end

  def logout
  
  def profile
    @user = User.new

  end

end
