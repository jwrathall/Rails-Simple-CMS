class Section < ActiveRecord::Base
  attr_accessible :page_id,:name, :permalink, :position, :is_visible, :content_type, :content
  belongs_to :page
  #allows to get across the join table
  has_many :section_edits
  has_many :editors, :through => :section_edits, :class_name => "AdminUser"
  
  CONTENT_TYPES = ['text','HTML']  
  validates_presence_of :name
  validates_length_of :name, :maximum => 50
  validates_inclusion_of :content_type, :in => CONTENT_TYPES, :message => "must be one of #{CONTENT_TYPES.join(', ')}"
  validates_presence_of :content
  end
