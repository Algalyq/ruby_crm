
class HttpEndpoints::System < Grape::API
    format :txt
  
    helpers do
      LOGGER = HttpEndpoints::System.logger
    end
  
    get :health do
      check_db_connection
  
      status 200
    rescue StandardError => e
      LOGGER.info(e)
      LOGGER.info(e.message)
      LOGGER.info(e.backtrace)
      status 500
    end
  
    get :version do
      1
    end
  
    get :doc do
      content_type "text/html; charset=utf-8"
      env["api.format"] = :binary
  
      File.read("./srv/endpoints/http_endpoints/doc.html")
    end
  
    get :doc_json do
      content_type "application/json"
      env["api.format"] = :txt
  
      File.read("./srv/endpoints/http_endpoints/doc.json")
    end
  end
  