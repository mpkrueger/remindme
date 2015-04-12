class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id

      authy = Authy::API.register_user(
        email: "email#{@user.id}@example.com",
        cellphone: @user.phone_number,
        country_code: 1
      )
      
      if authy.ok?
        @user.update(authy_id: authy.id)
      else
        @errors = authy.errors
      end

      Authy::API.request_sms(id: @user.authy_id)

      redirect_to verify_user_path(@user.id)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def show_verify
    @user = User.find(params[:id])
    return redirect_to new_user_path unless session[:user_id]
  end

  def verify
    @user = User.find(params[:id])

    token = Authy::API.verify(id: @user.authy_id, token: params[:token])

    if token.ok?
      @user.update(verified: true)
      send_message("Your phone number was successfully confirmed.")
      redirect_to user_path(@user.id)
    else
      flash[:error] = "Incorrect code, please try again."
      render show_verify
    end
  end

  def resend
    @user = User.find(params[:id])
    Authy::API.request_sms(id: @user.authy_id)
    flash[:notice] = "Verification code re-sent"
    redirect_to verify_path
  end

  private 

  def send_message(message)
    @user = User.find(params[:id])
    SmsSender.new(message, @user).send_sms
  end

  def user_params
    params.require(:user).permit(:id, :name, :password, :phone_number)
  end
end
