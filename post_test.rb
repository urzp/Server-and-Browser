 require 'net/http'
 require 'uri'
 
 url = "http://localhost:3000/thanks.html"
 uri = URI.parse(url)
 http = Net::HTTP.new(uri.host, uri.port)
 request = Net::HTTP::Post.new(uri.request_uri)
 parameters =  {:viking => {:name=>"Erik the Red", :email=>"erikthered@theodinproject.com"} }
 request.set_form_data(parameters)    
 response = http.request(request)
 puts response.body
  http.close
 