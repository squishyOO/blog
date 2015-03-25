class Article < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	validates :title, presence: true,
					  length: { minimum: 5, maximum: 140 }
	validates :author, presence: true
	validates :text, presence: true
	validates :title, uniqueness: true

	def self.entitled(title)
		where(title: title)
	end
	# validate :date_of_birth
	
	# def date_of_birth
	# 	if date_birth > 18.years.ago
	# 	errors.add(:date_of_birth, "Must be 18!!" )
	# end
end
