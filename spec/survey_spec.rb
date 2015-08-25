require("spec_helper")

describe(Survey) do
  it("will validate prescence of name") do
    survey = Survey.new({:name => ""})
    expect(survey.save()).to(eq(false))
  end

  it("will capitalize all the words in the name when saved") do
    test_survey = Survey.new({:name => "test survey"})
    test_survey.save()
    expect(test_survey.name()).to(eq("Test Survey"))
  end
end
