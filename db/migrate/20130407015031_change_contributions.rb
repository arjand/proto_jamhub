class ChangeContributions < ActiveRecord::Migration
  def change
    add_column :contributions, :owner?, :boolean
  end
end
