class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.string :conten

    	t.integer :commentable_id
    	t.string :commentable_type

    	t.belongs_to :user

      t.timestamps
    end
  end
end
