class MainData < ActiveRecord::Base

  def self.rate(date)
    rate = MainData.where("date = ?", date.to_date.strftime('%F')).first
    rate.course
  end
end
