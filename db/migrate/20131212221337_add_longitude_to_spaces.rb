class AddLongitudeToSpaces < ActiveRecord::Migration
  def change
    add_column :spaces, :longitude, :decimal
  end
end
