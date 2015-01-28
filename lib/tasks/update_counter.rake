namespace :update_counter do
  desc "Update the number of airplanes"
  task :airplanes_count => :environment do
    Airline.all.each {|airline| Airline.reset_counters(airline.id, :airplanes)}
  end
end
