feature 'user has a profile page' do
    let(:user) { create(:user) }
    let!(:art1) { create(:article, title: "An article", author: user.username )}
    let!(:art2) { create(:article, title: "Another article", author: "Boris" )}

    describe "user can view all articles by an author" do
        before do
            visit "/users/#{user.username}"
        end
        
        it "displays username on top of page" do
            expect(page).to have_content "Articles by #{user.username}"
        end

        it "displays the articles of the user" do
            expect(page).to have_content art1.title
        end

        it "does not display other articles" do
            expect(page).to_not have_content art2.title
        end
    end
end