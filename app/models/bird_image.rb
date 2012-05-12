class BirdImage < ActiveRecord::Base
  attr_accessible :filename, :latin_name, :url

  class << self
    def create_by_latin_name(latin)
      url = 'https://commons.wikimedia.org/w/api.php?'+
        %w(
          action=query 
          generator=search 
          gsrnamespace=6
          gsrsearch=%s
          gsrlimit=20
          gsroffset=20
          prop=imageinfo
          iiprop=url
          format=xml
        ).join('&')
      headers = {
        'User-Agent' => 'arne.brasseur@gmail.com'  
      }
      #puts url % CGI.escape(latin)
      qry = HTTParty.get(url % CGI.escape(latin), :headers => headers)
      page = qry['api']['query']['pages']['page'] rescue []
      page.each do |pg|
        imageinfo = pg['imageinfo']['ii'] rescue nil
        if imageinfo
          bi = self.new
          bi.url = imageinfo['url']
          bi.latin_name = latin
          bi.save
        end
      end
      #File.open('/tmp/%d' % rand(1000), 'w') {|f| f << qr}
      #end
    end
  end
end
# == Schema Information
#
# Table name: bird_images
#
#  id         :integer         not null, primary key
#  latin_name :string(255)
#  url        :string(255)
#  filename   :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

