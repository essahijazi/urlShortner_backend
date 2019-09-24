Rails.application.routes.draw do
  get 'urls/show'
  post 'urls/shorten', to: "urls#shorten", as: "shorten_url"


end
