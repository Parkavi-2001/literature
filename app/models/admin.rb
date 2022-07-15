class Admin < ApplicationRecord
    before_save{self.email = email.downcase}
    VALID_EMAIL_REGEX=/\A[\w+\-.]+@[a-z\d\-.]+[a-z]+\z/i
    validates :email, presence:true,uniqueness: {case_sensitive:false},format: {with:VALID_EMAIL_REGEX}
    validates :password_digest, presence:true
    has_secure_password
end
