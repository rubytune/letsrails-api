class Purchase < ActiveRecord::Base
  include AASM

  belongs_to :option
  belongs_to :person
  belongs_to :credit_card
  has_many :vouchers

  attr_accessible :aasm_state, :option, :option_id, :person, :person_id, :credit_card, :credit_card_id, :quantity

  validates_presence_of :option_id, :person_id, :credit_card_id, :quantity

  before_create :build_vouchers

  aasm do
    state :new, initial: true
    state :authorized
    state :authorization_failed
    state :charged
    state :charge_declined

    event :successful_authorization do
      transitions :from => :new, :to => :authorized
    end

    event :failed_authorization do
      transitions :from => :new, :to => :authorization_failed
    end

    event :successful_charge do
      transitions :from => :authorized, :to => :charged
    end

    event :failed_charge do
      transitions :from => :authorized, :to => :charge_declined
    end
  end

  def build_vouchers
    quantity.times { vouchers.build }
  end

end
