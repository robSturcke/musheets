Rails.application.routes.draw do

  mount ActionCable.server => '/cable'

  root 'spreadsheet#index'
end
