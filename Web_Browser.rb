require 'socket'
require 'json'
 
params = Hash.new { |hash, key| hash[key] = Hash.new }  
host = 'localhost'     # The web server
port = 3000                           # Default HTTP port
             


# input validation: require GET or POST
#input = ''
#until input == 'GET' || input == 'POST'
#  print 'What type of request do you want to submit [GET, POST]? '
#  input = gets.chomp
#  input.upcase!
#end

input = 'POST'

if input == "POST"
  name  = "Paul"
  email = "Paul@mail.com"
  path = "./thanks.html"   
  params [:person][:name] = name 
  params [:person][:email] = email 
  body = params.to_json
  request =  "POST /thanks.html HTTP/1.0\r\nContent-Length: #{params.to_json.length}\r\n\r\n#{body}"  
else 
  path = "./index.html"  
  request = "GET #{path} HTTP/1.0\r\n\r\n" 
end




socket = TCPSocket.open(host,port)  # Connect to server
socket.print(request)               # Send request
#response = socket.read              # Read complete response
# Split response at first blank line into headers and body
#headers,body = response.split("\r\n\r\n", 2) 
#print headers
#print body                          # And display it
socket.close