class ImportSounds < ActiveRecord::Migration
  def up
    File.open('fileinfo/all.sql') do |f| 
      f.lines.each do |l|
        ActiveRecord::Base.connection.exec_query l
      end
    end
  end

  def down
    Birdsound.delete_all
  end
end
