namespace :google_finance do
  desc "Google Finance"
  task :chinese_financial_statements => :environment do
    # Looping through all companies
    Company.all.each do |company|
      puts "#{company.name} - started scraping"
      get_all_annual_financial_statements(company)
    end
  end

  def get_all_annual_financial_statements(company)
    require 'open-uri'
    require 'nokogiri'

    # Retrieving all financial statements
    url = "http://www.google.com/finance?q=SHE:#{company.symbol}&fstype=ii"
    document = open(url).read
    html_doc = Nokogiri::HTML(document)

    # Retrieving all annual income statements
    date_format = "div.id-incannualdiv > table.gf-table.rgt > thead > tr > th"
    dates = html_doc.css(date_format)

    if dates.count < 2
      puts "#{company.name} - no data <<<<<<<<<<<<<<<<<<<"
      puts ">>>"
      return
    else
      currency = dates[0].text
      currency = "RMB"
      year_count = dates.count - 1
    end

    formats = []
    (2..year_count).each do |i|
      formats << "div.id-incannualdiv > table.gf-table.rgt > tbody > tr > td:nth-child(#{i}).r"
    end
    formats << "div.id-incannualdiv > table.gf-table.rgt > tbody > tr > td.r.rm"

    formats.each_with_index do |format, index|
      period = dates[index+1].text.gsub("As of ", "")

      new_record =  company.annual_income_statements.new
      new_record.currency = currency
      new_record.period = period
      data = html_doc.css(format)

      AnnualIncomeStatement.columns[4..88].each_with_index do |column, index|
        new_record["#{column.name}"] = data[index].text.gsub(",","")
      end

      new_record.save
    end

    puts "#{company.name} - finish scraping"
    puts ">>>"
  end
end

# columns_format = "div.id-incannualdiv > table.gf-table.rgt > tbody > tr > td:nth-child(5).r"