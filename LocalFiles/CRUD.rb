# read
#
local_file_path = "/filder_name/file_name.txt"
file = File.open(local_file_path, 'r')
file.read

# write
#
uri_report = 'csv_file.csv'
val_1, val_2, val_3 = 'str1', 'str2', 'str3'

File.open(uri_report, "w+") do |f|
  f.puts("title_column_1,title_column_2,title_column_3")
  f.puts("\"#{ val_1 }\",\"#{ val_2 }\",\"#{ val_3 }\"")
end

# delete
#
File.delete(download_directory + "ASN.ffv_#{customer_number}.txt")

# psrse each lines
#
File.readlines(local_file_path).each do |line|
  puts line 
end
