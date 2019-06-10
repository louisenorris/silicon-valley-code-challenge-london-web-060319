class VentureCapitalist

  attr_accessor :name, :total_worth

  @@all = []

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    VentureCapitalist.all.select {|venture_capitalist| venture_capitalist.total_worth > 1000000000}
  #dont have to put class down, could just say all.select
  end

  def offer_contract(startup, type, investment)
    FundingRound.new(startup, self, type, investment)
  end

  def funding_rounds
    FundingRound.all.select{|fr| fr.venture_capitalist == self}
  end

  def portfolio
    funding_rounds.select{|fr| fr.startup}.uniq
  end

  def biggest_investment
    funding_rounds.max_by{|fr| fr.investment}
  end
#max_by largest, min_by smallest

  def invested(domain)
    rounds_by_domain = funding_rounds.select{|fr| fr.startup.domain == domain}
    rounds_by_domain.sum(&:investment)
  end
#    iterate thoruhg to find all domains where start up domian matches
#then find total amount invested in that string.

end
