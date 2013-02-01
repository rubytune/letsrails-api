class Country < ActiveRecord::Base
  has_many :cities

  attr_accessible :code, :name, :language

  validates_presence_of :code, :name, :language
end
