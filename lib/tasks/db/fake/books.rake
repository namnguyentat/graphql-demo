namespace :db do
  namespace :fake do
    desc 'create sample books'
    task books: :environment do
      user_ids = User.pluck(:id)

      30.times do
        Book.create!(
          title: Faker::Lorem.sentence,
          content: Faker::Lorem.paragraph,
          user_id: user_ids.sample
        )
      end

      puts "#{Book.count} books created"
    end
  end
end
