feature 'User can create articles' do
    before do
        visit root_path
        click_on "New Article"
    end

    context 'Successfully create an article' do
        before do
            fill_in "Title", with: "Happy Holidays"
            fill_in "Content", with: "Buy your gifts now!"
            click_on "Create Article"
        end

        it 'user should be on article show page' do
            article = Article.find_by(title: 'Happy Holidays')
            expect(current_path).to eq article_path(article)
        end

        it 'User should see success message' do
            expect(page).to have_content 'Article was successfully created'
        end

        it 'User should see article title' do
            expect(page).to have_content 'Happy Holidays'
        end
        
        it 'user should see article content' do
            expect(page).to have_content 'Buy your gifts now!'
        end
    end

    context "User doesn't enter a title for the article" do
        before do
            fill_in "Content", with: "Buy your gifts now!"
            click_on "Create Article"
        end
        
        it 'user should see error message' do
            expect(page).to have_content "Title can't be blank"
        end
    end

    context "user doesn't enter any content for the article" do
        before do
            fill_in "Title", with: "Happy Holidays!"
            click_on "Create Article"
        end

        it "user should see an error message" do
            expect(page).to have_content "Content can't be empty"
        end
    end
end