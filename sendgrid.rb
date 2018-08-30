require 'sendgrid-ruby'
include SendGrid

from = Email.new(email: 'bryan.king@nycda.com')
to = Email.new(email: 'briantrommater@gmail.com')
subject = 'Re: Python Prank Emporium'
content = Content.new(type: 'text/plain', value: 'Great Work Guys! Thanks for teaching me about Python!')
mail = Mail.new(from, subject, to, content)

sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
response = sg.client.mail._('send').post(request_body: mail.to_json)
puts response.status_code
puts response.body
puts response.parsed_body
puts response.headers

