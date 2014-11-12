class CreateStoryboards < ActiveRecord::Migration
  def change
    create_table :storyboards do |t|
      t.integer :designer_id
      t.string :name

      t.timestamps
    end
  end
end
