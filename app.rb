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
  erb(:view_survey)
end

patch("/surveys/:id") do
  @survey = Survey.find(params.fetch("id").to_i)
  name = params.fetch("name")
  @survey.update({:name => name})
  erb(:view_survey)
end

get("/questions") do
  erb(:question)
end
