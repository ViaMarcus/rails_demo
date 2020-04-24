feature 'User can sign up' do
    describe 'user can sign up' do
        before do
            visit root_path
            click_on "Sign up"
        end

        it 'should have a form' do
            expect(page).to have_content "Welcome! Please choose a name!"
        end

        it 'should be able to be filled in' do
            fill_in "Username", with: "Melker"
            fill_in "Password", with: "qwerty123"
            fill_in "Password confirmation", with: "qwerty123"
            within ".actions" do
                click_on "Sign up"
            end
            expect(page).to have_content "igned up successfully"
        end

    end

    describe 'user cannot sign up' do
        before do
            visit new_user_registration_path
        end

        it 'if passwords dont match' do
            fill_in "Username", with: "Melker"
            fill_in "Password", with: "qwerty123"
            fill_in "Password confirmation", with: "123123qwer"
            within ".actions" do
                click_on "Sign up"
            end
            expect(page).to have_content "Password confirmation doesn't match"
        end

        let(:user) { FactoryBot.create(:user) }

        it 'if username is taken' do
            fill_in "Username", with: user.username
            fill_in "Password", with: user.password
            fill_in "Password confirmation", with: user.password
            within ".actions" do
                click_on "Sign up"
            end
            expect(page).to have_content "already been taken"
        end
    end
end