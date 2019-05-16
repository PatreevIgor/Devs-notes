file_path = "/folder/file_name.txt"

def file_exist_on_ftp?(file_path)
  ftp = Net::FTP.new
  ftp.connect(credentials[:host], credentials[:port])
  ftp.login(credentials[:user], credentials[:pass])
  ftp.passive      = false
  ftp.open_timeout = 10
  ftp.read_timeout = 10
  ftp.size(file_path)
  ftp.close

  return true
rescue => e
  puts "FTP file is not exist!"

  return false
end
