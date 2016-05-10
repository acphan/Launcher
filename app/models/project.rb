class Project < ActiveRecord::Base
    acts_as_votable

    #Namespace and tags for the ActsAsTaggableOn gems
    #acts_as_taggable
    #acts_as_taggable_on :tools, :skills

    belongs_to :user
    has_many :group_members
    has_many :comments

    #Specifies that a project is a member of a group in Groupify
    #Might need to set up a separate class for a project group with the declaration:
    ##class ProjectGroup < Group
    ##has_members [:users]
    #and then specify that a Project has a ProjectGroup using:
    #has :project_group
    #and add users to that
    #groupify :group_member

    def self.search(search)
    if search
      self.where("title LIKE ?", "%#{search}%")
      #Need another search statement that uses the tags and title (make title a tag?)
    else
      self.all
  	end
  end
end
