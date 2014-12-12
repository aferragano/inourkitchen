class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
    	t.string :title, null: false
    	t.string :summary, null: false
    	t.string :serve_size, null: false
    	t.string :time , null: false
    	t.string :ingredients, null: false
    	t.text :directions, null: false

    	t.belongs_to :user

      t.timestamps
    end
  end
end
