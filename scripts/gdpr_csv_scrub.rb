require 'CSV'
require 'fileutils'


def scrub_csv(, csv_files=[])
  # csv = CSV.read(csv_file, headers:true)
  # csv_new = CSV.open("new.csv","wb+")

  # create a hash of csv files associated with a letter
  indicies =(1..(csv_files.length)).to_a
  files_hash=Hash[indicies.zip csv_files]
  iterator = 0

  #create a csv object for each item in csv_files
  files_hash.each do |k,v|
    k = CSV.read("#{v}", headers:true)
    CSV.open("#{v}_sanitized","a+") do |c|
      c << k.headers
      puts "iterator is #{iterator.to_s}"
      k.each do |row|
        cols[iterator].each {|col| row[col]='xxxxxxxxx'}
        c << row
      end
      iterator += 1
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


test = scrub_csv([["firstname","lastname","address","city","zipcode","phone"],["sender","recipient","email"],["emails"]], ["spree_addresses.csv","spree_e_gifts.csv","spree_orders.csv"])
