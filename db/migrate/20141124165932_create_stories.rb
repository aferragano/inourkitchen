class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
    	t.string :title, null: false
    	t.text :content, null: false

    	t.belongs_to :user
    	
      t.timestamps
    end
  end
end
