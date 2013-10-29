HolidayApp::Application.routes.draw do
  # get "user_settings/change_manager"
  # get 'absences/holiday_json' => 'absencess#holiday_json'
  # resources :user_days
  # resources :settings
  # resources :user_settings
  # get 'administer/get_team_data' => 'administer#get_team_data'
  # get 'administer/create' => 'administer#create'
  # resources :administer
  # resources :home, :only => :index
  # resources :admins, :only => :index
  # resources :reports, :only => :index
  get "info/registration_message"

  devise_for :users
  resources :absences
  resources :calendar

  get 'absences/holiday_json' => 'absencess#holiday_json'

  root :to => "absences#index"
end
