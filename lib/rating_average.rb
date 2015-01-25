module RatingAverage

 def average_rating
  sum = 0
  array = self.ratings.to_a
  array.each{|rating| sum += rating.score}
  (sum/(array.length.to_f)).round(1)
 end

end
