class Brewery < ActiveRecord::Base
 has_many :beers, dependent: :destroy
 has_many :ratings, through: :beers
 validates :name, presence: true
 validates :year, numericality: { greater_than_or_equal_to: 1042, only_integer: true }
 validate :current_year
 include RatingAverage

 def print_report
  puts self.name
  puts "established at year #{self.year}"
  puts "number of beers #{self.beers.count}"
 end

 def current_year
  if year > Date.today.year
   errors.add(:year, "can't be in the future")
  end
 end

 def restart
  self.year = 2015
  puts "changed year to #{year}"
 end

 def to_s
  name
 end

end
