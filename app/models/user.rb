class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and
 devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, 
         :validatable, :omniauthable, :omniauth_providers => [:twitter, :google_oauth2, :linkedin]

	def self.from_omniauth(auth)
		where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
			user.provider = auth.provider
			user.uid = auth.uid
			user.email = auth.info.email
			user.password = Devise.friendly_token[0,20]
		end
	end

    #VALIDATION 
	validates :name, :email, :password, presence: true

	has_many :listings, dependent: :destroy
	has_many :sales, class_name: "Order", foreign_key: "seller_id"
	has_many :purchases, class_name: "Order", foreign_key: "buyer_id"
end
