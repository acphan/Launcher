class Project < ActiveRecord::Base
    acts_as_votable
    belongs_to :user
    has_many :comments
    def self.search(search)
    if search
      self.where("title LIKE ?", "%#{search}%")
    else
      self.all
  	end
  end
end
