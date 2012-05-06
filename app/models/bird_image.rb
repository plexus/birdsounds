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
      qry = HTTParty.get(url % CGI.escape(latin), :headers => headers)
      puts qry.body
      p qry['api']['query']
      #qry['api']['query']['pages']['page'].map do |page|
      #  p page
      #end
      #File.open('/tmp/%d' % rand(1000), 'w') {|f| f << qr}
      #end
    end
  end
end
