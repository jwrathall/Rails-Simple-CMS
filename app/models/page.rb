class Page < ActiveRecord::Base
  attr_accessible :subject_id,:name, :permalink, :position, :is_visible
  
  belongs_to :subject
  has_many :sections
  has_and_belongs_to_many :editors, :class_name => "AdminUser"
  
  validates_presence_of :name
  validates_length_of :name, :maximum => 50
  validates_presence_of :permalink
  validates_length_of :permalink, :within => 3..100
  validates_uniqueness_of :permalink
  #for unique values by subject, :scope => :subject_id
end
