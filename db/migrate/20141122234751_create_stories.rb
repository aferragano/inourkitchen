class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
    	t.string :title
    	t.string :content

    	t.belongs_to :recipe
      t.timestamps
    end
  end
end
