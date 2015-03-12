class CreateBandAndCreateAlbumAndCreateTrack < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :name, null: false

      t.timestamps
    end

    create_table :albums do |t|
      t.string :title, null: false
      t.integer :band_id, null: false
      t.boolean :live?, null: false

      t.timestamps
    end

    create_table :tracks do |t|
      t.string :name, null: false
      t.string :album_id, null: false
      t.text :lyrics
      t.boolean :bonus?, null: false

      t.timestamps
    end

    add_index :albums, :band_id
    add_index :tracks, :album_id
  end
end
