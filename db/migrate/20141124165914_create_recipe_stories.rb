class CreateRecipeStories < ActiveRecord::Migration
  def change
    create_table :recipe_stories do |t|

      t.timestamps null: false
    end
  end
end
