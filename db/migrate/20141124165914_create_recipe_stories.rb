class CreateRecipeStories < ActiveRecord::Migration
  def change
    create_table :recipe_stories do |t|
    	t.belongs_to :user
    	
    	t.belongs_to :recipe, null: false
    	t.belongs_to :story, null: false

      t.timestamps
    end
  end
end
