feature 'User can see specific article' do
    before do
      create(:article, title: 'A breakdancing news anchor', content: 'This guy is going crazy!')
      create(:article, title: 'Learn Rails 5, wait, no, 6', content: 'Build white pages')
      
      visit root_path
      click_on 'A breakdancing news anchor'
    end
  
    context 'Article displays' do
      it 'title' do
        expect(page).to have_content 'A breakdancing news anchor'
      end
  
      it 'content' do
        expect(page).to have_content 'This guy is going crazy!'
      end
    end
  end