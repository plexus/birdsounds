class CreateBirdImages < ActiveRecord::Migration
  def change
    create_table :bird_images do |t|
      t.string :latin_name
      t.string :url
      t.string :filename

      t.timestamps
    end
  end
end
