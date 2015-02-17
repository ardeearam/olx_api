require "olx_api/version"
require "rest_client"
require "nokogiri"

class OlxApi

    
  def initialize(username, password)
      
    #Obtain Uniqe Form Token  
    login_page = Nokogiri::HTML(RestClient.get(api_endpoint(:login)))
    scripts =  login_page.css("form#login script")
    matches = (scripts.to_s.match(/value="(.*)"/))
    _uniqueFormToken = matches[1]
    
    puts _uniqueFormToken
  end
  
  def api_endpoint(action)
      
      url = "http://www.olx.ph/index.php"
      endpoints = {
        login: "/login"
      }      

      "#{url}#{endpoints[action.to_sym]}"
  end
  
end
