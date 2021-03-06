require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:agile_teams) }

    it { should have_many(:programs) }

    it { should have_many(:business_units) }

    it { should have_many(:operating_units) }

    it { should have_many(:received_follow_requests) }

    it { should have_many(:sent_follow_requests) }

    it { should have_many(:comments) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_uniqueness_of(:username) }

    it { should validate_presence_of(:username) }
      
    end
end
