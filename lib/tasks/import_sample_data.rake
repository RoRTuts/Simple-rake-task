namespace :import do
  desc 'Create sample data'
  i = 0
  task :sample_data, [:filename] => :environment do
    puts "Importing csv data file"
    
    CSV.foreach(ENV['filepath'], :headers => true) do |row|
      i = i + 1
      if i == 1
        @company = Company.create!(company_name: row[0])  
      end

      employee = Employee.create!(name: row[1], job_title: row[2], gender: row[3], location: row[4], company_id: @company.id)

      puts 'Imported ' + i.to_s
    end

    puts "Successfully imported!"
  end
    
end