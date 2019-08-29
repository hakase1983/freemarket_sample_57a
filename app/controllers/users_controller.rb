class UsersController < ApplicationController
  def index
  end

  def edit
    @personal_info = PersonalInfo.new
  end

  def update
    @personal_info = PersonalInfo.new
    @personal_info.update
  end
end
