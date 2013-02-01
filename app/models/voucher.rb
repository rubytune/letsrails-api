class Voucher < ActiveRecord::Base
  belongs_to :purchase

  attr_accessible :customer_code, :redeemed_at

  validates_presence_of :purchase_id, :customer_code

  before_validation :generate_customer_code, :on => :create

  BASE32_CHARS = %w[0 1 2 3 4 5 6 7 8 9 A B C D E F G H J K M N P Q R S T V W X Y Z]
  CUSTOMER_CODE_LENGTH = 6

  def generate_customer_code
    self.customer_code ||= CUSTOMER_CODE_LENGTH.times.map{ BASE32_CHARS.sample }.join
  end
end
