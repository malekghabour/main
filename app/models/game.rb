class Game < ApplicationRecord
  serialize :board, coder: JSON

  after_initialize :setup

  def setup
    self.board ||= Array.new(9, "")
    self.current_turn ||= "X"
    self.status ||= "playing"
  end

  def move(position)
    return false unless status == "playing"
    return false unless board[position].blank?

    board[position] = current_turn

    if winner?
      self.status = "finished"
      self.winner = current_turn
    elsif board.none?(&:blank?)
      self.status = "draw"
    else
      self.current_turn = current_turn == "X" ? "O" : "X"
    end

    save
  end

  def winner?
    wins = [
      [0,1,2], [3,4,5], [6,7,8],
      [0,3,6], [1,4,7], [2,5,8],
      [0,4,8], [2,4,6]
    ]

    wins.any? do |line|
      a, b, c = line
      board[a].present? &&
        board[a] == board[b] &&
        board[b] == board[c]
    end
  end
end
