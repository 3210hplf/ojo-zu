module PostHelper

  def created_age_month(birthday, created_date)
    return "制作日か誕生日がおかしいかも" unless birthday.is_a?(Date) && created_date.is_a?(Date)

    age = created_date.year - birthday.year
    month_diff = created_date.month - birthday.month
    day_diff = created_date.day - birthday.day
    month_diff -= 1 if day_diff < 0
    if month_diff < 0
      age -= 1
      month_diff += 12
    end

    "#{age}歳 #{month_diff}ヶ月"
  end
end
