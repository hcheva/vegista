class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :recipe_name
      t.string :recipe_external_link
      t.string :recipe_category
      t.text :recipe_description
      t.references :user, index: true

      t.timestamps
    end
  end
end
