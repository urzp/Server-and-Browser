require 'socket'
require 'json'

params = Hash.new { |hash, key| hash[key] = Hash.new } 
host = 'localhost'     # The web server
port = 3000                           # Default HTTP port


name  = "Paul"
email = "Paul@mail.com"
path = "./thanks.html"                 # The file we want  

params[:person][:name] = name
params[:person][:email] = email
body = params.to_json
request = "POST #{path} HTTP/1.0\r\nContent-Length: #{params.to_json.length}\r\n\r\n#{body}"



socket = TCPSocket.open(host,port)  # Connect to server
socket.print(request)               # Send request
socket.close



