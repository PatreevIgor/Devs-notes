url:     https://api.gunbroker.com/v1
user:    ***
pass:    ***
dev_key: ***

def get_access_token(attempts = 3)
  uri = URI("#{url}/Users/AccessToken")

  # Create client
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_PEER

  data = { 'Username' => user, 'Password' => pass }
  body = data.to_json

  # Create Request
  req = Net::HTTP::Post.new(uri)

  # Add headers
  req.add_field 'X-DevKey', dev_key
  req.add_field 'Content-Type', 'application/json; charset=utf-8'

  # Set body
  req.body = body

  # Fetch Request
  res = http.request(req)

  result = JSON.parse(res.body)

  result['accessToken']
rescue => e
  sleep 1

  retry if (attempts -= 1) > 0

  puts "Error GunBroker get access token: #{e.to_yaml}"
end
