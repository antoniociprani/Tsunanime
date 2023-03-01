Given(/^I am authenticated$/) do
        u = User.create!(id:"43",:username=>"test", :email=>"test@tsuna.it", :password=>"12345678" )
        u.set_default
        visit '/'
        fill_in "Email", with: "test@tsuna.it"
        fill_in "Password", with: "12345678"
        click_button "Log in"
        expect(page).to have_text("Signed in successfully.")
        expect(page).to have_selector("h1", text:"Tsunanime")
end

Given(/^I am authenticated as a admin$/) do
    u = User.create!(:username=>"admintest", :email=>"admintest@tsuna.it", :password=>"12345678" )
    u.set_admin
    visit '/'
    fill_in "Email", with: "admintest@tsuna.it"
    fill_in "Password", with: "12345678"
    click_button "Log in"
    expect(page).to have_text("Signed in successfully.")
    expect(page).to have_selector("h1", text:"Tsunanime")
end

Given(/^I am on the home page?/) do
    visit '/'
end

Then(/^I should see button "(.*?)"$/) do |arg1|

    expect(page).to have_link(id:/\A#{arg1}\Z/)
    
end

Then(/^I should click on the button "(.*?)"$/) do |arg1|

    #expect(page).to have_link(id:/\A#{arg1}\Z/)
    find(:xpath, "//img[@alt = '#{arg1}-alt']/parent::a").click()
    
end

Given(/^User test?/) do 
    u = User.create!(:username=>"test1", :email=>"test1@tsuna.it", :password=>"12345678" )
    u.set_default

end


Then(/^I should see "(.*?)" "(.*?)"$/) do |arg1,arg2|
    expect(page).to have_selector(arg1, text:arg2)
end


Then(/^I should see user test upgrade$/) do 
    xpath_query = '//table/tr[td="test1" and td="test1@tsuna.it" and td="update" and td="downgrade"]'
    expect(page).to have_xpath(xpath_query)
end


Then(/^I should click update for test1$/) do 

    find('tr', text: "test1").click_link('update')
    
end

Then(/^I should see M tag on test1$/) do
    expect(page).to have_selector("td", text:"M")
end

Given(/^I am authenticated as a moderator$/) do
    u = User.create!(:username=>"modtest", :email=>"modtest@tsuna.it", :password=>"12345678" )
    u.set_moderator
    visit '/'
    fill_in "Email", with: "modtest@tsuna.it"
    fill_in "Password", with: "12345678"
    click_button "Log in"
    expect(page).to have_text("Signed in successfully.")
    expect(page).to have_selector("h1", text:"Tsunanime")
end

Then(/^I add anime title "(.*?)" description "(.*?)" author "(.*?)"$/) do |arg1,arg2,arg3|
    fill_in "Title", with: arg1
    fill_in "Descripton", with: arg2
    fill_in "Author", with: arg3
    click_button "Create Anime"
    expect(page).to have_text("Anime was successfully created.")
end

Given(/^Anime "(.*?)" with description "(.*?)" and author "(.*?) and id "(.*?)"$/) do |arg1,arg2,arg3,arg4|
    a = Anime.new(id:arg4 ,title:arg1, descripton:arg2, author:arg3)
    a.save
end

Given (/^Review "(.*?)" by user "(.*?)" for anime "(.*?)" with score "(.*?)"$/) do |arg1,arg2,arg3,arg4|
    r = Review.new(comment:arg1 ,rating:arg4,user_id:arg2, anime_id:arg3)
    r.save
end

Then(/^I click link "(.*?)"$/) do |arg1|
    click_link(arg1)
end