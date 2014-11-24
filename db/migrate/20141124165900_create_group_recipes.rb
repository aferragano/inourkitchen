class CreateGroupRecipes < ActiveRecord::Migration
  def change
    create_table :group_recipes do |t|
    	
    	t.belongs_to :group 
    	t.belongs_to :recipe 

      t.timestamps
    end
  end
end
