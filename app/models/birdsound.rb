class Birdsound < ActiveRecord::Base
  URL = 'http://www.xeno-canto.org/csv.php?species='
  # 'http://www.xeno-canto.org/'
  ATTR = [:genus, :species, :english, :subspecies, :recordist, :country, :location, :latitude, :longitude, :songtype, :filename, :mp3, :sonogram]

  attr_accessible ATTR

  class << self
    def from_csv(arr)
      id = arr.shift.to_i
      birdsound = self.find_or_initialize_by_id(id)
      unless birdsound.genus
        ATTR.each do |attr|
          birdsound.send("#{attr}=", arr.shift)
        end
        #birdsound.save
      end
      birdsound
    end

    def fetch_by_species(birdname)
      csv = HTTParty.get(URL + CGI.escape(birdname.latin)).body
      csv.force_encoding('UTF-8')
      csv = csv.split("\n").map {|l| l.split(";")}

      csv.map {|fields|
        id = fields.shift.to_i
        print id
        birdsound = self.find_or_initialize_by_id(id)
        unless birdsound.genus
          %w(genus species english subspecies recordist country location latitude longitude songtype).each do |attr|
            birdsound.send(attr+'=', fields.shift)
          end
          p birdsound
          birdsound.save!
        end
      }
    end
  end

end
