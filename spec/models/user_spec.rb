require 'spec_helper'

describe User do
  context "Validations" do
    it { build(:user).should be_valid }
    it { should validate_presence_of :name     }
    it { should validate_presence_of :email    }
    it { should validate_presence_of :password }
    it { should validate_confirmation_of :password }
    it { should validate_uniqueness_of :email      }
  end

  context "Associations" do
    it { should have_many :tasks }
  end

  context "Protected attributes" do
    it { should allow_mass_assignment_of :name     }
    it { should allow_mass_assignment_of :email    }
    it { should allow_mass_assignment_of :password }
    it { should allow_mass_assignment_of :password_confirmation }

    it { should_not allow_mass_assignment_of :encrypted_password }
  end
end