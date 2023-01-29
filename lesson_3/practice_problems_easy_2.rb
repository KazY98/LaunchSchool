# Question 1

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
p ages.any?("Spot")
p ages.include?("Spot")
p ages.key?("Spot") 


# Question 2

munsters_description = "The Munsters are creepy in a good way."
puts munsters_description.swapcase 
puts munsters_description.capitalize
puts munsters_description.downcase
puts munsters_description.upcase


# Question 3

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }

p ages.merge!(additional_ages)


# Question 4

advice = "Few things in life are as important as house training your pet dinosaur."
p advice.include?('Dino')
p advice.match?('Dino')


# Question 5

