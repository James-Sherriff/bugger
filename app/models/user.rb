class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first
    if user then
      user.update(name: data.name, profile_picture: data.image)
    end
    user
  end
  
  def admin?
    role == 'admin'
  end
  
  def developer?
    role == 'developer'
  end
end
