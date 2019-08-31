require 'rails_helper'

RSpec.describe Program, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:agile_teams) }

    it { should belong_to(:program_manager) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
