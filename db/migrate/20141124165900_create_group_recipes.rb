class CreateGroupRecipes < ActiveRecord::Migration
  def change
    create_table :group_recipes do |t|

      t.timestamps null: false
    end
  end
end
