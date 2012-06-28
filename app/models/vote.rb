class Vote < ActiveRecord::Base
  attr_accessible :voter_id, :candidate_id
  
  belongs_to :voter
  belongs_to :candidate
end
