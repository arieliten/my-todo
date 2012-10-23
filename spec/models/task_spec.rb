require 'spec_helper'

describe Task do
  context "Validations" do
    it { build(:task).should be_valid }
    it { should validate_presence_of :user  }
    it { should validate_presence_of :title }
  end

  context "Associations" do
    it { should belong_to :user }
  end

  context "Protected attributes" do
    it { should allow_mass_assignment_of :title    }
    it { should allow_mass_assignment_of :due_at   }
    it { should allow_mass_assignment_of :priority }

    it { should_not allow_mass_assignment_of :completed }
    it { should_not allow_mass_assignment_of :user_id   }
  end

  context "Scopes" do
    before do
      2.times { FactoryGirl.create(:task, completed: false) }
      FactoryGirl.create(:task, completed: true)
    end

    describe ".completed" do
      it { Task.completed.should have(1).item }
    end
    describe ".unfinished" do
      it { Task.unfinished.should have(2).item }
    end
  end
end