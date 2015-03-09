require "olx_api/version"
require "rest_client"
require "nokogiri"
require 'json'
require 'mechanize'
require 'watir'

class OlxApi

  attr_accessor :logged_in
  attr_accessor :browser #testing only
    
  def initialize(username, password)
      
    
    @browser = Watir::Browser.new :phantomjs
    @browser.goto(api_endpoint(:login))
    
    #puts browser.title
    
    @browser.text_field(:name => "username").set username
    @browser.text_field(:name => "password").set password
    @browser.button(:name => "loginSubmit").click
    
    sleep 2

    if @browser.title == "(102) Member Page - Philippines - OLX.ph" 
        @logged_in =  true
 
        #Click here if your browser does not automatically redirect you to the next page        
        @browser.links.first.click
        
        user_id = @browser.link(class:"accountUserName").text
        
        #user_id = user_id[0..user_id.length - 2]
        #user_id = ""
        
    else
        @logged_in = false
    end
    
     puts({logged_in: @logged_in, user_id: user_id}.to_json)
        
  end
  
  def active_ads
      RestClient.get(api_endpoint(:active_ads), {cookies: @cookies})
  end
  
  
  
  def api_endpoint(action)
      
      url = "https://www.olx.ph/index.php"
      endpoints = {
        login: "/login",
        active_ads: "/classifieds+management?event=Member+Dashboard,Member+Menu,Manage+Ads"
      }      

      "#{url}#{endpoints[action.to_sym]}"
  end
  
  def close
     @browser.close 
  end
  
end
