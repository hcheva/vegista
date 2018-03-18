class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :game_name
      t.text :game_description
      t.string :game_external_link
      t.string :game_genre
      t.string :game_platform
      t.references :user, index: true

      t.timestamps
    end
  end
end
