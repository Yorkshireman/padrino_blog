class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :password_digest, :name, :email
end
