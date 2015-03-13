class ChangeAlbum < ActiveRecord::Migration
  def change
    rename_column :albums, :live?, :live
  end
end
