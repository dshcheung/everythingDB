json.columns do
  json.array! ChineseAnnualIncome.columns[4..87].map!{|x| x.name}
end

json.data do
  json.array! @annual_income_statements do |income_statement|
    json.company_symbol income_statement.chinese_company.symbol
    json.period income_statement.period
    json.currency income_statement.currency


    ChineseAnnualIncome.columns[4..87].each do |column|
      json.set!(column.name, income_statement[column.name])
    end
  end
end