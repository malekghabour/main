class CreateGames < ActiveRecord::Migration[8.1]
  def change
    create_table :games do |t|
      t.text :board
      t.string :current_turn
      t.string :status
      t.string :winner

      t.timestamps
    end
  end
end
