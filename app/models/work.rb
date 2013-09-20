class Work < ActiveRecord::Base
  attr_accessible :address, :contact, :date_of_birth, :email, :encrypted_password, :fname, :gender, :hobby, :language, :lname, :religion
  validates :fname, :lname, :address, :email, :encrypted_password, presence: true
 
end
