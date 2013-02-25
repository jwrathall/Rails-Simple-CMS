require "digest/sha1"
class AdminUser < ActiveRecord::Base
 attr_accessible :first_name, :last_name, :username, :email
  #set_table_name("admin_users")
  
  has_and_belongs_to_many :pages
  
  #allows us to go through the join to get to the other associated table
  has_many :section_edits
  has_many :sections, :through => :section_edits
  
EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

#old school validation
#validates_presence_of :first_name
#validates_length_of :first_name, :maximum => 25
#validates_presence_of :last_name
#validates_length_of :last_name, :maximum => 50
#validates_presence_of :username
#validates_length_of :username, :in =>8..25
#validates_presence_of :email
#validates_length_of :email, :maximum => 100
#validates_format_of :email, :with => EMAIL_REGEX
#validates_confirmation_of :email
  
#the new hotness
validates 	:first_name, :presence => true, 
			:length =>{:maximum =>25}
validates 	:last_name, :presence => true, 
			:length => {:maximum => 50}
validates 	:username, 
			:length => {:within => 8..25},
			:uniqueness => true
validates 	:email, :presence => true,
			:length => {:maximum => 100},
			:format => EMAIL_REGEX,
			:confirmation => true
  scope :named, lambda {|first,last| where(:first_name => first, :last_name => last)}
  
  attr_protected :hashed_password, :salt
  
  def self.make_salt(username ="")
  	Digest::SHA1.hexdigest("User #{username} with #{Time.now}")
  end 
   
  def self.hash(password="",salt="")
  	Digest::SHA1.hexdigest("Put #{salt} on the #{password}")
  end
  
end
