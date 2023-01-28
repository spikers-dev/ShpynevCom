10.times do |i|
    u = Question.new
    u.body = Faker::Hacker.say_something_smart
    u.user_id = i
    u.save
  end
