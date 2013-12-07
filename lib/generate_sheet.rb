#require 'iconv'
require 'rubygems'
require 'spreadsheet'

class GenerateSheet

  def self.expenses_report(expenses,is_admin=false)
    Spreadsheet.client_encoding = 'UTF-8'
    book = Spreadsheet.open ::Rails.root.to_s + '/public/excel/reporte_gastos_template.xls'
    sheet = book.worksheet 0
    i = 8
    expenses.each do |expense|
      sheet[i,0] = expense.id
      sheet[i,1] = expense.date.year unless expense.date.nil?
      sheet[i,2] = expense.date.month unless expense.date.nil?
      sheet[i,3] = expense.date
      sheet[i,4] = expense.refund.deposit_date unless expense.refund.nil?
      sheet[i,5] = expense.location
      sheet[i,6] = expense.expense_category.name unless expense.expense_category.nil?
      sheet[i,7] = expense.expense_type.name unless expense.expense_type.nil?
      sheet[i,8] = expense.subtotal
      sheet[i,9] = expense.iva
      sheet[i,10] = expense.total
      sheet[i,11] = expense.usd_aop
      sheet[i,12] = expense.invoiced ? "Si":"No"
      sheet[i,13] = expense.invoice_paid
      sheet[i,14] = expense.refund.code unless expense.refund.nil?
      if is_admin
        sheet[i,15] = expense.user.fullname
      end
      sheet[i,16] = expense.expense_invoice
      i = i + 1
    end
    book.write ::Rails.root.to_s + '/public/excel/reporte_de_gastos.xls'
  end
end
