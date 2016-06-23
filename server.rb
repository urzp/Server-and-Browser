require 'socket'               # Get sockets from stdlib

server = TCPServer.new('localhost', 2000)  # Socket to listen on port 2000
loop do                         # Servers run forever
  socket = server.accept     # Wait for a client to connect
  request = socket.gets
  STDERR.puts request
  
  response = "Hello World!\n"
  
  socket.print "HTTP/1.1 200 OK\r\n" +
               "Content-Type: text/plain\r\n" +
               "Content-Length: #{response.bytesize}\r\n" +
               "Connection: close\r\n"
  socket.print "\r\n"
  socket.print response
  socket.close
end