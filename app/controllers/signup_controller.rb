class SignupController < ApplicationController
  
  def step1
    @user = User.new
    @address = Address.new
  end

  def step2
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    @user = User.new # 新規インスタンス作成
  end

  def step3
    session[:phone_number] = user_params[:phone_number]
    @user = User.new # 新規インスタンス作成
    @user.build_address
  end

  def step4
  end

    def create
    @user = User.new(
      nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      last_name: session[:last_name],
      first_name: session[:first_name],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      birthdate_year: session[:birthdate_year],
      birthdate_month: session[:birthdate_month],
      birthdate_day: session[:birthdate_day],
      phone_number: session[:phone_number],
      introduce: session[:introduce],
      encrypted_password: session[:encrypted_password],
    )
    @address = Address.new(
      address_last_name: user_params[:address_last_name],
      address_first_name: user_params[:address_first_name],
      address_last_name_kana: user_params[:address_last_name_kana],
      address_first_name_kana: user_params[:address_first_name_kana],
      address_number: user_params[:address_number],
      address_prefecture: user_params[:address_prefecture],
      address_name: user_params[:address_name],
      address_block: user_params[:address_block],
      address_building: user_params[:address_building],
      address_phone_number: user_params[:ddress_phone_number],
    )
    @user.build_address(user_params[:address_attributes]) # 入力値を引数で渡す
    if @user.save
        session[:user_id] = @user.id
        redirect_to new_user_path
      else
        render '/signup/step4'
      end
    end
    private
  # 許可するキーを設定します
    def user_params
      params.require(:user).permit(
        :nickname,
        :email,
        :password,
        :password_confirmation,
        :last_name,
        :first_name,
        :last_name_kana,
        :first_name_kana,
        :birthdate_year,
        :birthdate_month,
        :birthdate_day,
        :phone_number,
        # :introduce,
        # :encrypted_password,
    )
end

def addres_params
  params.require(:address).permit(
    address_attributes: [:id, :user_id],
    address_attributes: [:id, :address_last_name],
    address_attributes: [:id, :address_first_name],
    address_attributes: [:id, :address_last_name_kana],
    address_attributes: [:id, :address_first_name_kana],
    address_attributes: [:id, :address_number],
    address_attributes: [:id, :address_prefecture],
    address_attributes: [:id, :address_name],
    address_attributes: [:id, :address_block],
    address_attributes: [:id, :address_building],
    address_attributes: [:id, :address_phone_number],
  )
end
end
