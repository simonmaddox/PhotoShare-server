require 'rubygems'
require 'sinatra'
require 'actionmailer'

get '/' do
  "Hello"
end

post '/send/:to' do
  raw = request.env["rack.input"].read
  
  ActionMailer::Base.smtp_settings = {
    :address        => "smtp.sendgrid.net",
    :port           => "25",
    :authentication => :plain,
    :user_name      => "simon@simonmaddox.com",
    :password       => "mx463yp",
    #:domain         => ENV['SENDGRID_DOMAIN'],
  }
  
end