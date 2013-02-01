class CreditCard < ActiveRecord::Base
  belongs_to :person

  attr_accessible :number, :cardholder_name, :expiration_month, :expiration_year, :primary

  attr_encrypted :number, :key => "too many secrets"

  validates_presence_of :number, :cardholder_name, :expiration_month, :expiration_year, :first_six, :last_four

  before_validation :strip_number, :on => :create
  before_validation :set_number_length, :on => :create
  before_validation :set_first_six_last_four, :on => :create

  def strip_number
    self.number = number.to_s.gsub(/\D/,'')
  end

  def set_number_length
    self.number_length = number.length
  end

  def set_first_six_last_four
    self.first_six = number.to_s[0, 6]
    self.last_four = number.to_s[-4, 4]
  end

  def masked_number
    "#{'*'*(number_length-4)}#{last_four}"
  end
end
