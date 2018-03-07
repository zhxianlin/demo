namespace :dev do
  # task :demo => :environment do
  #   puts "demo!!"
  #
  #   puts Event.count
  # end

  task :rebuild => ["db:drop", "db:setup", :fake]
  #taks :rebuild => ["db:drop", "db:create", "db:shema:load", "db:seed", :fake]

  task :fake => :environment do
    User.delete_all
    Event.delete_all
    Attendee.delete_all

    puts "Create fake data!"
    user = User.create!( :email => "abc@gmail.com", :password => "123456")

    50.times do |i|
      e = Event.create( :name => Faker::App.name )
      50.times do |j|
        e.attendees.create( :name => Faker::Name.name )
      end
    end
  end
end
