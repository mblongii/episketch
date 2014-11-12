class CreateSketches < ActiveRecord::Migration
  def change
    create_table :sketches do |t|
      t.integer :designer_id
      t.string :url
      t.integer :storyboard_id

      t.timestamps
    end
  end
end
