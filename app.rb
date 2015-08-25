require('sinatra/activerecord')
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/survey')
require('./lib/question')

get("/") do
  erb(:index)
end

get("/surveys") do
  @surveys = Survey.all()
  erb(:survey)
end

post("/surveys") do
  name = params.fetch("name")
  survey = Survey.new({:name => name})
  survey.save()
  @surveys = Survey.all()
  erb(:survey)
end

get("/surveys/:id") do
  @survey = Survey.find(params.fetch("id").to_i)
  @questions = Question.all()
  erb(:view_survey)
end

patch("/surveys/:id") do
  @survey = Survey.find(params.fetch("id").to_i)
  name = params.fetch("name")
  @survey.update({:name => name})
  @survey = Survey.find(params.fetch("id").to_i)
  @questions = Question.all()
  erb(:view_survey)
end

delete("/surveys/:id") do
  survey = Survey.find(params.fetch("id").to_i)
  survey.delete()
  @surveys = Survey.all()
  @questions = Question.all()
  erb(:survey)
end

post('/surveys/:id') do
  @questions = Question.all()
  description = params.fetch('description')
  survey_id = params.fetch("survey_id").to_i()
  question = Question.new({description: description, survey_id: survey_id})
  question.save()
  @survey = Survey.find(params.fetch("id").to_i)
  erb(:view_survey)
end
