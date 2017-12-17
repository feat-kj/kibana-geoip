require 'MaxMindDB'

db = MaxMindDB.new('GeoLite2-City.mmdb')
readFile = "log/orig.log"
outFile  = "log/geoip.log"
outIp = []

File.open(readFile){|file|
  file.each_line{|access|
    access.match(/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/){|md|
      ip  = md[0]
      ret = db.lookup(ip)
      str = "#{ip},¥"#{ret.location.latitude},#{ret.location.longitude}¥""
      outIp << str
    }
  } 
}

f = File.open(outFile, "w")
outIp.each { |s| f.puts(s) }
