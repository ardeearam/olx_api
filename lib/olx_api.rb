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

    if (/\(\d+\) Member Page - Philippines - OLX\.ph/ =~ @browser.title) 
        @logged_in =  true
 
        #Click here if your browser does not automatically redirect you to the next page        
        @browser.links.first.when_present.click
        
        user_id = @browser.link(class:"accountUserName").text.strip
        user_id = user_id[0..user_id.length - 3]
        #user_id = ""
        
    else
        @logged_in = false
    end
    
     puts({logged_in: @logged_in, user_id: user_id}.to_json)
  end
  
  def active_ads
      @browser.goto(api_endpoint(:active_ads))
      @browser.tds(class: "aditemtitle").each do |td|
        title_link = td.link(class: "listingAdTitle")
        puts "TITLE:" + title_link.text
        puts "URL:" + title_link.href
        
        price = td.span(class: "adPrice").text
        puts "PRICE:" + price
        
      end
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
