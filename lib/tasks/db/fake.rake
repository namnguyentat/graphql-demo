namespace :db do
  desc 'create sample data'
  task fake: [
    'fake:all'
  ]

  namespace :fake do
    task all: %i[
      users
      books
    ]
  end
end
