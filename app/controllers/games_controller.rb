class GamesController < ApplicationController
  def index
  @game = Game.first || Game.create
  end
def move
    @game = Game.first
    @game.move(params[:position].to_i)
    redirect_to root_path
  end

  def reset
    Game.destroy_all
    Game.create
    redirect_to root_path
  end
end
