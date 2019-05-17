require 'net/http'
require 'net/https'
require 'json'
require 'open-uri'

class AmazonAuthenticator < BaseAuthenticator
  private

  def url
    'https://api.amazon.com/auth/o2/token'
  end

  def header
    { 'Content-Type' => 'application/x-www-form-urlencoded' }
  end

  def body
    'grant_type=refresh_token'\
    "&client_id=#{CLIENT_ID}"\
    "&refresh_token=#{REFRESH_TOKEN}"\
    "&client_secret=#{SECRET_KEY}"
  end
end


class BaseAuthenticator
  include Constants

  def access_token
    uri = URI(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER

    request = Net::HTTP::Post.new(uri)

    header.each { |key, value| request.add_field header[key], header[value] } unless header.empty?

    request.body = body

    response = http.request(request)
    puts "Response HTTP Status Code: #{response.code}"
    puts "Response HTTP Response Body: #{response.body}"

    JSON.parse(response.body)['access_token']
  end

  def bearer_access_token
    "Bearer #{access_token}"
  end

  private

  def url
    raise NotImplementedError
  end

  def header
    raise NotImplementedError
  end

  def body
    raise NotImplementedError
  end
end
