require 'spec_helper'

describe User do
	before {@user = User.new(name:"testing User",email:"user@test.com",password: "foo", password_confirmation: "foo")}
	
	subject{@user}

	it{ should respond_to(:name)}
	it{ should respond_to(:email)}
	it{ should respond_to(:password_digest)}
	it{ should respond_to(:password)}
	it{ should respond_to(:password_confirmation)}
	it{ should respond_to(:authenticate)}
	it{ should respond_to(:remember_token)}

	it {should be_valid}

	describe "when password is not present" do 
		before do
			@user =User.new(name: "noPass", email: "noPass@word.com", password: "", password_confirmation: "")
		end
		it{should_not be_valid}
	end

	describe "when name is not present" do
		before { @user.name =""}
		it { should_not be_valid}
	end

	describe "when email address is already taken" do
		before do
			user_with_same_email = @user.dup
			user_with_same_email.email =@user.email.upcase
			user_with_same_email.save
		end


		it { should_not be_valid }
	end

	describe "return value of authenticate method" do
		before { @user.save}
		let(:found_user){User.find_by(email: @user.email)}

		describe "with valid password" do
			it {shoud eq found_user.authenticate(@user.password)}
		end

		describe "with invalid password" do
			let(:user_for_invalid_password){found_user.authenticate("invalid")}
			it{should_not eq user_for_invalid_password}
			specify{ expect(user_for_invalid_password).to be_falsey}
		end
	end

	describe "remember token" do
		before {@user.save}
		its(:remember_token) {should_not be_blank}
	end
end
