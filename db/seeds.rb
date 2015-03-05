user = User.create!(username: "Nathan",
                    password: "password",
                    terms_of_use: "1")

Poll.create!(
    question: "What's your favorite programming language?",
    created_by: user,
    choices: [
      Choice.create(text: "C"),
      Choice.create(text: "Ruby"),
      Choice.create(text: "JavaScript"),
      Choice.create(text: "Python"),
      Choice.create(text: "Other"),
    ]
  )
Poll.create!(
    question: "What operating system do you use for development?",
    created_by: user,
    choices: [
      Choice.create(text: "Windows"),
      Choice.create(text: "OS X"),
      Choice.create(text: "Linux"),
      Choice.create(text: "BSD"),
      Choice.create(text: "Other"),
    ]
  )
