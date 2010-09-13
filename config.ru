require 'raffleboard'



configure :development, :production do

  def extract_names
    workbook = Spreadsheet::ParseExcel.parse('public/people.xls')
    sheet = workbook.worksheet(0)
    i=1
    names = []
    sheet.each do
      names << sheet.cell(i,3).to_s('UTF8')
      i += 1
    end
    names
  end

  set :names, extract_names

end


run Sinatra::Application

