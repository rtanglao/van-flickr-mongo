require 'rubygems'
require 'pp'
require 'nestful'

def getFlickrResponse(url, params)
  url = "api.flickr.com/" + url
  retried = false
  begin
    return Nestful.get url, :format => :json, :params => params
  rescue Nestful::ServerError
    if !retried
      retried = true
      retry
    end
  end
end
