RSpec.describe User, type: :model do
  describe 'has database table' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :username }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :username }
    it { is_expected.to validate_uniqueness_of :username }
  end

  describe 'Factory' do
    it 'should have a valid factory' do
      expect(FactoryBot.create(:user)).to be_valid
    end
  end
end