require 'sinatra'
require 'sendgrid-ruby'
include SendGrid

get '/' do
    erb :home
end

get '/home' do
    erb :home
end

get '/wedding' do
    erb :wedding
end

get '/layout' do
    erb :layout
end

get '/contact' do
    erb :contact
end

get '/tour' do
    erb :tour
end

get '/beginners' do
    erb :beginners
end

get '/advanced' do
    erb :advanced
end

post '/contact' do
    puts "my params are" + params.inspect
    @name = params[:name]
    @subject = params[:subject]
    
    from = Email.new(email: 'briantrommater@gmail.com')
    to = Email.new(email: 'briantrommater@gmail.com')
    subject = 'Thanks for teaching me about Python!'
    content = Content.new(type: 'text/plain', value: @subject)
    mail = Mail.new(from, subject, to, content)
    
    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code

    erb :contact
end
