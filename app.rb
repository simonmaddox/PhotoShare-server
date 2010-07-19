require 'rubygems'
require 'sinatra'
require 'pony'

SMTP_OPTIONS = {
    :address        => "smtp.sendgrid.net",
    :port           => "25",
    :authentication => :plain,
    :user_name      => ENV['SENDGRID_USERNAME'],
    :password       => ENV['SENDGRID_PASSWORD'],
    :domain         => ENV['SENDGRID_DOMAIN'],
}

get '/' do
  "Hello"
end

get '/send' do
  #raw = request.env["rack.input"].read

  Pony.mail(:to => 'simon@simonmaddox.com', :from => 'simon@simonmaddox.com', :subject => 'hi', :body => 'Hello there.',
  :via => :smtp, :via_options => SMTP_OPTIONS
  )
  
end