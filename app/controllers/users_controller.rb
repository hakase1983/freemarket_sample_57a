class UsersController < ApplicationController
  def edit
    @personal_info = PersonalInfo.new
  end
  
  def profile
    @user = User.new
    #上記は仮置き
  end

end
