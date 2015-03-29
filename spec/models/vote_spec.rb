require 'rails_helper'

describe Vote do 
  describe "validations" do
    
    describe "value validation" do
      it "allows only -1 or 1 as values" do
        @vote = Vote.create(value: 2)
        expect(@vote.create?).to eq(false)
        
        @vote = Vote.create(value: 1)
        expect(@vote.create?).to eq(true)
        
        @vote = Vote.create(value: 0)
        expect(@vote.create?).to eq(false)
        
        @vote = Vote.create(value: -1)
        expect(@vote.create?).to eq(true)
        
        @vote = Vote.create(value: -2)
        expect(@vote.create?).to eq(false)
      end
    end
  end
end