class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]



  acts_as_user :roles => [:default, :moderator, :admin]

  has_many :animes
  has_many :reviews, dependent: :destroy
  has_one_attached :avatar
  acts_as_favoritor

  

  def is_moderator?
    return (self.roles_mask & 2) == 2
  end
  
  def set_moderator
    self.unset_default
    self.roles_mask = (self.roles_mask | 2)
    self.save
  end

  def unset_moderator
    self.roles_mask = 1
    self.save
  end

  def is_admin?
    return (self.roles_mask & 4) == 4 
  end
  
  def set_admin
    self.unset_default
    self.roles_mask = (self.roles_mask | 4)
    self.save
  end

  def unset_admin
    self.roles_mask = 1
    self.save
  end


  def is_default?
    return(self.roles_mask & 1) == 1
  end

  def set_default
    self.roles_mask = (self.roles_mask | 1)
    self.save
  end

  def unset_default
    self.roles_mask = 0
    self.save
  end

  def ban
    self.banned = true
    self.save
  end
  
  def unban
    self.banned = false
    self.save
  end

  def active_for_authentication?
    super && !banned
  end  

  def destroy

  end
  
  def set_username
    self.username = "User"
  end


  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first
      unless user
        user = User.create( email: data['email'],
          password: Devise.friendly_token[0,20]
        )
      end
    user
  end


  

end
