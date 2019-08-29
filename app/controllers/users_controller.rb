class UsersController < ApplicationController
  def edit
    @personal_info = PersonalInfo.new
  end
end
