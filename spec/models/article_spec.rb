require './app/models/article.rb'

RSpec.describe Article, type: :model do
    describe 'DB table' do
        it { is_expected.to have_db_column :id }
        it { is_expected.to have_db_column :title }
        it { is_expected.to have_db_column :content}
    end

    describe 'Validations' do
        it { is_expected.to validate_presence_of :title }
        it { is_expected.to validate_presence_of :content }
    end

    describe 'Factory' do
        it 'should have a valid factory' do
            expect(FactoryBot.create(:article)).to be_valid
        end
    end
end