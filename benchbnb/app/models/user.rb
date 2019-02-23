# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  session_token   :string           not null
#  password_digest :string           not null
#  username        :string           not null
#  email           :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :session_token, :username, :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 8, allow_nil: true}
  validates :password_digest, presence: true
  after_initialize :ensure_session_token

  attr_reader :password

  def self.find_by_credentials(username, password)
    @user = User.find_by(username: username)
    if @user && @user.is_password?(password)
      return @user
    else
      nil
    end
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64()
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64()
    self.save!
    return self.session_token
  end

end
