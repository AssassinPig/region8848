#encoding: UTF-8
require 'open-uri'
require 'httpclient'

httpclient = HTTPClient.new
resp = httpclient.get(url)
puts resp
