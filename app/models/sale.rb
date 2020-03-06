class Sale < ActiveRecord::Base

  # This creates an active record scope
  def self.active
    where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current).any?
  end

  def finished?
  #Here, "self" is implied
    ends_on < Date.current
  end

  def upcoming?
    starts_on > Date.current
  end

  def active?
    !upcoming? && !finished?
  end

end
