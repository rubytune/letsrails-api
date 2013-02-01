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
      render :json => { :errors => person.errors.full_messages }, :status => 422
    end
  end

  def update
    person = Person.find(params[:id])
    if person.update_attributes(person_params)
      render :json => person
    else
      render :json => { :errors => person.errors.full_messages }, :status => 422
    end
  end

  def show
    render :json => Person.find(params[:id])
  end

protected
  def person_params
    params.slice(:email, :first_name, :last_name, :password, :password_confirmation)
  end
end
