require 'rails_helper'

RSpec.describe User, type: :model do

    describe 'Validations' do
      
      # This is a local scope to each "it"
      # before do
        # User.create({first_name: "Ian", last_name: "Smith", email: "ismith@test.com", password: "password", password_confirmation: "password" })
      # end
      
      subject {described_class.new({first_name: "Ian", 
                                    last_name: "Smith",
                                    email: "ismith@test.com",
                                    password: "password", password_confirmation: "password"})
      }
        
      
      it "is valid with valid attributes" do
        expect(subject).to be_valid
      end

      it "is not valid without a first name" do
        subject.first_name = nil
        expect(subject).to_not be_valid
      end

      it "is not valid without a last name" do
        subject.last_name = nil
        expect(subject).to_not be_valid
      end

      it "is not valid without an email address" do
        subject.email = nil
        expect(subject).to_not be_valid
      end

      # For this test I create a user first with the same email as what I want to use for "new" with subject. Since they match, validation should fail.
      it "is not valid with a matching email address" do
       @testuser = User.create({first_name: "Isaac", last_name: "Smith", email: "ismith@test.com", password: "password", password_confirmation: "password" })
        expect(subject).to_not be_valid
        User.delete(@testuser.id)
      end

      it "is not valid without a password" do
        subject.password = nil
        expect(subject).to_not be_valid
      end

      it "is not valid without a password" do
        subject.password = nil
        expect(subject).to_not be_valid
      end

      it "is not valid without a password confirmation" do
        subject.password_confirmation = nil
        expect(subject).to_not be_valid
      end

      it "is not valid without matching password and password confirmation" do
        subject.password = "password1"
        expect(subject).to_not be_valid
      end

      it "is not valid without password with length greater than 8" do
        subject.password = "pass"
        subject.password_confirmation = "pass"
        expect(subject).to_not be_valid
      end

    end

    # Now we want to test the authenticate method
    describe '.authenticate_with_credentials' do

      before(:each) do
        @user = User.create({first_name: "Ian", 
                                    last_name: "Smith",
                                    email: "ismith@test.com",
                                    password: "password", password_confirmation: "password"})
      end
      # THis is done because otherwise since .create seems to be a "permanent" change, the NEXT time you use before each and set @user it will break since that already exists.
      after(:each) do
        User.delete(@user.id)
      end


      it "will return @user if credentials match" do
        user1 = User.authenticate_with_credentials("ismith@test.com","password")
        expect(user1).to eql @user
      end

      it "will return nil if credentials don't match (here passwords don't match)" do
        user1 = User.authenticate_with_credentials("ismith@test.com","password1")
        expect(user1).to_not eql @user
      end

      it "will return @user even if email case doesn't match" do
        user1 = User.authenticate_with_credentials("ISMITH@test.com","password")
        expect(user1).to eql @user
      end

      it "will return @user even if email has whitespace" do
        user1 = User.authenticate_with_credentials("  ismith@test.com ","password")
        expect(user1).to eql @user
      end
    end

end
