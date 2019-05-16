ftp_folder_path = "/folder_name/"
file_name = "file_name.txt"

def delete_file_on_ftp(file_name, ftp_folder_path)
  ftp = Net::FTP.new
  ftp.connect(credentials[:host], credentials[:port])
  ftp.login(credentials[:user], credentials[:pass])
  ftp.passive      = false
  ftp.open_timeout = 10
  ftp.read_timeout = 10
  ftp.chdir(ftp_folder_path)
  ftp.delete(file_name)
  ftp.close
end
