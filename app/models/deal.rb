class Deal < ActiveRecord::Base
  belongs_to :city
  has_many :deal_images
  has_many :options

  attr_accessible :city_id, :city, :short_title, :long_title, :description, :offer_starts_at, :offer_ends_at, :type

  validates_presence_of :short_title, :long_title, :offer_starts_at, :offer_ends_at

  def self.running_now
    where(["deals.offer_starts_at < ? and deals.offer_ends_at > ?", Time.now, Time.now])
  end
  
  def self.select_type(type = nil)
    if type.present?
      if Deal.select(:type).uniq.collect(&:type).include? type
        where(:type => type)
      else
        where(false)
      end
    else
      scoped
    end
  end
end
