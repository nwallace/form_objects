user = User.create!(username: "Nathan", password: "password")

language_poll = Poll.create!(
    question: "What's your favorite programming language?",
    created_by: user
  )
os_poll = Poll.create!(
    question: "What operating system do you use for development?",
    created_by: user,
  )

language_poll.choices.create!([
  { text: "C" },
  { text: "Ruby" },
  { text: "JavaScript" },
  { text: "Python" },
  { text: "Other" },
])

os_poll.choices.create!([
  { text: "Windows" },
  { text: "OS X" },
  { text: "Linux" },
  { text: "BSD" },
  { text: "Other" },
])
