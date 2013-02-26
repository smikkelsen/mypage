require 'spec_helper'

describe Icon do

  context 'Mass Assignment' do
    it { should allow_mass_assignment_of :name }
    it { should allow_mass_assignment_of :value }
  end

  context 'Indexes' do
    it { should_not have_db_index :name }
    it { should_not have_db_index :value }
  end

  context 'Associations' do
    it { should have_many :windows }
    it { should have_many :window_items }
  end

  context 'Validations' do

    context 'Presence' do
      it { should validate_presence_of :name }
      it { should validate_presence_of :value }
    end

    context 'Length' do
      it { should ensure_length_of(:name).is_at_most(32) }
    end

    context 'Uniqueness' do
      it { should validate_uniqueness_of :name }
    end

  end

end