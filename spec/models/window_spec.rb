require 'spec_helper'

describe Window do

  context 'Mass Assignment' do
    it { should allow_mass_assignment_of :name }
    it { should allow_mass_assignment_of :page_id }
    it { should allow_mass_assignment_of :window_type }
    it { should allow_mass_assignment_of :column_count }
    it { should allow_mass_assignment_of :column_position }
    it { should allow_mass_assignment_of :icon_id }
    it { should allow_mass_assignment_of :collapsible }
    it { should allow_mass_assignment_of :active }
  end

  context 'Indexes' do
    it { should_not have_db_index :name }
    it { should have_db_index :page_id }
    it { should_not have_db_index :window_type }
    it { should_not have_db_index :column_count }
    it { should_not have_db_index :column_position }
    it { should have_db_index :icon_id }
    it { should_not have_db_index :collapsible }
    it { should have_db_index :active }
  end

  context 'Associations' do
    it { should belong_to :page }
    it { should have_many :window_items }
    it { should belong_to :icon }
  end

  context 'Validations' do

    context 'Presence' do
      it { should validate_presence_of :name }
      it { should validate_presence_of :page_id }
      it { should validate_presence_of :window_type }
      it { should validate_presence_of :column_count }
      it { should validate_presence_of :column_position }
    end

    context 'Length' do
      it { should ensure_length_of(:name).is_at_most(64) }
      it { should ensure_length_of(:window_type).is_at_most(32) }
    end

    context 'Uniqueness' do
      it { should validate_uniqueness_of :name }
    end

  end

end