class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.column :title, :string

      t.timestamps
    end
  end
end
