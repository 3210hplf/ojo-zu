module FamilyHelper

    def now_age_month(birthday)
      return "誕生日がおかしいかも" unless birthday.is_a?(Date)
  
      age = Date.today.year - birthday.year
      month_diff = Date.today.month - birthday.month
      day_diff = Date.today.day - birthday.day
      month_diff -= 1 if day_diff < 0
      if month_diff < 0
        age -= 1
        month_diff += 12
      end
  
      "#{age}歳 #{month_diff}ヶ月"
    end
  end