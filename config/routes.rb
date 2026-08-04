Rails.application.routes.draw do
  root "games#index"

  post "move/:position", to: "games#move", as: :move
  post "reset", to: "games#reset", as: :reset
end
