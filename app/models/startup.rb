class Startup
  attr_accessor :name

    attr_reader :founder, :domain

    @@all = []

    def initialize(name, founder, domain)
      @name = name
      @founder = founder
      @domain = domain
      @@all << self
    end

    def pivot(domain, name)
      @domain = domain
      @name = name
    end
    #similar to initialize, method to override first initiation.

    def self.all
      @@all
    end

    def self.find_by_founder(founder)
      Startup.all.detect {|startup| startup.founder == founder}
    end
    #first only returns the first element, use detect instead to return the first true.

    def self.domains
      Startup.all.map {|startup| startup.domain }
      end
  #map will return the same length array as what you start with. select will only return things which are true.


    def sign_contract(venture_capitalist, type, investment)
      FundingRound.new(self, venture_capitalist, type, investment)
    end
  #creates a new funding round and associates it with that startup and venture capitalist
  #s1.sign_contract(vc, angel, 100) to pass method in pry

    def funding_rounds
      FundingRound.all.select {|fr| fr.startup == self }
    end

    def num_funding_rounds
      funding_rounds.count
    end

    def total_funds
      funding_rounds.sum(&:investment)
    end

    def investors
      funding_rounds.map {|fr| fr.venture_capitalist }.uniq
    end

    def big_investors
      investors.select {|vc| VentureCapitalist.tres_commas_club.include?(vc) }
    end
    #iterating through investors ass with startup ... include? to see if current vc is included
    #another approach test if vc's total worth is above club requirement.

  end
