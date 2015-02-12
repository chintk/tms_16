class User < ActiveRecord::Base
  has_many :enrollments, :dependent => :destroy
  has_many :enrollment_subjects, :dependent => :destroy
  has_many :subjects, through: :enrollment_subjects
  has_many :enrollment_tasks, :dependent => :destroy
  has_many :tasks, through: :enrollment_tasks
  has_many :activities, :dependent => :destroy

  before_save   :downcase_email
  validates :name,  presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255}, 
            format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive:false}
  has_secure_password
  validates :password, length: {minimum: 6}, allow_blank: true
  
  class << self
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  private
  def downcase_email
    self.email = email.downcase
  end

end
