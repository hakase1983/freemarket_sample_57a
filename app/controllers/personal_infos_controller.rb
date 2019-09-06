class PersonalInfosController < ApplicationController
  
  def new
    @personal_info = PersonalInfo.new
    render layout: "compact"
  end

  def create
    @personal_info = PersonalInfo.new(personal_info_params)

    if @personal_info.save
      redirect_to new_card_path 
    else
      render :new 
  end
end

  private

  def personal_info_params
    params.require(:personal_info).permit(
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
      :building_name
    ).merge(
      user_id: current_user.id
    )
  end
end
