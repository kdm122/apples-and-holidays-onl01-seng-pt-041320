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
  holiday_supplies[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_supplies[:winter][:christmas] << supply
  holiday_supplies[:winter][:new_years] << supply

end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash.each do |season, data|
    if season == :spring
      data.each do |holiday, data|
        if holiday == :memorial_day
        holiday_supplies[season][holiday] << supply
        end
      end
    end
  end

end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
   holiday_supplies[season][holiday_name] = []
   
  supply_array.each do |supp|
 #   binding.pry
    holiday_supplies[season][holiday_name] << supp
  end
  
  return holiday_supplies

end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  winter_supplies = []
  holiday_hash.each do |season, data|
    if season == :winter
      data.each do |holiday, supp|
        supp.each do |actual|
          winter_supplies << actual
        end
      end
    end
  end
 return winter_supplies
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  
  holiday_hash.each do |season, data|
 #   binding.pry
    puts "#{season.capitalize}:"
   # binding.pry
    data.each do |holiday, data|
      if holiday == :new_years
      #  binding.pry
        holiday = "New Years"
        puts "  #{holiday}: #{data.join(', ')}"
      elsif holiday == :fourth_of_july
      #  binding.pry
        holiday = "Fourth Of July"
        puts "  #{holiday}: #{data.join(', ')}"
        elsif holiday == :memorial_day
      #  binding.pry
        holiday = "Memorial Day"
        puts "  #{holiday}: #{data.join(', ')}"
      else
     # binding.pry
      puts "  #{holiday.capitalize}: #{data.join(', ')}"
     # binding.pry
   end
    end
  end
  

end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  bbq_days = []
  holiday_hash.each do |season, data|
      data.each do |holiday, supp|
        supp.each do |actual|
      #    binding.pry
          if actual.include?("BBQ")
            bbq_days << holiday
          end
          
        end
      end
    end
 return bbq_days
 #return 

end







