require 'rails_helper'

describe User do
  let(:user) { User.new }

  it "Model creation encrypts password" do
    user.password = "password"
    expect(user.password_digest).not_to eq "password"
  end

  describe "Validations" do

    before do
      user.assign_attributes(username:"testuser", email: "test@gmail.com", role: "faculty", password:"password")
    end

    it "User is valid when all fields are assigned" do
      user.valid?
      expect(user.errors).to be_empty
    end

    context "When any field is empty" do

      it "User is invalid when password is empty" do
        user.password = nil
        user.valid?
        expect(user.errors).not_to be_empty
      end

      it "User is invalid when role is empty" do
        user.role = nil
        user.valid?
        expect(user.errors).not_to be_empty
      end

      it "User is invalid when email is empty" do
        user.email = nil
        user.valid?
        expect(user.errors).not_to be_empty
      end

      it "User is invalid when username is empty" do
        user.username = nil
        user.valid?
        expect(user.errors).not_to be_empty
      end

    end

  end

  describe "Associations" do

    it "User has proposals" do
      user.proposals << Proposal.new
      expect(user.proposals.first).to be_a_kind_of(Proposal)
    end

    it "User has comments" do
      user.comments << Comment.new
      expect(user.comments.first).to be_a_kind_of(Comment)
    end

    it "User has observations" do
      user.observations << Observation.new
      expect(user.observations.first).to be_a_kind_of(Observation)
    end

  end


end