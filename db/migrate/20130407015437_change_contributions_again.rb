class ChangeContributionsAgain < ActiveRecord::Migration
  def change
    change_table :contributions do |t|
      t.rename :owner?, :owner
    end
  end
end
