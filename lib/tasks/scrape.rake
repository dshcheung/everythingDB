namespace :scrape do
  desc "Google Finance"
  task :google => :environment do
    Company.all.each do |company|
      puts "#{company.name} - started scraping"
      get_annual_income_statements(company)
    end
  end

  def get_annual_income_statements(company)
    require 'open-uri'
    require 'nokogiri'

    url = "https://www.google.com.hk/finance?q=SHE:#{company.symbol}&fstype=ii"
    document = open(url).read
    html_doc = Nokogiri::HTML(document)

    date_format = "div.id-incannualdiv > table.gf-table.rgt > thead > tr > th"
    dates = html_doc.css(date_format)

    if not dates.any?
      puts "#{company.name} - no data <<<<<<<<<<<<<<<<<<<"
      puts ">>>"
      return
    else
      currency = dates[0]
      year_count = dates.count - 1
    end

    formats = []
    (2..year_count).each do |i|
      formats << "div.id-incannualdiv > table.gf-table.rgt > tbody > tr > td:nth-child(#{i}).r"
    end
    formats << "div.id-incannualdiv > table.gf-table.rgt > tbody > tr > td.r.rm"

    formats.each_with_index do |format, index|
      period = dates[index+1]
      # puts html_doc.css(format)
    end

    puts "#{company.name} - finish scraping"
    puts ">>>"
  end
end

# columns_format = "div.id-incannualdiv > table.gf-table.rgt > tbody > tr > td:nth-child(5).r"