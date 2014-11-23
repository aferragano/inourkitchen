class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
    	t.string :title
    	t.string :summary
    	t.string :ingredients
    	t.text :directions

    	t.belongs_to :user
      t.timestamps
    end
  end
end
