namespace :make_companies do
  desc "Get all Shenzhen (Chinese) companies into database"
  task :shenzhen => :environment do

    # Open XLSX files with all information of ShenZhen companies
    xls = Roo::Spreadsheet.open('http://dimsumcloud.s3.amazonaws.com/sz.xlsx')
    success_count = 0
    failure_count = 0

    # Skip first row because it's headings
    (2..xls.count).each do |i|
      # Exchanges are defined at config/exchanges.yml
      new_company = Exchange.find_by_symbol("SZ").chinese_companies.new

      row = xls.row(i)

      # basic identification information
      new_company.symbol = row[0]

      # name
      new_company.call_name = row[1]
      new_company.chinese_name = row[2]
      new_company.english_name = row[3]

      # location
      new_company.address = row[4]
      new_company.country = "中国"
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

  # TODO
  # SHANGHAI
  desc "Get all Shanghai (Chinese) companies into database"
  task :shanghai => :environment do
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
end