require 'CSV'
require 'fileutils'


def scrub_csv(cols=[], csv_files=[])
  # csv = CSV.read(csv_file, headers:true)
  # csv_new = CSV.open("new.csv","wb+")

  # create a hash of csv files associated with a letter
  i=(1..(csv_files.length)).to_a
  fh=Hash[i.zip csv_files]
  fh.map {|k,v| fh[k]="#{v}" }
  # puts i.length

  #create a csv object for each item in csv_files
  fh.each do |k,v|
    v=CSV.read(v, headers:true)
    puts "line 18: #{v}"
    CSV.open("#{v}_sanitized","a+") do |c|
      v << v.headers
      csv.each do |row|
        cols.each {|col| row[col]='xxxxxxxxx'}
      end
      csv.each {|r| csv_new << r }
    end
  end

  #create a sanitized file for each item in fh hash



  # CSV.open("new.csv","a+") do |c|
  #   csv_new << csv.headers
  #   csv.each do |row|
  #     cols.each {|col| row[col]='xxxxxxxxx'}
  #   end
  #   csv.each {|r| csv_new << r }
  # end

end


test = scrub_csv(["policyID","county","hu_site_limit"], ["FL_insurance_reduced.csv"])
