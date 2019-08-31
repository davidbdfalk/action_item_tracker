require 'rails_helper'

RSpec.describe BusinessUnit, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:programs) }

    it { should belong_to(:director) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
