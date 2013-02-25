class Subject < ActiveRecord::Base
	attr_accessible :name, :position, :is_visible
	
  #Associations
  has_many :pages
  
  #validation
  validates_presence_of :name
  validates_length_of :name, :maximum => 50
  #we could also use :minimum => 1, this will give the error message "is too short"
  #validates_presence_of gives "can't be blank"
  #length_of allows strings with spaces
  
  scope :visible, where(:is_visible => true)
  scope :invisible, where(:is_visible => false)
  scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}
end
