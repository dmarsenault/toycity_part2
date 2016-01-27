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

def create_report
	$report_file.puts todays_date
	$report_file.puts print_divider
	$report_file.puts headings(:report_heading)
end

def todays_date
	Time.now.strftime("%n %m/%d/%Y")
end

def print_divider
	"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
end

def heading_report
	" "
	"  __                         __                         "
	" /         /                /  |                     /  "
	"(___  ___ (  ___  ___      (___| ___  ___  ___  ___ (___"
	"    )|   )| |___)|___      | |  |___)|   )|   )|   )|   "
	" __/ |__/|| |__   __/      |  | |__  |__/ |__/ |    |__ "
	"                                     |                  "
	" "
end

def heading_products
	puts "                     _            _       "
	puts "                    | |          | |      "
	puts " _ __  _ __ ___   __| |_   _  ___| |_ ___ "
	puts "| '_ \\| '__/ _ \\ / _` | | | |/ __| __/ __|"
	puts "| |_) | | | (_) | (_| | |_| | (__| |_\\__ \\"
	puts "| .__/|_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/"
	puts "| |                                       "
	puts "|_|                                       "
end


def heading_brands
	puts " _                         _     "
	puts "| |                       | |    "
	puts "| |__  _ __ __ _ _ __   __| |___ "
	puts "| '_ \\| '__/ _` | '_ \\ / _` / __|"
	puts "| |_) | | | (_| | | | | (_| \\__ \\"
	puts "|_.__/|_|  \\__,_|_| |_|\\__,_|___/"
	puts
end

def headings(heading)
	if heading == :report_heading
		heading_report
	elsif heading == :products_heading
		heading_products
	elsif heading == :brands_heading
		heading_brands
	end
end

def product_info
	products_hash["items"].each do |toy|
		$report_file.puts print_divider
		$report_file.puts "Product Name: #{toy["title"]}"
		$report_file.puts print_divider
		$report_file.puts "Retail Price: #{toy["full-price"]}"
		$report_file.puts "Total Purchases: #{toy["purchases"].length}"
			sales_total = 0.0
			toy["purchases"].each do |sales|
				sales_total += sales["price"].to_f
			end
		$report_file.puts "Total Sales: $#{sales_total}"
		sales_average = sales_total / toy["purchases"].length
		$report_file.puts "Average Price Paid: $#{sales_average}"
		avg_discount = toy["full-price"].to_f - sales_average.to_f
		average_discount = sprintf("%.2f", avg_discount)
		$report_file.puts "Average Discount: $#{average_discount}"
	end
end

start

# Print "Sales Report" in ascii art

# Print today's date

# Print "Products" in ascii art

# For each product in the data set:
	# Print the name of the toy

	# Print the retail price of the toy
	# Calculate and print the total number of purchases
	# Calculate and print the total amount of sales
	# Calculate and print the average price the toy sold for
	# Calculate and print the average discount (% or $) based off the average sales price

# Print "Brands" in ascii art

# For each brand in the data set:
	# Print the name of the brand
	# Count and print the number of the brand's toys we stock
	# Calculate and print the average price of the brand's toys
	# Calculate and print the total sales volume of all the brand's toys combined
