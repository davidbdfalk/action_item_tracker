require 'rails_helper'

RSpec.describe ActionItem, type: :model do
  
    describe "Direct Associations" do

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:actionee_id) }

    it { should validate_presence_of(:assigner_id) }
      
    end
end
