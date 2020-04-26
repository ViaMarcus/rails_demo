feature 'User can create articles' do
    let(:user) { FactoryBot.create(:user) }
    let(:user2) { FactoryBot.create(:user, username: "Bart", password: "Eatmyshorts") }

    before do
        login_as( user, scope: :user)
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

        it 'user should be author of article' do
            expect(page).to have_content "Author: #{ user.username }"
        end

        it 'user can edit its own articles' do
            click_on "Edit Article"
            expect(page).to have_content "Editing 'Happy Holidays'"
        end

        it 'user cannot edit someone elses article' do
            logout
            login_as(user2, scope: :user)
            article = Article.find_by(title: 'Happy Holidays')
            visit article_path(article)
            expect(page).to_not have_content "Edit Article"
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

    context "User is not logged in" do
        before do
            logout
            visit new_article_path
        end

        it 'redirects user' do
            expect(page).to have_content "Remember"
        end
    end
end