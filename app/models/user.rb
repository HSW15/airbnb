class User < ApplicationRecord
  include Clearance::User
  has_many :authentications, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i},confirmation: {case_sensitive: false}
  
  validates :password,presence:true, length: {in: 6..20}
  validates :gender, presence: true, on: :update
  validates :preferred_currency, presence: true, on: :update
  validates :address, presence: true, on: :update
  validates :identification, uniqueness: true, numericality: true, on: :update
  
  validate :check_phone_number, on: :update
  validates :phone_number, uniqueness: true, numericality: true, on: :update


    def check_age 
        now = Date.today
        age = now.year - self.birthday.year - ((now.month > self.birthday.month || (now.month == self.birthday.month && now.day >= self.birthday.day)) ? 0 : 1)
        age >= 18? true : false
    end

    def check_phone_number
         errors.add(:phone_number, "invalid phone number, less than 10 digits here") if (phone_number.scan(/\d/).length < 10) && (phone_number.scan(/\d/).length > 0)
     end

    def self.create_with_auth_and_hash(authentication, auth_hash)
      user = self.create!(
        first_name: auth_hash["extra"]["raw_info"]["first_name"],
        last_name: auth_hash["extra"]["raw_info"]["last_name"],
        email: auth_hash["info"]["email"],
        password: SecureRandom.hex(7),
        profile_picture: auth_hash["info"]["image"],
        gender: auth_hash["extra"]["raw_info"]["gender"],
        preferred_currency: auth_hash["extra"]["raw_info"]["currency"]["user_currency"],
        birthday: (auth_hash["extra"]["raw_info"]["birthday"][3..5]+auth_hash["extra"]["raw_info"]["birthday"][0..2] + auth_hash["extra"]["raw_info"]["birthday"][6..9]).to_date
      )
      user.authentications << authentication
      return user
    end

    # grab fb_token to access Facebook for user data
    def fb_token
      x = self.authentications.find_by(provider: 'facebook')
      return x.token unless x.nil?
    end
end
