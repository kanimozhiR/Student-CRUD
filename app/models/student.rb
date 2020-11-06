class Student < ApplicationRecord

  validates_presence_of :name
  validates_presence_of :contact
  validates_presence_of :email
  validates_presence_of :dob
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

  before_create :set_age
 
  def to_param
  		name
	end
	def set_age
		self.age ||= Date.today.year - self.dob.year
	end

end