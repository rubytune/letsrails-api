class CreditCardsController < ApplicationController

  def index
    render :json => person.credit_cards.all.to_json(:only => safe_credit_card_params)
  end

  def show
    render :json => person.credit_cards.find(params[:id]).to_json(:only => safe_credit_card_params)
  end

  def create
    credit_card = person.credit_cards.build(credit_card_params)
    if credit_card.save
      render :json => credit_card.to_json(:only => safe_credit_card_params)
    else
      render :json => { :errors => credit_card.errors.full_messages }, :status => 422
    end
  end

  def update
    credit_card = person.credit_cards.find(params[:id])
    if credit_card.update_attributes(credit_card_params)
      render :json => credit_card
    else
      render :json => { :errors => credit_card.errors.full_messages }, :status => 422
    end
  end

protected
  def person
    @person ||= Person.find(params[:person_id])
  end

  def credit_card_params
    [:number, :expiration_month, :expiration_year, :cardholder_name, :primary]
  end

  def safe_credit_card_params
    [:last_four, :masked_number, :expiration_month, :expiration_year, :cardholder_name, :person_id, :primary, :created_at, :updated_at]
  end

end
