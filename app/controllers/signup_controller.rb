class SignupController < ApplicationController

  layout "compact"

  def step1
    # @user = User.new
    # @user.build_personal_info
  end

  def step2
    # session[:name] =                  user_params[:name]
    # session[:email] =                 user_params[:email]
    # session[:password] =              user_params[:password]
    # session[:password_confirmation] = user_params[:password_confirmation]
    # session[:family_name] =           user_params[:personal_info_attributes][:family_name]
    # session[:first_name] =            user_params[:personal_info_attributes][:first_name]
    # session[:family_name_kana] =      user_params[:personal_info_attributes][:family_name_kana]
    # session[:first_name_kana] =       user_params[:personal_info_attributes][:first_name_kana]
    # session[:birth_day] =             user_params[:personal_info_attributes][:birth_day]
    # @user = User.new
    # @user.build_personal_info
  end

  def step3
    @user = User.new
    @user.build_personal_info
  end

  def step4
    # session[:family_name] =           user_params[:personal_info_attributes][:family_name]
    # session[:first_name] =            user_params[:personal_info_attributes][:first_name]
    # session[:family_name_kana] =      user_params[:personal_info_attributes][:family_name_kana]
    # session[:first_name_kana] =       user_params[:personal_info_attributes][:first_name_kana]
    # session[:postal_code] =           user_params[:personal_info_attributes][:postal_code]
    # session[:prefecture_code] =       user_params[:personal_info_attributes][:prefecture_code]
    # session[:city_code] =             user_params[:personal_info_attributes][:city_code]
    # session[:address_num] =           user_params[:personal_info_attributes][:address_num]
    # session[:building_name] =         user_params[:personal_info_attributes][:building_name]
    # session[:telephone] =             user_params[:personal_info_attributes][:telephone]
    @user = User.new
  end

  def done
    # sign_in User.find(session[:id]) unless user_signed_in?
  end

  def create
    @user = User.new(
      name:                  session[:name],
      email:                 session[:email],
      password:              session[:password],
      password_confirmation: session[:password_confirmation],
      personal_info_attributes:{family_name:           session[:family_name]},
      personal_info_attributes:{first_name:            session[:first_name]},
      personal_info_attributes:{family_name_kana:      session[:family_name_kana]},
      personal_info_attributes:{first_name_kana:       session[:first_name_kana]},
      personal_info_attributes:{birth_day:             session[:birth_day]}
      # personal_info_attributes:{postal_code:           session[:postal_code]},
      # personal_info_attributes:{prefecture_code:       session[:prefecture_code]},
      # personal_info_attributes:{city_code:             session[:city_code]},
      # personal_info_attributes:{address_num:           session[:address_num]},
      # personal_info_attributes:{building_name:         session[:building_name]},
      # personal_info_attributes:{telephone:             session[:telephone]}
    )
    # @user.build_personal_info(user_params[:personal_info_attributes])
    binding.pry
    if @user.save
      session[:id] = @user.id
      redirect_to step4_signup_index_path
    else
      render '/signup/step1'
    end
  end

  def signup_type
  end

  def signup_sms
  end

  def signup_completed
  end

  # private

  # def user_params
  #   params.require(:user).permit(
  #     :name,
  #     :email,
  #     :password,
  #     :password_confirmation,
  #     personal_info_attributes: [
  #       :id,
  #       :family_name,
  #       :first_name,
  #       :family_name_kana,
  #       :first_name_kana,
  #       :birth_day,
  #       :telephone,
  #       :postal_code,
  #       :prefecture_code,
  #       :city_code,
  #       :address_num,
  #       :building_name
  #     ]
  #   )
  # end

end
