class Users::RegistrationsController < Devise::RegistrationsController

  def new
    @user = User.new
    @user.build_profile
  end

  def create
    @user = User.new(user_params)
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :new and return
    end
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    @shipping_address = @user.shipping_addresses.build
    render :new_shipping_address
  end

  def create_shipping_address
    @user = User.new(session["devise.regist_data"]["user"])
    @shipping_address = Shipping_address.new(address_params)
    unless @shipping_address.valid?
      flash.now[alert] = @shipping_address.errors.full_messages
      render :new_profile and return
    end
    @user.build_shipping_address(@shipping_address.attributes)
    @user.save!
    sgin_in(:user, @user)
  end

  private

  def user_params
    params.require(:user).permit(:nickname,:email,:password, :password_confirmation, profile_attributes:[:id, :family_name, :first_name, :family_name_kana, :first_name_kana, :birth_year, :birth_month, :birth_day])
  end

  def address_params
    params.require(:shipping_address).permit(:destination_first_name, :destination_family_name, :destination_first_name_kana, :destination_family_name_kana, :post_code, :prefectures, :city, :house_number, :building_name, :phone)
  end
  
end
