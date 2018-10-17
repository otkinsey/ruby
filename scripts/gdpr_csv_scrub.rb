require 'CSV'
require 'fileutils'


def scrub_csv(cols=[], csv_file)
  csv = CSV.read(csv_file, headers:true)
  csv_new = CSV.open("new.csv","wb+")

  CSV.open("new.csv","a+") do |c|
    csv_new << csv.headers
    csv.each do |row|
      cols.each {|col| row[col]='xxxxxxxxx'}
    end
    csv.each {|r| csv_new << r }
  end

end


test = scrub_csv(["policyID","county","hu_site_limit"], "FL_insurance_reduced.csv")
