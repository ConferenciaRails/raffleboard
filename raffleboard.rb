require 'rubygems'
require 'sinatra'
require 'haml'
require 'parseexcel'

get '/' do
  @prizes = []
  Dir.glob 'public/images/sponsors/*' do |filename|
    filename = filename.split('/').last
    @prizes << {:filename => filename,
                :name => filename.split('.').first.gsub('_', ' ') }
  end
  @prize_options = @prizes.map do |prize|
    "<option value=\"#{prize[:filename]}\">#{prize[:name]}</option>"
  end

  haml :index
end


get "/sortear" do
  names = options.names
  indice = rand(names.length)
  winner = "#{names[indice]}"
  options.names.delete_at(indice)

  winner
end

