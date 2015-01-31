class Beer < ActiveRecord::Base
belongs_to :brewery
has_many :ratings, dependent: :destroy
has_many :raters, through: :ratings, source: :user
validates :name, presence: true
include RatingAverage

 def ratings_count
  array = ratings.to_a
  array.length
 end

 def to_s
  "#{name}, #{brewery.name}"
 end

end
