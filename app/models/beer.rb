class Beer < ActiveRecord::Base
belongs_to :brewery
has_many :ratings, dependent: :destroy
include RatingAverage

 def ratings_count
  array = ratings.to_a
  array.length
 end

 def to_s
  "#{name}, #{brewery.name}"
 end

end
