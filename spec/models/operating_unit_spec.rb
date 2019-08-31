require 'rails_helper'

RSpec.describe OperatingUnit, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:vice_president) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
