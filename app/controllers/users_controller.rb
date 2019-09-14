class UsersController < ApplicationController
    before_action :authenticate_user!

  def index
  end
  
  def edit
    @user = User.find(params[:id])
    if current_user.id == params[:id].to_i
      @personal_info = PersonalInfo.new
    else
      redirect_to root_path
    end
  end

  def show
    if current_user.id == params[:id].to_i
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def logout
  end
  
  def profile
    @user = User.find(current_user.id)
  end

  private
  def user_params
    params.require(:user).permit(
      :family_name,
      :first_name,
      :family_name_kana,
      :first_name_kana,
      :birth_day,
      :telephone,
      :postal_code,
      :prefecture_code,
      :city_code,
      :address_num,
      :building_name)
  end
end
