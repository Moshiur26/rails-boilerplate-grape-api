# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount AdminPanel::Base => '/'
  mount UserPanel::Base => '/user_panel'

end
