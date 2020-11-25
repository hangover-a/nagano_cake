class ChangeDatatypeNameofGenres < ActiveRecord::Migration[5.2]
  def up
    change_column :genres, :name, :string
  end
end
