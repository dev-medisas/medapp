class Patient < ActiveRecord::Base
  has_many :stats

  def descriptor
    "#{name}(#{mrn})"
  end
end
