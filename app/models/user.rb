class User < ActiveRecord::Base

  def self.from_omniauth(auth)
    binding.pry
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.email = auth.info.email
      user.uid = auth.uid
      user.provider = auth.provider
      user.avatar_url = auth.info.image
      user.username = auth.info.name
      user.oauth_token = auth.credentials.token
      user.repos = auth.extra.raw_info.public_repos
      user.nickname = auth.info.nickname
      user.save!
    end
  end
end
