class Stat < ActiveRecord::Base
  default_scope order('noted_at asc')
  belongs_to :patient
  attr_accessible :noted_at_date, :noted_at_time, :temp, :systolic, :diastolic, :heart_rate, :resp_rate
  attr_accessor :noted_at_date, :noted_at_time
  before_validation :set_up_noted_at
  after_initialize :set_up_noted_at_ui

  def set_up_noted_at
    self.noted_at = DateTime.parse("#{self.noted_at_date} #{self.noted_at_time}")
  end

  def set_up_noted_at_ui
    self.noted_at ||= Time.now
    self.noted_at_date = self.noted_at.to_date
    self.noted_at_time = self.noted_at.strftime("%H:%M")
  end
end
