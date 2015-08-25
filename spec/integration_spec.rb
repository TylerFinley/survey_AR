require("spec_helper")
require("./app")

Capybara.app = Sinatra::Application

describe("/surveys", {:type => :feature}) do
  it("will allow user to add a survey and will display all surveys") do
    visit("/surveys")
    fill_in("name", :with => "Favorite Color Survey")
    click_button("Submit!")
    expect(page).to have_content("Favorite Color Survey")
  end
end
