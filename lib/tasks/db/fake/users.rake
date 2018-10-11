namespace :db do
  namespace :fake do
    desc 'create sample users'
    task users: :environment do
      User.create!(email: 'test@example.com', password: 'test123456', admin: true)
      10.times do
        User.create!(email: Faker::Internet.email, password: 'test123456')
      end

      puts "#{User.count} users created"
    end
  end
end
