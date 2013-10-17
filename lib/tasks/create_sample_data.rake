namespace :create do
  desc 'Create sample data'
  i = 0
  task :sample_data, [:filename] => :environment do
    header = "company_name, name, job_title, gender, location"

    puts "Creating sample csv file to import"

    File.open(ENV['filepath'], 'w') do |csv|
      gender = ["Male", "Female"]
      csv << header
      csv << "\n"
      1000.times do |n|
        csv << "Example,example#{n+1}@test.com,test@123,#{Faker::Name.name},#{Faker::Name.title},#{gender.sample.to_s},#{Faker::Address.city}"
        csv << "\n"
      end
    end

    puts "Successfully created!"
  end
    
end