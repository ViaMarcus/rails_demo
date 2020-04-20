require "rails_helper"

feature 'List articles on index page' do
    context 'with articles in db' do
        before do
            create(:article, title: 'A breakdancing news anchor')
            create(:article, title: 'Some reality breaking quantum action')
            
            visit root_path
        end

        it 'displays first article title' do
            expect(page).to have_content 'A breakdancing news anchor'
        end

        it 'displays second article title' do
            expect(page).to have_content 'Some reality breaking quantum action'
        end
    end
end