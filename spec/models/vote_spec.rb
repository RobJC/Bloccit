require 'rails_helper'

describe Vote do 
  describe "validations" do
    describe "value validation" do
      it "allows only -1 or 1 as values" do
        @invalid_vote = Vote.create(value: 2)
        expect(@invalid_vote.valid?).to eq(false)
      end
    end
  end
end