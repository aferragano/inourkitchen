class CreateGroupUsers < ActiveRecord::Migration
  def change
    create_table :group_users do |t|
    	t.string :access_level
    	
    	t.belongs_to :user 
    	t.belongs_to :group 

      t.timestamps
    end
  end
end
