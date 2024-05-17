desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do
  puts "Sample data task running"
  if Rails.env.development?
    User.destroy_all
  end
  if Rails.env.production?
    ActiveRecord::Base.connection.tables.each do |t|
      ActiveRecord::Base.connection.reset_pk_sequence!(t)
    end
  end

  500.times do

    bopt=" PHL MCO TPA MIA CHI DEN LAS PHX".split
    emp_ids = (400000..450000).to_a.sample(500)
  
  employee=User.new
  employee.access="FA"
  employee.base=bopt.sample
  employee.doh= Faker::Date.between(from: 20.years.ago, to: 1.day.ago)
  employee.first_name=Faker::Name.first_name 
  employee.last_name=Faker::Name.last_name 
  employee.email="#{employee.first_name.downcase}.#{employee.last_name.downcase}@example.com"
  employee.phone=Faker::PhoneNumber.phone_number
  employee.position="FA"
  employee.emp_id=emp_ids.pop
  employee.image=Faker::LoremFlickr.image
  employee.password="password"

  employee.save!
  
  end
  
  1.times do

    bopt=" PHL MCO TPA MIA CHI DEN LAS PHX".split
    emp_ids = (400000..450000).to_a.sample(500)
    
    employee=User.new
    employee.access="SUP"
    employee.base="CHI"
    employee.doh= Faker::Date.between(from: 20.years.ago, to: 1.day.ago)
    employee.first_name="Daniel"
    employee.last_name="Moskowitz"
    employee.email="dmoskowitz815@gmail.com"
    employee.phone="4436025453"
    employee.position="SUP"
    employee.emp_id="431842"
    employee.image=Faker::LoremFlickr.image
    employee.password="password"

    employee.save!
  end

  puts "There are now #{User.count} rows in the Users table."
end
