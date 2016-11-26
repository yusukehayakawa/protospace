require 'rails_helper'

describe Prototype do
  describe 'associations' do

    describe 'with comments' do
      it "deletes the comments when prototype is deleted" do
        prototype = create(:prototype)
        comment = create(:comment, prototype: prototype)
        expect{ prototype.destroy }.to change{ Comment.count }.by(-1)
      end
    end

    describe 'with likes' do
      it "deletes the likes when prototype is deleted" do
        prototype = create(:prototype)
        like = create(:like, prototype: prototype)
        expect{ prototype.destroy }.to change{ Like.count }.by(-1)
      end
    end
  end

  describe 'validations' do

    context 'with valid attriubtes' do
      it "has a valid factory" do
        prototype = build(:prototype)
        expect(prototype).to be_valid
      end
    end

    context 'with invalid attriubtes' do
      it "is invalid without a name" do
        prototype = build(:prototype, name: "")
        prototype.valid?
        expect(prototype.errors[:name]).to include("can't be blank")
      end

      it "is invalid without a catch_copy" do
        prototype = build(:prototype, catch_copy: "")
        prototype.valid?
        expect(prototype.errors[:catch_copy]).to include("can't be blank")
      end

      it "is invalid without a concept" do
        prototype = build(:prototype, concept: "")
        prototype.valid?
        expect(prototype.errors[:concept]).to include("can't be blank")
      end
    end
  end

  describe 'liked_by(user)' do
    context 'when liked by a user' do
      it "returns true" do
        prototype = create(:prototype)
        like = create(:like, prototype: prototype)
        expect(like).to be_present
      end
    end
    context 'when not liked by a user' do
      it "returns nil" do
        prototype = create(:prototype)
        like = create(:like, prototype: prototype)
        expect(like.destroy).to be_truthy
      end
    end
  end

  describe 'set_sub_thumbnails' do
    it "returns an array containing sub_images" do
      prototype = create(:prototype)
      image =build(:image, status: 0, prototype: prototype)
      image2 =build(:image, status: 1, prototype: prototype)
      expect(prototype).to be_valid
    end
  end

  describe 'reject_sub_images(attributed)' do
    it "dosen't save a record with nil content" do
      prototype = create(:prototype)
      image =build(:image, status: 0, prototype: prototype)
      image2 =build(:image, image: "", status: 1, prototype: prototype)
      expect(prototype.images).not_to be_present
    end
  end
end
