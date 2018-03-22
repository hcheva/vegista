class RemoveSlugFromGame < ActiveRecord::Migration
  def change
    remove_column :games, :slug, :string
  end
end
