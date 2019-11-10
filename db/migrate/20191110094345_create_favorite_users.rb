class CreateFavoriteUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_users do |t|
      t.integer      :user_id
      t.integer      :favorite_user_id
      t.timestamps null: true
    end
  end
end