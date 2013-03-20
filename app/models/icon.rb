class Icon < ActiveRecord::Base
  attr_accessible :name, :value

  has_many :windows, :dependent => :nullify
  has_many :window_items, :dependent => :nullify

  validates :name, :presence => true, :uniqueness => true, :length => {:maximum => 32}
  validates :value, :presence => true

end
