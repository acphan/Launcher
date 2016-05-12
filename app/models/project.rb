class Project < ActiveRecord::Base
    acts_as_votable
    acts_as_commentable
    belongs_to :user
end
