json.columns do
  json.array! ChineseAnnualIncome.columns[4..88].map!{|x| x.name}
end

json.data do
  json.array! @annual_income_statements do |income_statement|
    json.company_symbol income_statement.chinese_company.symbol
    json.period income_statement.period
    json.currency income_statement.currency


    ChineseAnnualIncome.columns[4..88].each do |column|
      json.data do
        json.set!(column.name, income_statement[column.name])
      end
    end
  end
end