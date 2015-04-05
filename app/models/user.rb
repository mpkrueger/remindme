class User < ActiveRecord::Base
  # has_secure_password

  validates :name, presence: true
  validates :phone_number, presence: true
end
