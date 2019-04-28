class User < ApplicationRecord
  has_secured_password
  validates :email, presence: true, uniqueness: true
  
  has_many :movies 
  has_many :reviews
end
