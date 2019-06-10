require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
bob = VentureCapitalist.new("bob", 1000000001)
terry = VentureCapitalist.new("terry", 2000000000)
betty = VentureCapitalist.new("betty", 100000)

sunday = Startup.new("Sunday","tina", "sunday.org")
monday = Startup.new("Monday","mandy", "monday.org")
tuesday = Startup.new("Tuesday","fred", "tuesday.org")

fr1 = FundingRound.new(sunday, bob, "Angel", 3000)
fr2 = FundingRound.new(monday, terry, "Seed", 10000)
fr3 = FundingRound.new(tuesday, betty, "Series A", 200)
fr4 = FundingRound.new(monday, betty, "Series B", 200)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line
