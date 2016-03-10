class Profile < ActiveRecord::Base
  belongs_to :user

  validate :name_presence
  validate :gender_validation
  validate :no_boys_named_sue


  def name_presence
    if first_name==nil && last_name==nil
        errors.add(:message, "either first or last name required")
    end
  end

  def gender_validation
    unless gender=="male" || gender=="female"
        errors.add(:gender, "must be 'male' or 'female'.")
    end
  end

  def no_boys_named_sue
    if gender=="male" && first_name=="Sue"
        errors.add(:first_name, "boys can't be named Sue.")
    end
  end

  def self.get_all_profiles(min, max)
    Profile.where("birth_year BETWEEN ? AND ?", min, max).order(birth_year: :asc)      
  end



end
