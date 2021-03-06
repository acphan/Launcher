class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :comments
  has_many :projects

 acts_as_messageable

  def mailboxer_email(object)
    #Check if an email should be sent for that object
      #if true
        return email
      #if false
        #return nil
    end
  #has_and_belongs_to_many :groups

  #Used with Groupify, the second one is for adding an extra tag to a user, like "admin" or "author",
  #which we could use for the view
  #groupify :group_member
  #groupify :named_group_member
end
