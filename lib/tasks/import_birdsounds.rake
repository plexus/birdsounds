def fix_utf8(s)
  # Iconv is deprecated but so far it still works
  # see http://po-ru.com/diary/fixing-invalid-utf-8-in-ruby-revisited/
  require 'iconv'
  ic = Iconv.new('UTF-8//IGNORE', 'UTF-8')
  s = ic.iconv(s + ' ')[0..-2]
  s.force_encoding('UTF-8')
  s
end

namespace :db do
  task :import => :environment do
    birdsounds = []
    fix_utf8(IO.read(Rails.root.join('fileinfo/concat.csv'))).split("\n").each do |l|
      birdsounds << Birdsound.from_csv(l.split(';'))
    end
    Birdsound.import birdsounds
  end
end


