class AdminUser < ActiveRecord::Base
 attr_accessible :first_name, :last_name, :username
  #set_table_name("admin_users")
  
  has_and_belongs_to_many :pages
  
  #allows us to go through the join to get to the other associated table
  has_many :section_edits
  has_many :sections, :through => :section_edits
  
  #scope :named, lambda {|first,last| where(:first_name => first, :last_name => last)}
end
