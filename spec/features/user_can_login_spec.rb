feature 'User can login' do
    let(:user) { FactoryBot.create(:user) }

    describe 'With correct credentials' do

        before do
            visit new_user_session_path
            fill_in "Username", with: user.username
            fill_in "Password", with: user.password
            within '.actions' do
                click_on "Log in"
            end
        end

        it 'shows welcome message' do
            expect(page).to have_content "Profile: #{user.username}"
        end

        it 'user can log out' do
            click_on "Log out"
            expect(page).to_not have_content "Log out"
        end
    end

    describe 'unless credentials are wrong' do
        before do
            visit new_user_session_path
        end

        it 'with wrong password' do
            fill_in "Username", with: user.username
            fill_in "Password", with: "kambucha"
            within '.actions' do
                click_on "Log in"
            end
            expect(page).to have_content "Invalid Username or password"
        end

        it 'with unregistered user' do
            fill_in "Username", with: "Bobert"
            fill_in "Password", with: "TheBobby"
            within '.actions' do
                click_on "Log in"
            end
            expect(page).to have_content "Invalid Username or password"
        end
    end
end