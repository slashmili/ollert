class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable
  has_many :memberships
  has_many :boards, -> { select 'boards.*, memberships.id as membership_id'}, through: :memberships
  has_many :lists, through: :boards
  has_many :cards, through: :lists
  has_many :comments, through: :cards

  before_save :set_default_params

  def self.from_omniauth(auth)
    if user = User.find_by_email(auth.info.email)
      user.provider = auth.provider
      user.uid = auth.uid
      user
    else
      where(auth.slice(:provider, :uid)).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.initials = auth.info.name.split(' ').map { |s| s.upcase.chars.first }.join('')
        user.username = auth.info.email
        user.email = auth.info.email
        user.avatar = auth.info.image
        user.name = auth.info.name
      end
    end
  end

  private

  def set_default_params
    self.username = find_unique_username(email)
    self.initials = name.scan(/(\w)\w+/).join.upcase
  end

  def find_unique_username(email)
    index = 1
    username = email.scan(/(.+)@.+/).first.try(:first)
    loop do
      break unless User.find_by_username(username)
      username = "#{username}#{index}"
      index +=1
    end
    username
  end
end
