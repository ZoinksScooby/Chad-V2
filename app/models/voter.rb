class Voter < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :name,
                  :id,
                  :vote_attributes,
                  :candidate_attributes
  
  has_one :vote, :dependent => :destroy
  has_one :candidate, :through => :vote
    
  accepts_nested_attributes_for :vote
end
