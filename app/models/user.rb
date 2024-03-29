class User < ApplicationRecord
    before_save{self.email = email.downcase}
    has_many :orders
    VALID_EMAIL_REGEX=/\A[\w+\-.]+@[a-z\d\-.]+[a-z]+\z/i
    validates :email, presence:true,uniqueness: {case_sensitive:false},format: {with:VALID_EMAIL_REGEX}
    validates :password, presence:true
    has_secure_password
end
