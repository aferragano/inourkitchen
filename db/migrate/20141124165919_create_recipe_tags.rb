class CreateRecipeTags < ActiveRecord::Migration
  def change
    create_table :recipe_tags do |t|

      t.timestamps null: false
    end
  end
end
