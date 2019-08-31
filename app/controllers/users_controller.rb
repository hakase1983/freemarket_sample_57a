class UsersController < ApplicationController
  def index
  end
  
  def profile
    @user = User.new
    #上記は仮置き
  end

end
