class CreateFavoriteUsers < ActiveRecord::Migration
  def change
    create_table :favorite_users do |t|

      t.timestamps null: false
    end
  end
end
