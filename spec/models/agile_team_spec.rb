require 'rails_helper'

RSpec.describe AgileTeam, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:program) }

    it { should belong_to(:scrum_master) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
