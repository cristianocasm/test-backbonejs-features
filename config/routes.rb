Rails.application.routes.draw do
  scope "api" do
    resources :entries
  end

  root 'main#index'
end
