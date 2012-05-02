class CreateBirdsounds < ActiveRecord::Migration
  def change
    create_table :birdsounds do |t|
      t.string :genus
      t.string :species
      t.string :english
      t.string :subspecies
      t.string :recordist
      t.string :country
      t.string :location
      t.string :latitude
      t.string :longitude
      t.string :songtype
      t.string :filename
      t.string :mp3
      t.string :sonogram

      t.timestamps
    end
  end
end
