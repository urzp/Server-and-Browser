require 'socket'
require 'json'

server = TCPServer.new('localhost', 3000)

loop do
  socket = server.accept
  request = socket.read_nonblock(256)
  request_header, request_body = request.split("\r\n\r\n", 2) 
  params = JSON.parse(request_body)
  
   puts params
  puts params.class
  
  
  
  socket.close  
end
