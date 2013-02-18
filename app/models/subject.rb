class Subject < ActiveRecord::Base
	attr_accessible :name, :position, :is_visible
	
	#Associations
  has_many :pages
  
  scope :visible, where(:is_visible => true)
  scope :invisible, where(:is_visible => false)
  scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}
end
