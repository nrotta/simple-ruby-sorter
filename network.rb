require "net/http"
require "uri"

module Network
  # very naive fetch; no error handling. given an uri string, it perform a get and returns the body of the response.
  def self.fetch(uri_str)
    uri = URI(uri_str)
    response = Net::HTTP.get_response(uri)
    response.body
  end
end