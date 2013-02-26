class WindowItem < ActiveRecord::Base
  attr_accessible :active, :icon_id, :link, :name, :parent_window_item_id, :position, :hover_text, :child_items_attributes,
                  :window_id, :window, :font_color, :children_layout

  belongs_to :icon
  belongs_to :window

  belongs_to :parent_item, :class_name => 'WindowItem'
  has_many :child_items, :foreign_key => 'parent_window_item_id', :class_name => 'WindowItem'
  accepts_nested_attributes_for :child_items, :allow_destroy => true

  validates :name, :presence => true, :length => {:maximum => 32}
  #validates :parent_window_item_id, :presence => true
  validates :window_id, :presence => true
  validates :position, :presence => true, :length => {:maximum => 3}

  CHILDREN_LAYOUT_OPTIONS = {:Horizontal => 'list-horizontal', :Vertical => 'list-vertical'}

  scope :active, where('active=true')
  scope :by_window, ->(window_id) { where('window_id = ?', window_id) }
  scope :is_parent, where('parent_window_item_id IS NULL || parent_window_item_id = ""')
  scope :by_parent, ->(parent_id) { where('parent_window_item_id = ?', parent_id) }
end
