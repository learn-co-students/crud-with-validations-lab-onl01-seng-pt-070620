class ChangeReleasedToBeBooleanInSongs < ActiveRecord::Migration[5.0]
  def change
    change_column :songs, :released, :boolean
  end
end
