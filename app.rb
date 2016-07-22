#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	@error='Something wrong'
	erb :about
end

get '/visit' do
	erb :visit
end

get '/contacts' do
	erb :contacts
end

post '/visit' do
	@name=params[:username]
	@phone=params[:phone]
	@datetime=params[:datetime]
	@hairdresser=params[:hairdresser]
	@color=params[:color]

	if @name==''
		@error='Введите имя'
		return erb :visit
	end

	f=File.open './public/users.txt', 'a'
	f.write "User: #{@name}, Phone: #{@phone}, Datetime: #{@datetime}, Hairdresser: #{@hairdresser}, Color: #{@color}\n"
	f.close

	erb :thanks
end

post '/contacts' do
	@email=params[:email]
	@message=params[:message]

	f1=File.open './public/contacts.txt', 'a'
	f1.write "Email: #{@email}, Message: #{@message}\n"
	f1.close

	erb :thanks
end