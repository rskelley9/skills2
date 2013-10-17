class User < ActiveRecord::Base
  attr_reader :entered_password

  validates :name, length: { :minimum => 3, :message => "must be at least 3 characters." }
  validates :password, presence: true
  validates :password, format: {with: /\S{6,}/}
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: {with: /\S{3,}@\S{3,}\.\S{2,}/}


  has_many :proficiencies
  has_many :skills, through: :proficiencies
  belongs_to :skill

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    user = User.where(email: email)
    return user if user && user.password == password
    return nil
  end
end



