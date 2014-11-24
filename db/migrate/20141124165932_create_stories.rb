class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
    	t.string :title
    	t.text :content

    	t.belongs_to :user 
    	
      t.timestamps
    end
  end
end
