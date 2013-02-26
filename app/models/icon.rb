class Icon < ActiveRecord::Base
  attr_accessible :name, :value

  has_many :windows
  has_many :window_items

  validates :name, :presence => true, :uniqueness => true, :length => {:maximum => 32}
  validates :value, :presence => true

end
