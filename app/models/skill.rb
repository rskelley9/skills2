class Skill < ActiveRecord::Base
  VALID_CONTEXTS = %w(technical creative)

  validates :name, :presence => true
  validate :validate_context

  has_many :proficiencies
  has_many :users, through: :proficiencies
  belongs_to :user

  private
  def validate_context
    p self.context
    self.errors[:context] = "must be one of: #{VALID_CONTEXTS.join(', ')}" unless VALID_CONTEXTS.include? self.context
  end
end
