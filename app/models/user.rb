class User < ActiveRecord::Base
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.email = auth.info.email
      user.uid = auth.uid
      user.provider = auth.provider
      user.avatar_url = auth.info.image
      user.username = auth.info.name
      user.oauth_token = auth.credentials.token
      user.save!
    end
  end

  def followers
    response = Faraday.get "https://api.github.com/users/#{self.username.split.join}/followers"
    JSON.parse(response.body)
  end

  def following
    response = Faraday.get "https://api.github.com/users/#{self.username.split.join}/following"
    JSON.parse(response.body)
  end

  def starred
    response = Faraday.get "https://api.github.com/users/#{self.username.split.join}/starred"
    JSON.parse(response.body)
  end
end
