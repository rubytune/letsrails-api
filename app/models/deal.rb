class Deal < ActiveRecord::Base
  belongs_to :city
  has_many :deal_images
  has_many :options

  attr_accessible :city_id, :city, :short_title, :long_title, :description, :offer_starts_at, :offer_ends_at

  validates_presence_of :short_title, :long_title, :offer_starts_at, :offer_ends_at

  def self.running_now
    where(["deals.offer_starts_at < ? and deals.offer_ends_at > ?", Time.now, Time.now])
  end
end
