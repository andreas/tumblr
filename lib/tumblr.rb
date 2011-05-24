require 'rubygems' 
gem 'httparty', "<= 4.3"
gem 'httparty-icebox'
require 'httparty'
require 'httparty-icebox'

require 'tumblr/user'
require 'tumblr/request'
require 'tumblr/post'

class Tumblr    
  class << self
    attr_reader :blog
    
    def blog=(_blog)
      @blog = (_blog =~ /\./) ? _blog : "#{_blog}.tumblr.com"
    end

    def cache(*args)
      Request.send(:include, HTTParty::Icebox)
      Request.cache(*args)
    end
  end
  
  # tumblr errors
  class TumblrError < StandardError; end
  # tumblr 403 errors
  class Forbidden   < TumblrError; end
  # tumblr 400 errors
  class BadRequest  < TumblrError; end  
  # tumblr 404 errors
  class NotFound    < TumblrError; end
  
end
