require 'sinatra'
require 'sinatra/contrib/all'
require 'pry'

get '/' do
  @operator = params[:operator]  
  if @operator
    @first = params[:first].to_f
    @second = params[:second].to_f
    
    @result = case @operator
    when '+' then @first + @second
    when '-' then @first - @second
    when '*' then @first * @second
    when '/' then @first / @second
    end
  end
  erb :home
end

get '/power' do
  @first = params[:first].to_f
  @second = params[:second].to_f
  @result_power = @first**@second
  erb :power
end

get '/sqrt' do
  @first = params[:first].to_f
  if @first >= 0
    @result_sqrt = Math.sqrt(@first)
  else 
    @result_sqrt = "Undefined"
  end
  erb :sqrt
end