class SignupController < ApplicationController

  def step00
  end

  def step1
    @user = User.new
    # @address = Address.new
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
    session[:birthdate_year] = user_params[:birthdate_year]
    session[:birthdate_month] = user_params[:birthdate_month]
    session[:birthdate_day] = user_params[:birthdate_day]
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
    )
    render '/signup/step1' unless @user.valid?(:step2)
end

  def step3
    session[:phone_number] = user_params[:phone_number]
    @user = User.new( phone_number: session[:phone_number])# 新規インスタンス作成
    # render '/signup/step2' unless @user.valid?(:step3)
    # session[:phone_number] = user_params[:phone_number]
    @user.build_address
  end


  def step5
    sign_in User.find(session[:address_attributes]) unless user_signed_in?
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
      phone_number: session[:phone_number]
    )
    @user.build_address(user_params[:address_attributes]) # 入力値を引数で渡す
      if @user.save
        session[:address_attributes] = @user.id
        redirect_to step5_signup_index_url
      else
        render '/signup/step3'
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
        address_attributes: [:user_id, :address_last_name, :address_first_name, :address_last_name_kana, :address_first_name_kana, :address_number, :address_prefecture, :address_name, :address_block, :address_building, :address_phone_number,]
    )
end


end