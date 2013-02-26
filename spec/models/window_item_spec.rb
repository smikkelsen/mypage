require 'spec_helper'

describe WindowItem do

  context 'Mass Assignment' do
    it { should allow_mass_assignment_of :parent_window_item_id }
    it { should allow_mass_assignment_of :name }
    it { should allow_mass_assignment_of :icon_id }
    it { should allow_mass_assignment_of :link }
    it { should allow_mass_assignment_of :active }
    it { should allow_mass_assignment_of :position }
  end

  context 'Indexes' do
    it { should have_db_index :parent_window_item_id }
    it { should_not have_db_index :name }
    it { should have_db_index :icon_id }
    it { should_not have_db_index :link }
    it { should have_db_index :active }
    it { should have_db_index :position }
  end

  context 'Associations' do
    it { should belong_to :window }
    it { should belong_to :icon }
  end

  context 'Validations' do

    context 'Presence' do
      it { should validate_presence_of :parent_window_item_id }
      it { should validate_presence_of :name }
      it { should validate_presence_of :position }
    end

    context 'Length' do
      it { should ensure_length_of(:name).is_at_most(32) }
      it { should ensure_length_of(:position).is_at_most(3) }
    end

    context 'Uniqueness' do
    end

  end

end