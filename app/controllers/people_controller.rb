class PeopleController < ApplicationController

  def authenticate
    if person = Person.find_by_email(params[:email])
      if person.authenticate(params[:password])
        render :json => person
      else
        render :json => { :errors => ["Incorrect password"] }
      end
    else
      render :json => { :errors => ["Incorrect email"] }, :status => 422
    end
  end

  def create
    person = Person.new(person_params)
    if person.save
      render :json => person
    else
      render :json => { :errors => person.errors }, :status => 422
    end
  end

  def update
    person = Person.find(params[:id])
    if person.update_attributes(person_params)
      render :json => person
    else
      render :json => { :errors => person.errors }, :status => 422
    end
  end

  def show
    person = if params[:id].present?
      Person.find(params[:id])
    else
      Person.where(params.except(:controller, :action)).first
    end

    if person
      render :json => person
    else
      render :json => {}
    end
  end

protected
  def person_params
    params.slice(:email, :first_name, :last_name, :password, :password_confirmation, :gender, :born_on, :city_id)
  end
end
