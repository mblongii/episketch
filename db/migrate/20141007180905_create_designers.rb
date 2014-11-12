class CreateDesigners < ActiveRecord::Migration
  def change
    create_table :designers do |t|
      t.string :email
      t.string :avatar_url
      t.string :auth_token
      t.integer :storyboard_id
      t.integer :viewing_storyboard_id

      t.timestamps
    end
  end
end
