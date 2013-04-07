class CreateCompilations < ActiveRecord::Migration
  def change
    create_table :compilations do |t|
      t.integer :song_id
      t.integer :track_id
      
      t.timestamps
    end
  end
end
