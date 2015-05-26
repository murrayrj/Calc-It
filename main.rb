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

get '/bmi' do
  @imp_mass = params[:imp_mass].to_f
  @imp_height = params[:imp_height].to_f
  @metric_mass = params[:metric_mass].to_f
  @metric_height = params[:metric_height].to_f
  if params[:imp_mass] && params[:imp_height].empty?
    @metric_result = @metric_mass / (@metric_height**2)
  elsif params[:metric_mass] && params[:metric_height].empty?
    @imp_result = (@imp_mass / (@imp_height**2)) * 703
  end
  erb :bmi
end

get '/mortgage' do
  @principal = params[:principal].to_f
  @interest = params[:interest].to_f / 12 / 100
  @payments = params[:payments].to_f
  int_calc = (1 + @interest)**@payments
  if @principal > 0
    @result_mortgage = ((@principal*@interest*int_calc)/(int_calc - 1))
  end
  erb :mortgage
end