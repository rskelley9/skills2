require 'faker'

# create a few users
User.create(name: 'Dev Bootcamp Student', email: 'me@example.com', password:'password')
5.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email, password:'password')
end

# create a few technical skills
computer_skills = %w(Ruby Sinatra Rails JavaScript jQuery HTML CSS)
computer_skills.each do |skill|
  Skill.create :name => skill, :context => 'technical'
end

# create a few creative skills

design_skills = %w(Photoshop Illustrator Responsive-Design)
design_skills.each do |skill|
  Skill.create :name => skill, :context => 'creative'
end

# TODO: create associations between users and skills

user_id = (1..5).to_a
skill_id = (1..10).to_a
years_experience = (1..20).to_a
formal_education = [true, false]

20.times do
  Proficiency.create(user_id: user_id.sample, skill_id: skill_id.sample, years_experience: years_experience.sample, formal_education: formal_education.sample)
end
