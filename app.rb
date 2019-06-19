require_relative 'config/environment'

class App < Sinatra::Base
  
  get '/reversename/:name' do
    params[:name].reverse
  end
  
  get '/square/:number' do
    (params[:number].to_i * params[:number].to_i).to_s
  end
  
  get '/say/:number/:phrase' do
    (1..params[:number].to_i).map { params[:phrase] }.join
  end
  
  get '/say/:word1/:word2/:word3/:word4/:word5' do
    "#{params[:word1]} #{params[:word2]} #{params[:word3]} #{params[:word4]} #{params[:word5]}."
  end
  
  get '/:operation/:number1/:number2' do
    operators = {
      "add" => "+",
      "subtract" => "-",
      "multiply" => "*",
      "divide" => "/"
    }
    
    eval("#{params[:number1]}#{operators[params[:operation]]}#{params[:number2]}").to_s
  end

end