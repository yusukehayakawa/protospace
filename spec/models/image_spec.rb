require 'rails_helper'

describe Prototype do
  describe '#create' do

    describe 'main and sub' do
      it "create OK" do
        prototype = create(:prototype)
        image = build(:image, status: 0, prototype: prototype)
        image = build(:image, status: 1, prototype: prototype)
        prototype.valid?
        expect(prototype).to be_valid
      end
    end

    describe 'only main image' do
      it "create OK" do
        prototype = create(:prototype)
        image = build(:image, status: 0, prototype: prototype)
        expect(prototype).to be_valid
      end
    end

    describe 'only sub image' do
      it "create NG" do
        prototype = create(:prototype)
        image = build(:image, status: 1, prototype: prototype)
        image.valid?
        expect(image.errors[:image]).to include("can't be blank")
      end
    end

  end
end
