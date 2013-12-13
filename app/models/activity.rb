class Activity < ActiveRecord::Base
	belongs_to :user
	has_many :ratings, dependent: :destroy
end
