require 'iconv'
require 'rubygems'
require 'spreadsheet'

class GenerateSheet

  def self.expenses_report(expenses)
    Spreadsheet.client_encoding = 'UTF-8'
    book = Spreadsheet.open RAILS_ROOT + '/public/excel/reporte_gastos_template.xls'
    book.write RAILS_ROOT + '/public/excel/reporte_de_gastos_'+ Date.today.gsub(" ", "_") +'.xls'
  end
end
