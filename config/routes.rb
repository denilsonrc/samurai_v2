Rails.application.routes.draw do
  root 'info#grade_equipamentos'
  get 'info/grade_equipamentos' => 'info#grade_equipamentos', as: :grade
  get 'info/index' => 'info#index', as: :info

  resources :historico_equipamentos
  resources :equipamentos
  resources :tipos
  resources :protocolos
  resources :salas
end
