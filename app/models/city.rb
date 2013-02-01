class City < ActiveRecord::Base
  belongs_to :country
  has_many :deals

  attr_accessible :country_id, :country, :name, :slug, :time_zone

  validates_presence_of :country_id, :name, :slug, :time_zone
end
