class User < ActiveRecord::Base
  before_validation :normalize_params
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, :length => { :minimum => 6 }

  private

  def normalize_params
    downcase_email
  end

  def downcase_email
    self.email = email.downcase if attribute_present? 'email'
  end

end
