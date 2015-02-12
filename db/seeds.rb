User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             suppervisor:     true)

9.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
              email: email,
              password:              password,
              password_confirmation: password)
  Course.create!(name: name, description: email)
  Subject.create!(name: email, description: password)
  Task.create!(name: password, description: name, subject_id: 1)
end