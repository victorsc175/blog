require 'find'

namespace :test do
  desc "Project ruby files counter"
  task ruby_files_counter: :environment do
    count = 0
    Find.find('./') { |f| count += 1 if f.end_with?('.rb') }
    puts 'Totally ruby files in the project - ' + count.to_s
  end

  desc "Project ruby files lines counter"
  task ruby_files_lines_counter: :environment do
    count = 0
    Find.find('./') { |f| count += File.readlines(f).size if f.end_with?('.rb') }
    puts 'Totally ruby files lines in the project - ' + count.to_s
  end
end
