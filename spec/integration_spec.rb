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

describe('/surveys/:id', {type: :feature}) do
  it('will allow user to update a survey name') do
    test_survey = Survey.new({name: 'kasdnl'})
    test_survey.save()
    visit("/surveys/#{test_survey.id}")
    fill_in("name", with: "red survey")
    click_button("Update!")
    expect(page).to have_content("Red Survey")
  end

  it("will allow the user to delete a survey") do
    test_survey = Survey.new({name: 'Red Survey'})
    test_survey.save()
    visit("/surveys/#{test_survey.id()}")
    click_button("Delete")
    expect(page).to have_no_content("Red Survey")
  end
end
