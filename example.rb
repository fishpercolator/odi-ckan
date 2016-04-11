lbq = CKAN::Package.find(name: 'leeds-beer-quest').first.resources.first.content_csv

non_closed = lbq.reject {|v| v[:category] == 'Closed venues'}
with_jukebox = non_closed.select {|v| v[:tags].split(',').include? 'jukebox'}

with_jukebox.sort_by! {|v| v[:stars_atmosphere]}

with_jukebox.each {|v| puts "#{v[:name]}: atmo #{v[:stars_atmosphere]}, value: #{v[:stars_value]}"}
