ftp_file_path   = "/ftp_folder_name/file_name.txt"
local_file_path = "/local_folder_name/file_name.txt"

def download_file_from_ftp(ftp_file_path, local_file_path)
  ftp = Net::FTP.new
  ftp.connect(credentials[:host], credentials[:port])
  ftp.login(credentials[:user], credentials[:pass])
  ftp.passive = false
  ftp.open_timeout = 10
  ftp.read_timeout = 10
  ftp.getbinaryfile(ftp_file_path, local_file_path)
  ftp.close
end
