require 'rails_helper'

RSpec.describe ActionItem, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:sender) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_uniqueness_of(:actionee_id).scoped_to(:assigner_id).with_message('already requested') }

    it { should validate_presence_of(:actionee_id) }

    it { should validate_presence_of(:assigner_id) }
      
    end
end
