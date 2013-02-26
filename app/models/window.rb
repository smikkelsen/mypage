class Window < ActiveRecord::Base
  attr_accessible :active, :collapsible, :column_count, :column_position, :icon_id, :name, :page_id, :window_type,
                  :window_items_attributes, :page_position

  belongs_to :page
  belongs_to :icon
  has_many :window_items
  accepts_nested_attributes_for :window_items

  COLUMNS = {:Top => 0, :Center1 => 1, :Center2 => 2, :Center3 => 3, :Center4 => 4, :Center5 => 5, :Center6 => 6, :Bottom => -1}
  WINDOW_TYPES = {"Default" => "default", "Directory" => "directory", "Search All" => "search_all", "Google Search / Window Search" => "google_search"}
  NUM_COLUMNS = [1,2,3,4,5,6]

  scope :by_page, ->(page) { where('page_id=?', page) }
  scope :by_column, ->(column) { where('windows.column_position=?', column) }
  scope :active, where('active=true')

  validates :name, :presence => true, :uniqueness => true, :length => {:maximum => 64}
  validates :window_type, :presence => true, :length => {:maximum => 32}
  validates :page_position, :presence => true
  validates :page_id, :presence => true
  validates :column_count, :presence => true
  validates :column_position, :presence => true

end
