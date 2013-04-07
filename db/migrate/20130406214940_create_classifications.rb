class CreateClassifications < ActiveRecord::Migration
  def change
    create_table :classifications do |t|
      t.integer :song_id
      t.integer :genre_id
      
      t.timestamps
    end
  end
end
