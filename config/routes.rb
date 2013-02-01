LetsRailsAPI::Application.routes.draw do
  get "/countries/:id" => "countries#show"
  get "/countries" => "countries#index"

  get "/cities/:id" => "cities#show"
  get "/countries/:country_id/cities" => "cities#index"
  get "/cities" => "cities#index"

  get "/deals/:id" => "deals#show"
  get "/cities/:city_id/deals" => "deals#index"
  get "/deals" => "deals#index"

  post "/authenticate" => "people#authenticate"
  post "/people" => "people#create"
  put "/peoeple/:id" => "people#update"


end
