class Page < ActiveRecord::Base
  attr_accessible :active, :column_1_count, :column_2_count, :column_3_count, :column_4_count, :column_5_count,
                  :column_6_count, :name, :position, :default

  before_save :set_default_page

  has_many :windows, :dependent => :destroy

  validates :name, :presence => true, :length => {:maximum => 64}
  validate :column_count
  validates :column_1_count, :length => {:maximum => 6}
  validates :column_2_count, :length => {:maximum => 6}
  validates :column_3_count, :length => {:maximum => 6}
  validates :column_4_count, :length => {:maximum => 6}
  validates :column_5_count, :length => {:maximum => 6}
  validates :column_6_count, :length => {:maximum => 6}
  NUM_COLUMNS = [1, 2, 3, 4, 5, 6]

  def set_default_page
    if self.default
      #self.update_all(:default => false)
      Page.update_all("pages.default = false")
    end
  end

  protected

  def column_count
    total_columns = (column_1_count + column_2_count + column_3_count + column_4_count + column_5_count + column_6_count)

    if total_columns > 6
      errors.add_to_base('You cannot have more than 6 columns selected')
    elsif total_columns < 6
      errors.add_to_base('You cannot have less than 6 columns selected')
    end
  end

end
