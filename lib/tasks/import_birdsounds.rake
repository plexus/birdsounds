def fix_utf8(s)
  # Iconv is deprecated but so far it still works
  # haven't found easy way to do this with Ruby 1.9 string encodings
  #
  # see http://po-ru.com/diary/fixing-invalid-utf-8-in-ruby-revisited/
  require 'iconv'
  ic = Iconv.new('UTF-8//IGNORE', 'UTF-8')
  s = ic.iconv(s + ' ')[0..-2]
  s.force_encoding('UTF-8')
  s
end

namespace :db do
  desc "Import birdsounds from CSV"
  task :import => :environment do
    birdsounds = []
    File.open('fileinfo/fixed.csv') do |f| 
      f.lines.each do |l| #IO.read(Rails.root.join('fileinfo/concat.csv'))).split("\n").each do |l|
        birdsounds << Birdsound.from_csv(l.split(';'))
      end
    end
    Birdsound.import birdsounds
  end

  task :fix_import do
    File.open('fileinfo/fixed.csv', 'w') {|f| f<< fix_utf8(IO.read(Rails.root.join('fileinfo/concat.csv'))) }
  end
end


