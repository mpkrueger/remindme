class User < ActiveRecord::Base
  # has_secure_password

  validates :name, presence: true
  validates :phone_number, presence: true
end

# sessions#create - login page
# params[:login][:phone]
# params[:login][:password]
# user = User.find_by(phone: params[:login][:phone])
# user.authenticate(params[:login][:password])
# session[:user_id] = user.id 

# if user.authenticate(params[:login][:password])
#   session[:user_id] = user.id
# else 