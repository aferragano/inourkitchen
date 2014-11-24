class CreateRecipeTags < ActiveRecord::Migration
  def change
    create_table :recipe_tags do |t|
    	t.belongs_to :recipe 
    	t.belongs_to :tag

      t.timestamps
    end
  end
end
