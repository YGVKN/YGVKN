require 'webrick'
class WebServer < WEBrick::HTTPServlet::AbstractServlet
  def do_GET(request, response)
     case request.path
     when "/"
         response.status = 200
         response['Content-Type'] = 'text/plain'
         response.body = 'Hello, World'
     when "/api"
         response.status = 201
         response['Content-Type'] = 'application/json'
         response.body = '{"foo":"bar"}'
     else
         response.status = 404
         response['Content-Type'] = 'text/plain'
         response.body = 'Not Found'
     end
  end
end
#
#
if __FILE__ == $0
  # Запускаем сервер локально на порте 8000
  server = WEBrick::HTTPServer.new :Port => 8000
  server.mount '/', WebServer

  # Останавливаем сервер нажатием Ctrl+C
  trap 'INT' do server.shutdown end

  # Запускаем сервер
  server.start
end
