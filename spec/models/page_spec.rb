require 'spec_helper'

describe Page do

  context 'Mass Assignment' do
    it { should allow_mass_assignment_of :name }
    it { should allow_mass_assignment_of :column_count }
    it { should allow_mass_assignment_of :position }
    it { should allow_mass_assignment_of :active }
  end

  context 'Indexes' do
    it { should_not have_db_index :name }
    it { should_not have_db_index :column_count }
    it { should_not have_db_index :position }
    it { should have_db_index :active }
  end

  context 'Associations' do
    it { should have_many :window }
  end

  context 'Validations' do

    context 'Presence' do
      it { should validate_presence_of :name }
      it { should validate_presence_of :column_count }
    end

    context 'Length' do
      it { should ensure_length_of(:name).is_at_most(64) }
    end

    context 'Uniqueness' do
    end

  end

end