class Reward < ApplicationRecord
  has_and_belongs_to_many :accounts

  def self.search(area, date)
    return Reward.all unless area.present? || date.present?
    if area && date.blank?
      where('area = ?', "#{area}")
    elsif date && area.blank?
      where('date = ?', "#{date}")
    else
      where(['area = ? AND date = ?', "#{area}", "#{date}"])
    end
  end

end
