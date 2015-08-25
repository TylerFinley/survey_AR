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

  it("will validate prescence of an update input") do
    test_survey = Survey.new({:name => "test survey"})
    test_survey.save()
    expect(test_survey.update({:name => ""})).to(eq(false))
  end

  it("will return all the questions of a survey") do
    test_survey = Survey.new({:name => "test survey"})
    test_survey.save()
    test_question = Question.new({description: "This is a question", answer: "", survey_id: test_survey.id()})
    test_question.save()
    test_question2 = Question.new({description: "This is a another question", answer: "", survey_id: test_survey.id()})
    test_question2.save()
    expect(test_survey.questions()).to(eq([test_question, test_question2]))
  end
end
