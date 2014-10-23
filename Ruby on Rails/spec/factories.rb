FactoryGirl.define do
	factory :user do
		name "Young"
		email "ruby@rails.com"
		password "ruby"
		password_confirmation "ruby"
	end
    
    factory :user2 do
		name "Young2"
		email "ruby2@rails.com"
		password "ror"
		password_confirmation "ror"
	end
    
    factory :user3 do
		name "Young3"
		email "ruby3@rails.com"
		password "test"
		password_confirmation "test"
	end
end
