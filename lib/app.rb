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
	$report_file.puts headings(:report_heading) # Print "Sales Report" in ascii art
	$report_file.puts todays_date # Print today's date
	$report_file.puts print_divider
	$report_file.puts headings(:products_heading) # Print "Products" in ascii art
	product_info
	$report_file.puts print_divider
	$report_file.puts headings(:brands_heading) # Print "Brands" in ascii art
	brand_info
	$report_file.puts print_divider
	$report_file.puts " "
	$report_file.puts print_divider
	$report_file.puts "Grand Total Sales:"
	$report_file.puts print_divider
	sales_volume
end

def todays_date
	Time.now.strftime("%n %m/%d/%Y")
end

def print_divider
	"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
end

def heading_report
	$report_file.puts " "
	$report_file.puts "  __                         __                         "
	$report_file.puts " /         /                /  |                     /  "
	$report_file.puts "(___  ___ (  ___  ___      (___| ___  ___  ___  ___ (___"
	$report_file.puts "    )|   )| |___)|___      | |  |___)|   )|   )|   )|   "
	$report_file.puts " __/ |__/|| |__   __/      |  | |__  |__/ |__/ |    |__ "
	$report_file.puts "                                     |                  "
	$report_file.puts " "
end

def heading_products
	$report_file.puts "                     _            _       "
	$report_file.puts "                    | |          | |      "
	$report_file.puts " _ __  _ __ ___   __| |_   _  ___| |_ ___ "
	$report_file.puts "| '_ \\| '__/ _ \\ / _` | | | |/ __| __/ __|"
	$report_file.puts "| |_) | | | (_) | (_| | |_| | (__| |_\\__ \\"
	$report_file.puts "| .__/|_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/"
	$report_file.puts "| |                                       "
	$report_file.puts "|_|                                       "
end


def heading_brands
	$report_file.puts " _                         _     "
	$report_file.puts "| |                       | |    "
	$report_file.puts "| |__  _ __ __ _ _ __   __| |___ "
	$report_file.puts "| '_ \\| '__/ _` | '_ \\ / _` / __|"
	$report_file.puts "| |_) | | | (_| | | | | (_| \\__ \\"
	$report_file.puts "|_.__/|_|  \\__,_|_| |_|\\__,_|___/"
	$report_file.puts
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
	$products_hash["items"].each do |toy|
		$report_file.puts print_divider
		$report_file.puts "Product Name: #{toy["title"]}" 	# Print the name of the toy
		$report_file.puts print_divider
		$report_file.puts "Retail Price: #{toy["full-price"]}" 	# Print the retail price of the toy
		$report_file.puts "Total Purchases: #{toy["purchases"].length}" # Calculate and print the total number of purchases
			sales_total = 0.0
			toy["purchases"].each do |sales|
				sales_total += sales["price"].to_f
			end
		$report_file.puts "Total Sales: $#{sales_total}" # Calculate and print the total amount of sales
		sales_average = sales_total / toy["purchases"].length
		$report_file.puts "Average Price Paid: $#{sales_average}" # Calculate and print the average price the toy sold for
		avg_discount = toy["full-price"].to_f - sales_average.to_f
		average_discount = sprintf("%.2f", avg_discount)
		$report_file.puts "Average Discount: $#{average_discount}" # Calculate and print the average discount (% or $) based off the average sales price
	end
end

def brand_info
	unique_brands = $products_hash["items"].map { |item| item["brand"] }.uniq
		unique_brands.each do |brand|
			$report_file.puts print_divider
			$report_file.puts "Brand Name: #{brand}" # Print the name of the brand
			$report_file.puts print_divider
		brand_stock = 0
		brand_sales = 0
		brand_purchases = 0
		brand_names = $products_hash["items"].select { |item| item["brand"] == brand }
			brand_names.each { |toy| brand_stock += toy["stock"].to_i }
				$report_file.puts "Stock on Hand: #{brand_stock}" # Count and print the number of the brand's toys we stock
			brand_names.each { |item| brand_purchases += item["purchases"].length.to_i }
			brand_names.each { |item| item["purchases"].each { |avg| brand_sales += avg["price"].to_f } }
				brand_avg_price = (brand_sales / brand_purchases)
					$report_file.puts "Average Brand Price: $#{brand_avg_price.round(2)}" # Calculate and print the average price of the brand's toys
		end
	end

	def sales_volume
		grand_total = 0
		$products_hash["items"].each do |toy|
			toy["purchases"].each do |grandtotal|
				grand_total += grandtotal["price"].to_f
			end
		end
		$report_file.puts grand_total # Calculate and print the total sales volume of all the brand's toys combined
	end

start
