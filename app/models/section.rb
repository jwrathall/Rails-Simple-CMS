class Section < ActiveRecord::Base
  attr_accessible :page_id,:name, :permalink, :position, :is_visible, :content_type, :content
  belongs_to :page
  #allows to get across the join table
  has_many :section_edits
  has_many :editors, :through => :section_edits, :class_name => "AdminUser"
end
