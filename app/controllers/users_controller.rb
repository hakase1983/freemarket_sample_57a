class UsersController < ApplicationController
  def edit
    @personal_info = PersonalInfo.new
  end
  
  def profile
    @user = User.new
  end

  def logout
  end

end
