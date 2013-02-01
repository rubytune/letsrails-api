class Option < ActiveRecord::Base
  belongs_to :deal

  attr_accessible :deal_id, :deal, :title, :price, :value, :primary

  validates_presence_of :title, :price, :value
end
