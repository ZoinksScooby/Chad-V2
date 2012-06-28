class Voter < ActiveRecord::Base
  attr_accessible :name,
                  :id,
                  :vote_attributes,
                  :candidate_attributes
  
  has_one :vote, :dependent => :destroy
  has_one :candidate, :through => :vote
  
  accepts_nested_attributes_for :vote
end
