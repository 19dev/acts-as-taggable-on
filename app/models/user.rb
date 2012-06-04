class User < ActiveRecord::Base
  attr_accessible :name, :tag_list, :skill_list, :interest_list
  acts_as_taggable
  acts_as_taggable_on :skills, :interests
end
