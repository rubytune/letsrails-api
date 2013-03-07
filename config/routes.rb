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
  get  "/people/:id" => "people#show"
  get  "/people" => "people#show"
  post "/people" => "people#create"
  put  "/people/:id" => "people#update"
end
