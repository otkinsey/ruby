# TABLES AND FIELDS TO SCRUB
# ---------------------------------------------

# Tables to Sanitize:
# - spree_addresses
#   - firstname
#   - lastname
#   - address
#   - city
#   - zipcode
#   - phone
#
# - spree_credit_cards
#   - last_digits
#   - name
#
# - spree_e_gifts
#   - sender
#   - recipient
#   - email
#
# - spree_orders
#   - emails
#
# - spree_subscribers
#   - email
#   - first_name
#   - last_name
#
# - spree_users
#   - email
#   - login
#   - first_name
#   - last_name
require 'CSV'
require 'fileutils'


def scrub_csv(cols=[], csv_file)
  csv = CSV.read(csv_file, headers:true)
  new_title = csv_file[0..-5]
  csv_new = CSV.open("#{new_title}_sanitized.csv","wb+")

  CSV.open("#{new_title}_sanitized.csv","a+") do |c|
    csv_new << csv.headers
    i=0
    csv.each do |row|
      cols.each {|col| row[col]="xxxxxxxx#{i}"}
      i+=1
    end
    csv.each {|r| csv_new << r }
  end

end


test = scrub_csv(["email","first_name","last_name","login"], "spree_users.csv")
