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

get("/questions") do
  erb(:question)
end
