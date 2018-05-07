require 'pry'

def get_first_name_of_season_winner(data, season)
  data.each do |season_name, array_data|
    if season_name.to_s == season
      array_data.each {|key, value| return key["name"].split(" ")[0].to_s if key["status"] == "Winner"}
    end
  end
end

def get_contestant_name(data, occupation)
  data.values.flatten.each {|hash_contestant|return hash_contestant["name"] if hash_contestant["occupation"] == occupation}
end

def count_contestants_by_hometown(data, hometown)
counter_contestant_meet_criteria = 0
  data.values.flatten.each {|hash_contestant| counter_contestant_meet_criteria += 1 if hash_contestant["hometown"] == hometown }
counter_contestant_meet_criteria
end

def get_occupation(data, hometown)
  data.values.flatten.each {|hash_contestant| return hash_contestant["occupation"] if hash_contestant["hometown"] == hometown}
end

def get_average_age_for_season(data, season)
age_average_array = [0, 0]
  data.each do |season_name, array_data|
    if season_name.to_s == season
      array_data.each do |key, value|
        age_average_array[0] += key["age"].to_f
        age_average_array[1] += 1
      end
    end
  end
average = age_average_array[0]/age_average_array[1]
average.round
#binding.pry
end
