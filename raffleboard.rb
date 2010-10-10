require 'rubygems'
require 'sinatra'
require 'haml'
require 'parseexcel'

def extract_names
  workbook = Spreadsheet::ParseExcel.parse('public/invitations.xls')
  sheet = workbook.worksheet(0)
  i=1
  names = []
  sheet.each do
    name = sheet.cell(i,3).to_s('UTF8').split(' ').map {|w| w.capitalize }.join(' ')
    status = sheet.cell(i,4).to_s('UTF8')

    names << name if status == "Pago"
    i += 1
  end
  names
end

set :names, extract_names

get '/' do
  haml :index
end

get "/sortear" do
  names = options.names
  indice = rand(names.length)
  winner = "#{names[indice]}"
  options.names.delete_at(indice)

  winner
end

