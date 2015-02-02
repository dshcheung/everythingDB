namespace :make_companies do
  desc "Get all Shenzhen (Chinese) companies into database"
  task :shenzhen => :environment do
    add_chinese_companies("http://dimsumcloud.s3.amazonaws.com/sz.xlsx", "SZ", "中国")
  end

  # TODO
  # SHANGHAI
  desc "Get all Shanghai (Chinese) companies into database"
  task :shanghai => :environment do
    require 'nokogiri'
    require 'open-uri'

    # Create new Shanghai companies based on symbols only
    url = "http://biz.sse.com.cn/sseportal/webapp/datapresent/SSEQueryStockInfoInitAct?reportName=BizCompStockInfoRpt&PRODUCTID=&PRODUCTJP=&PRODUCTNAME=&keyword=&CURSOR=1"
    exchange_symbol = "SH"
    loop_through_shanghai_symbols(url, exchange_symbol)

    # Update information for all Shanghai companies
    success_count = 0
    failure_count = 0
    Exchange.find_by_symbol("SH").chinese_companies.each do |company|
      url = "http://biz.sse.com.cn/sseportal/webapp/datapresent/SSEQueryListCmpAct?reportName=QueryListCmpRpt&COMPANY_CODE=#{company.symbol}"
      document = open(url).read
      html_doc = Nokogiri::HTML(document)

      data = html_doc.css("table.content > tr > td:nth-child(2)")

      # # name
      company.call_name = data[4].text.split("/")[0].squish
      company.chinese_name = data[5].text.split("\r\n")[0]
      company.english_name = data[5].text.split("\r\n")[1]

      # # location
      company.address = data[6].text
      company.country = "中国"
      company.province = data[17].text
      # company.city = 
      # company.region = 

      # # A Share Market Information
      company.a_share_symbol = data[1].text.split("/")[0].squish
      # company.a_share_call_name =
      company.a_ipo_date = data[2].text
      # company.a_share_total_issues =
      # company.a_share_current_issues =

      # # B Share Market Information
      company.b_share_symbol = data[1].text.split("/")[1].squish
      # company.b_share_call_name = 
      # company.b_ipo_date = 
      # company.b_share_total_issues = 
      # company.b_share_current_issues = 

      # # industry
      company.industry = data[15].text

      # # webiste
      company.website = data[14].text
      
      if company.save
        puts "Updating #{company.call_name} - Success"
        success_count += 1
      else
        puts "Updating #{company.call_name} - Fail"
        failure_count += 1
      end
    end
  end

  # TODO
  # NYSE
  desc "Get all New York Stock Exchange (American) companies into database"
  task :nyse => :environment do
  end

  # TODO
  # NASDAQ
  desc "Get all NASDAQ (American) companies into database"
  task :nasdaq => :environment do
  end

  # TODO
  # TSX
  desc "Get all Toronto Stock Exchange (Canadian) companies into database"
  task :tsx => :environment do
  end

  def add_chinese_companies(spreadsheet_url, exchange_symbol, country)

    # Open XLSX files with all information of ShenZhen companies
    xls = Roo::Spreadsheet.open(spreadsheet_url)
    success_count = 0
    failure_count = 0

    # Skip first row because it's headings
    (2..xls.count).each do |i|
      # Exchanges are defined at config/exchanges.yml
      new_company = Exchange.find_by_symbol(exchange_symbol).chinese_companies.new

      row = xls.row(i)

      # basic identification information
      new_company.symbol = row[0]

      # name
      new_company.call_name = row[1]
      new_company.chinese_name = row[2]
      new_company.english_name = row[3]

      # location
      new_company.address = row[4]
      new_company.country = country
      new_company.province = row[16]
      new_company.city = row[17]
      new_company.region = row[15]

      # A Share Market Information
      new_company.a_share_symbol = row[5].to_i.to_s
      new_company.a_share_call_name = row[6]
      new_company.a_ipo_date = row[7]
      new_company.a_share_total_issues = row[8]
      new_company.a_share_current_issues = row[9]

      # B Share Market Information
      new_company.b_share_symbol = row[10].to_i.to_s if not row[10].nil?
      new_company.b_share_call_name = row[11]
      new_company.b_ipo_date = row[12]
      new_company.b_share_total_issues = row[13]
      new_company.b_share_current_issues = row[14]

      # industry
      new_company.industry = row[18]

      # webiste
      new_company.website = row[19]

      if new_company.save
        puts "Adding #{new_company.call_name} - Success"
        success_count += 1
      else
        puts "Adding #{new_company.call_name} - Fail"
        failure_count += 1
      end
    end

    puts "#{success_count} successes, #{failure_count} failures"
  end

  def loop_through_shanghai_symbols(url, exchange_symbol)
    document = open(url).read
    html_doc = Nokogiri::HTML(document)

    symbol_format = "td.table3 > a"
    current_symbols = html_doc.css(symbol_format)
    current_symbols.each do |symbol|
      new_company = Exchange.find_by_symbol(exchange_symbol).chinese_companies.new
      new_company.symbol = symbol.text
      if new_company.save
        puts "Adding #{new_company.symbol} - Success"
      else
        puts "Adding #{new_company.symbol} - Fail"
      end
    end

    next_button_format = "td.nextpage > a:contains('下一页')"
    next_button = html_doc.css(next_button_format)

    if next_button.any?
      puts "go to next page"
      url = "http://biz.sse.com.cn#{next_button[0]['href']}"
      loop_through_shanghai_symbols(url, exchange_symbol)
    end
  end
end