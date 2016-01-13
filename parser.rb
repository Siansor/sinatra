class SiteParser
  require 'net/http'

  def self.get_site_text
    url = URI.parse('http://www.postfix.org/docs.html')
    @req = Net::HTTP::Get.new(url.to_s)
    @res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(@req)
    }

    f = File.new("site/text.txt", "w")
    f.write(@res.body)
    h = File.new("site/next.html", "w")
    h.write(@res.body)

    system("open site/next.html")
  end

  def self.info
    puts @res.length
    puts @req.length
    puts @res.body.length
  end

  def self.name(myname)
    lan = myname.length
    if lan == 2
      p "Me name have more than #{lan}"
    else
      p "Me name have mote than #{lan}"
    end
  end
end

SiteParser.get_site_text
SiteParser.name('Sasha')
SiteParser.info
