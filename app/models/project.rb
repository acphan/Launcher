class Project < ActiveRecord::Base
    acts_as_votable

    #Namespace and tags for the ActsAsTaggableOn gems
    acts_as_taggable
    acts_as_taggable_on :tools

    belongs_to :user
    has_many :comments
    #has_one :group

    #Groupify group for project members
    #groupify :group_member

    def self.search(search)
    if search
      #self.where("title LIKE ?", "%#{search}%")
      #Need another search statement that uses the tags and title (make title a tag?)
      if self.tagged_with(search) != []
      	self.tagged_with(search)
      else
      	self.where("title LIKE ?", "%#{search}%")
      end
    else
      self.all
  	end
  end
end
