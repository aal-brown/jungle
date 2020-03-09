require 'rails_helper'

RSpec.describe Product, type: :model do

    describe 'Validations' do
      
      # This is a local scope to each "it"
      before do
        @category = Category.new({id: 1, name: "Appliances"})
        subject.category = @category
      end
      
      # This is a global scope. If @category is used here it won't work, because it won't exist yet. That's why in each "it" we need "subject.category = @category"
      subject {described_class.new({name: "Blender",
                                    price_cents: 12500,
                                    quantity: 23
                                  })
      }
        
      
      it "is valid with valid attributes" do
        expect(subject).to be_valid
      end

      it "is not valid without a name" do
        subject.name = nil
        expect(subject).to_not be_valid
      end

      it "is not valid without a price" do
        subject.price_cents = nil
        expect(subject).to_not be_valid
      end

      it "is not valid without a quantity" do
        subject.quantity = nil
        expect(subject).to_not be_valid
      end

      it "is not valid without a category" do
        subject.category = nil
        expect(subject).to_not be_valid
      end

    end
end
