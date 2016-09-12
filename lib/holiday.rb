require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash.each do |season,data|
    if season == :summer
      data.each do |holiday, supplies|
        return supplies[1] if holiday == :fourth_of_july
      end
    end
  end
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash.each do |season,data|
    if season == :winter
      data.each do |holiday,supplies|
        supplies << supply
      end
    end
  end
  holiday_hash
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash.each do |season,data|
    if season == :spring
      data.each do |holiday,supplies|
        supplies << supply
      end
    end
  end
  holiday_hash

end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash.each do |seasons,data|
    if seasons == season
      data[holiday_name] = supply_array
    end
  end
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  winter_supplies = nil
  holiday_hash.each do |seasons,data|
    if seasons == :winter
      winter_supplies = data.values.flatten
    end
  end
  winter_supplies

end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |seasons,data|
    puts "#{seasons.to_s.capitalize}:"
    data.each do |holidays, supplies|
      values_str = supplies.join(", ")
      name_array = holidays.to_s.split("_")
      name_array = name_array.collect{|word| word.capitalize!}
      name_str = name_array.join(" ")
      puts "  #{name_str}: #{values_str}"
    end
  end


end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  holiday_hash.flat_map do |seasons,data|
    data.select{|holidays, supplies| supplies.include?("BBQ")}.keys
  end
end
