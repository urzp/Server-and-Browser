require 'socket'

server = TCPServer.new('localhost', 3000)

loop do
  socket = server.accept
  while line = socket.gets 
    puts line.chop 
  end
  
socket.close  
end
