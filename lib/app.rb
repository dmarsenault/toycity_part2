require 'json'

def setup_files
	path = File.join(File.dirname(__FILE__), '../data/products.json')
	file = File.read(path)
	$products_hash = JSON.parse(file)
	$report_file = File.new("report.txt", "w+")
end

def start
	setup_files # load, read, parse, and create the files
	create_report # create the Report
end

def todays_date
	Time.now.strftime("%n %m/%d/%Y")
end

def print_divider
	"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
end

setup_files

#def product_info
	#$products_hash["items"].each do |toy|
		#puts "Product Name: #{toy["title"]}"
		#puts "Retail Price: $#{toy["full-price"]}"
		#puts "Total Purchases: #{toy["purchases"].length}"
	#end
#end

#def header_art(ascii = {})

# Print "Sales Report" in ascii art
puts " "
puts "  __                         __                         "
puts " /         /                /  |                     /  "
puts "(___  ___ (  ___  ___      (___| ___  ___  ___  ___ (___"
puts "    )|   )| |___)|___      | |  |___)|   )|   )|   )|   "
puts " __/ |__/|| |__   __/      |  | |__  |__/ |__/ |    |__ "
puts "                                     |                  "
puts " "

# Print today's date
puts print_divider
puts todays_date
puts print_divider

# Print "Products" in ascii art
puts "                     _            _       "
puts "                    | |          | |      "
puts " _ __  _ __ ___   __| |_   _  ___| |_ ___ "
puts "| '_ \\| '__/ _ \\ / _` | | | |/ __| __/ __|"
puts "| |_) | | | (_) | (_| | |_| | (__| |_\\__ \\"
puts "| .__/|_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/"
puts "| |                                       "
puts "|_|                                       "

# For each product in the data set:
	# Print the name of the toy
product_info
	# Print the retail price of the toy
	# Calculate and print the total number of purchases
	# Calculate and print the total amount of sales
	# Calculate and print the average price the toy sold for
	# Calculate and print the average discount (% or $) based off the average sales price

# Print "Brands" in ascii art
puts " _                         _     "
puts "| |                       | |    "
puts "| |__  _ __ __ _ _ __   __| |___ "
puts "| '_ \\| '__/ _` | '_ \\ / _` / __|"
puts "| |_) | | | (_| | | | | (_| \\__ \\"
puts "|_.__/|_|  \\__,_|_| |_|\\__,_|___/"
puts


# For each brand in the data set:
	# Print the name of the brand
	# Count and print the number of the brand's toys we stock
	# Calculate and print the average price of the brand's toys
	# Calculate and print the total sales volume of all the brand's toys combined
