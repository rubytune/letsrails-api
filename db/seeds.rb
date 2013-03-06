# encoding: UTF-8

# Ripped from migration file
spain = Country.create(name: 'España', language: 'es', code: 'ES')
ar = Country.create(name: 'Argentina', language: 'ar', code: 'AR')
italy = Country.create(name: 'Italia', language: 'it', code: 'IT')
pt = Country.create(name: 'Portugal', language: 'pt', code: 'PT')
cl = Country.create(name: 'Chile', language: 'cl', code: 'CL')

cl.cities.create(name: 'Santiago', slug: 'santiago', time_zone: 'Pacific')
cl.cities.create(name: 'Copiapó', slug: 'copiapo', time_zone: 'Pacific')

pt.cities.create(name: 'Lisboa', slug: 'lisboa', time_zone: 'Pacific')
pt.cities.create(name: 'Porto', slug: 'porto', time_zone: 'Pacific')

barcelona = City.find_or_create_by_slug!("barcelona", :country => spain, :name => "Barcelona", :time_zone => "Europe/Madrid")
madrid = spain.cities.create(name: 'Madrid', slug: 'madrid', time_zone: 'Pacific')

rome = italy.cities.create(name: 'Roma', slug: 'roma', time_zone: 'Pacific')
cl.cities.create(name: 'Milano', slug: 'milano', time_zone: 'Pacific')

ar.cities.create(name: 'Buenos Aires Centro', slug: 'buenos-aires-centro', time_zone: 'Pacific')
ar.cities.create(name: 'Chaco', slug: 'chaco', time_zone: 'Pacific')

paul = Person.create!(:first_name => "Paul", :last_name => "Barry", :email => "paul.barry@livingsocial.com", :password => "password", :password_confirmation => "password")
paul.credit_cards.create!(:number => "4111 1111 1111 1111", :cardholder_name => "Paul Barry", :expiration_month => "02", :expiration_year => "15")

puts "\nScraping letsbonus.com to get the current deals, this may take a few minutes...\n\n"
require 'open-uri'

def get_html(url)
  puts "GET #{url}"
  Nokogiri::HTML(open(url))
end

def get_deal(deal_id)
  url = "http://api.letsbonus.com/iphone/offers/idCity/1/idOffer/#{deal_id}/"
  puts "GET #{url}"
  resp = HTTParty.get(url)
  JSON.parse(resp.body)["body"]
end

doc = get_html "http://es.letsbonus.com/ocio/barcelona"
doc.css(".listOffers article").each do |a|
  deal = barcelona.deals.build
  deal.short_title = a.at_css('section h3').text
  deal.deal_images.build(:url => a.at_css('figure a img')['src'])

  deal_url = a.at_css('figure a')['href']
  deal_id = deal_url.split('-').last.to_i
  details = get_html(deal_url)
  deal.long_title = details.at_css('article header h1').text
  deal.description = details.at_css('#tab3 div').text

  # Get images from the deal page
  details.css('.detailImages figure img').each do |img|
    deal.deal_images.build(:url => img['src'])
  end

  # Use API to get other details
  if data = get_deal(deal_id)
    deal.offer_starts_at = Time.at(data["startEpoch"].to_i)
    deal.offer_ends_at = Time.at(data["endEpoch"].to_i)
    data["variations"].each do |v|
      deal.options.build(
        :title => v["name"],
        :price => v["priceWithCurrency"].to_i,
        :value => v["valueWithCurrency"].to_i)
    end
    deal.save!
    puts "Created #{deal.inspect}"
  else
    puts "Could not get data from API about offer #{deal_id}"
  end

end

paul.purchases.create!(:option => Option.first, :credit_card => paul.credit_cards.first, :quantity => 2)
