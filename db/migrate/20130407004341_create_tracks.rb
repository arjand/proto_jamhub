class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :title
      t.text :description
      t.integer :tag
      t.integer :user_id

      t.timestamps
    end
  end
end
