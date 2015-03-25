teams = FactoryGirl.create_list(:team, 5)

topics = FactoryGirl.build_list(:topic, (20..100).to_a.sample)
statuses = FactoryGirl.build_list(:status, (20..100).to_a.sample)

teams.each do |team|
  users = FactoryGirl.create_list(:user, (1..5).to_a.sample,
                                  teams: [team])
  FactoryGirl.create(:repository, team: team)
end

topics.each do |topic|
  topic.user = User.all.sample
  topic.save!
  FactoryGirl.create_list(:response, (1..10).to_a.sample, topic: topic, user: User.all.sample)
end

statuses.each do |status|
  status.user = User.all.sample
  status.save!
end

first_user = User.all.first
first_user.email = 'george.best@whatever.com'
first_user.save!

ftplan = Team.create(
  name: 'FT PLan',
  description: 'We love it, when a PLAN comes together')

ftforecast = Team.create(
  name: 'FT Forecast',
  description: 'Forecasting and stuff.')

bernhard = User.create(
  first_name: 'Bernhard',
  last_name: 'Stöcker',
  email: 'stoecki@der-ball-ist-rund.net',
  password: 'invision',
  nick_name: 'Stöcki',
  teams: [ftplan],
  role: 'Developer')

ayleen = User.create(
  first_name: 'Ayleen',
  last_name: 'McCann',
  email: 'ayleen.mccann@injixo.com',
  password: 'invision',
  nick_name: 'Aylz',
  teams: [ftplan],
  role: 'Developer')

cana = User.create(
  first_name: 'Cana',
  last_name: 'Hatake',
  email: 'mc_cann-a@email.ulster.ac.uk',
  password: 'invision',
  nick_name: 'CH',
  teams: [ftplan],
  role: 'Developer')

mario = User.create(
  first_name: 'Mario',
  last_name: 'Mainz',
  email: 'mario.mainz@invision.de',
  password: 'invision',
  teams: [ftforecast],
  role: 'developer')

Status.create(
  content: ":P",
  user: cana)

Status.create(
  content: "Hello :D",
  user: ayleen)

Status.create(
  content: "FC!!! FC!!! FC!!!",
  user: bernhard)

Status.create(
  content: "Why using Erlang? Because its great!!!",
  user: bernhard)

Status.create(
  content: "Hvem er jeg? Og hvor kommer verden fra?",
  user: bernhard)

