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

post '/send/:filename/:to' do
  raw = request.env["rack.input"].read

  Pony.mail(:to => unescape(params[:to]), :from => 'simon@simonmaddox.com', :subject => 'Photo Shared', :body: => "This photo was automatically sent by PhotoShare", :html_body => 'This photo was automatically sent by <a href="#">PhotoShare</a>',
  :attachments => {unescape(params[:filename]), raw},
  :via => :smtp, :via_options => SMTP_OPTIONS
  )
  
end