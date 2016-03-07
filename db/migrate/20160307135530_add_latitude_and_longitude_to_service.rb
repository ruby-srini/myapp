class AddLatitudeAndLongitudeToService < ActiveRecord::Migration
  def change
    add_column :services, :latitude, :float
    add_column :services, :longitude, :float
  end
end
