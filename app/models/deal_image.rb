class DealImage < ActiveRecord::Base
  belongs_to :deal

  attr_accessible :url, :width, :height

  before_validation :extract_width_and_height_from_url

  validates_presence_of :url, :width, :height

  def extract_width_and_height_from_url
    width, height = File.basename(url, ".jpg").split('-').last.split('x')
    self.width ||= width
    self.height ||= height
  end
end
