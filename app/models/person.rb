class Person < ActiveRecord::Base
  has_many :credit_cards
  has_many :purchases

  has_secure_password

  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation

  validates_presence_of :email
end
