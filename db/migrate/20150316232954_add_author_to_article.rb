class AddAuthorToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :author, :string
  end
end

class AddAgeToUser <ActiveRecord::Migration
	def change
		add_column :users, :age, :interger
	
		User.find_each do |user|
			random_age = (rand * 100).round
			user.update_column(:age, random_age)
		end
	end

	def down
		remove_column :users, :age
	end
end