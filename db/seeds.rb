# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end
puts 'DEFAULT USERS'
user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.name
user.add_role :admin
user2 = User.find_or_create_by_email :name => 'Evening User', :email => 'user2@example.com', :password => 'password', :password_confirmation => 'password'
user2.add_role :evening

puts 'DEFAULT ASSIGNMENTS'
Assignment = Assignment.create([
  { :category => "Readings", :title => "Course Resources", :description => "At the below link, you will find a library of readings and video content to reference as you work your way through this course. Make use of them as needed to power through when something is not making sense. Good luck!", :link => "https://gist.github.com/alielashram/7747790", :created_at => "2013-12-03 23:15:53", :updated_at => "2013-12-03 23:15:53", :assignment_id => 4, :week => "Week 0", :note => nil },
  { :category => "Online Tutorials", :title => "#0.1 Git", :description => "Git is a great tool for managing your code base. These days, it is a crucial part of the Ruby and Rails worlds. Start learning git by completing the Try Git online course.\r\n", :link => "http://try.github.io/", :created_at => "2013-12-03 23:17:28", :updated_at => "2013-12-03 23:17:28", :assignment_id => 4, :week => "Week 0", :note => nil },
  { :category => "Video Tutorials", :title => "#0.2 Unix Console & CLI", :description => "Signup for a http://teamtreehouse.com/ account (if you don't already have one) and work through the videos at the above link.", :link => "http://teamtreehouse.com/library/programming/console-foundations/getting-started-with-the-console", :created_at => "2013-12-03 23:29:17", :updated_at => "2013-12-03 23:29:17", :assignment_id => 4, :week => "Week 0", :note => nil },
  { :category => "Project", :title => "#0.3 GitHub.com & Prep Your App!", :description => "**Please Note: All assignments completed moving forward should be pushed to github.\r\n\r\nCreate a GitHub.com account if you don't have one yet. Start a new public repository. Modify the README file in Markdown format. Think about what kind of app you are going to build throughout this course. The default app will be a blog with many features added on as you go. Edit your README to talk about your app, introducing it to the world and describing to developers how to work with your code. Get creative with your Markdown.\r\n\r\nHelp with .md syntax: http://daringfireball.net/projects/markdown/syntax#overview", :link => "https://help.github.com/articles/create-a-repo", :created_at => "2013-12-03 23:37:18", :updated_at => "2013-12-03 23:41:53", :assignment_id => 4, :week => "Week 0", :note => nil },
  { :category => "Project", :title => "#1.1 Code up a Wireframe", :description => "Start with a hand-drawn wireframe for your blog app. Make sure it isn't too complicated. Draw it on paper first, so it looks good to you. Create a new .html file with well-structured markup. Link in a .css file to make it look like your wireframe.", :link => "no link", :created_at => "2013-12-03 23:38:30", :updated_at => "2013-12-03 23:38:30", :assignment_id => 4, :week => "Week 1", :note => nil },
  { :category => "Project", :title => "Convert Your HTML & CSS to HAML & SASS", :description => "Convert your HTML and CSS into HAML & SASS, respectively.\r\n\r\nHTML to HAML Converter: http://htmltohaml.com/", :link => "http://css2sass.heroku.com/", :created_at => "2013-12-03 23:39:58", :updated_at => "2013-12-03 23:39:58", :assignment_id => 4, :week => "Week 1", :note => nil },
  { :category => "Project", :title => "#1.3 HTML5 & CSS3", :description => "Research and implement HTML5 and CSS3 features into your wireframe code. Get creative.", :link => "no link", :created_at => "2013-12-03 23:43:51", :updated_at => "2013-12-03 23:43:51", :assignment_id => 4, :week => "Week 1", :note => nil },
  { :category => "Project", :title => "Extra page layout & styles", :description => "Create a completely new page layout for your app and add more available styles (e.g. unique list styles, h3 and h4 styles, etc...). Perhaps this will be a special feature page, a FAQ page, etc...", :link => "no link", :created_at => "2013-12-03 23:44:26", :updated_at => "2013-12-03 23:44:26", :assignment_id => 4, :week => "Week 1", :note => nil },
  { :category => "App-a-Day", :title => "#2.1 - Ruby Introduction", :description => "View instructions at link below.", :link => "http://postimg.org/image/szrr0vokj/", :created_at => "2013-12-03 23:45:18", :updated_at => "2013-12-03 23:45:18", :assignment_id => 4, :week => "Week 2", :note => nil },
  { :category => "App-a-Day", :title => "#2.2 - Rails Introduction", :description => "View steps 1-4: http://postimg.org/image/z2wosctyf/", :link => "View steps 5-10: http://postimg.org/image/6iedqvh7t/", :created_at => "2013-12-03 23:47:14", :updated_at => "2013-12-03 23:47:14", :assignment_id => 4, :week => "Week 2", :note => nil },
  { :category => "Practice", :title => "#2.3 - New Route [Extra Credit]", :description => "Add an additional route to a new controller and action of your choice. Example: Make localhost:3000/about-us go to an about action on a pages controller.", :link => "no link", :created_at => "2013-12-03 23:48:22", :updated_at => "2013-12-03 23:48:22", :assignment_id => 4, :week => "Week 2", :note => nil },
  { :category => "Practice", :title => "#2.4 - Rails Math [Extra Credit]", :description => "Add an additional route to a new controller and action of your choice - something appropriate for math. Do some math in the controller action and assign it to an instance variable named result. Render that in the view.", :link => "no link", :created_at => "2013-12-03 23:48:57", :updated_at => "2013-12-03 23:48:57", :assignment_id => 4, :week => "Week 2", :note => nil },
  { :category => "App-a-Day", :title => "#3.1 - Routing", :description => "View instructions at link below.", :link => "http://postimg.org/image/rams559ir/", :created_at => "2013-12-03 23:49:49", :updated_at => "2013-12-03 23:49:49", :assignment_id => 4, :week => "Week 3", :note => nil },
  { :category => "Practice", :title => "#3.2 - Links [Extra Credit]", :description => "Add links to your project from assignment 3.1. Research link_to, view your list of routes and find the appropriate URL helper method (see lecture notes), and link to the contacts list from your root page you created in the previous assignment. Remember to use rake routes for a list of the URLs you can link to.", :link => "no link", :created_at => "2013-12-03 23:51:34", :updated_at => "2013-12-03 23:51:34", :assignment_id => 4, :week => "Week 3", :note => nil },
  { :category => "Practice", :title => "#4.1 - Models", :description => "View instructions at link below.", :link => "http://postimg.org/image/5k2gridzz/", :created_at => "2013-12-03 23:52:21", :updated_at => "2013-12-03 23:52:21", :assignment_id => 4, :week => "Week 4", :note => nil },
  { :category => "Practice", :title => "#4.2 - New Models", :description => "View instructions at link below.", :link => "http://postimg.org/image/d10z0i2hf/", :created_at => "2013-12-03 23:53:55", :updated_at => "2013-12-03 23:53:55", :assignment_id => 4, :week => "Week 4", :note => nil },
  { :category => "Practice", :title => "#4.3 - List All Models [Extra Credit]", :description => "View instructions at link below.", :link => "http://postimg.org/image/726r5et7j/", :created_at => "2013-12-03 23:54:36", :updated_at => "2013-12-03 23:54:36", :assignment_id => 4, :week => "Week 4", :note => nil },
  { :category => "App-a-Day", :title => "#5.1 Build a list of users", :description => "View instructions at this link: http://postimg.org/image/qs2tn359b/", :link => "Video walk-through: http://www.youtube.com/watch?v=PAQ9GG49zrc&hd=1", :created_at => "2013-12-03 23:55:45", :updated_at => "2013-12-03 23:56:56", :assignment_id => 4, :week => "Week 5", :note => nil },
  { :category => "App-a-Day", :title => "#5B.1 Build a contact list with nested addresses", :description => "View instructions at this link: http://postimg.org/image/5gz5qm6fl/", :link => "Video walk-through: http://www.youtube.com/watch?v=ujySTT-oJmM&feature=youtu.be", :created_at => "2013-12-03 23:58:21", :updated_at => "2013-12-03 23:58:21", :assignment_id => 4, :week => "Week 5", :note => nil },
  { :category => "App-a-Day", :title => "#6A.1 - Modifying tables, Validations, & Queries", :description => "View instructions at this link: http://postimg.org/image/5jy74w8hp/\r\n\r\nExtra credit: http://postimg.org/image/xt2b8l4j9/", :link => "Video walk-through: http://www.youtube.com/watch?v=ovP_V28w-tQ&hd=1", :created_at => "2013-12-04 00:00:41", :updated_at => "2013-12-04 00:00:41", :assignment_id => 4, :week => "Week 6", :note => nil },
  { :category => "App-a-Day", :title => "#6A.2 - Search tracking! [Extra Credit]", :description => "This starts off from the end of Assignment #6A.1!", :link => "http://postimg.org/image/bqoid5k63/", :created_at => "2013-12-04 00:01:27", :updated_at => "2013-12-04 00:01:27", :assignment_id => 4, :week => "Week 6", :note => nil },
  { :category => "App-a-Day", :title => "#6B.1 - Authentication/Authorization", :description => "View instructions at this link: http://postimg.org/image/iipo9vp79/\r\n\r\nVideo walk-through part 1: http://www.youtube.com/watch?v=-xzqSFDdudA&hd=1 ", :link => "Video walk-through part 2: http://www.youtube.com/watch?v=h9XIXiguIJ0&hd=1", :created_at => "2013-12-04 00:04:33", :updated_at => "2013-12-04 00:04:33", :assignment_id => 4, :week => "Week 6", :note => nil },
  { :category => "App-a-Day", :title => "#7A.1 - Pagination and Deployment", :description => "View instructions here: http://postimg.org/image/ga4jq500v/\r\n\r\nHeroku Help: https://devcenter.heroku.com/articles/getting-started-with-rails4 AND http://www.youtube.com/watch?v=Rj_MgY-M2mM&hd=1\r\n\r\nKaminari Gem: https://github.com/amatsuda/kaminari", :link => "Video walk-through: http://www.youtube.com/watch?v=L8SBDZ-Q7OM&hd=1", :created_at => "2013-12-04 00:28:04", :updated_at => "2013-12-04 00:28:24", :assignment_id => 4, :week => "Week 7", :note => nil },
  { :category => "App-a-Day", :title => "#7A.2 - File Uploads with Dragonfly [Extra Credit: 5pts + 5pts]", :description => "View instructions here: http://postimg.org/image/4sh98j5gp/", :link => "Introductory video: http://www.youtube.com/watch?v=SZRxJ-zd6HI&hd=1", :created_at => "2013-12-04 00:29:51", :updated_at => "2013-12-04 00:29:51", :assignment_id => 4, :week => "Week 7", :note => nil },
  { :category => "Practice", :title => "#7B.1 - Testing or Spec'ing", :description => "Video instructions here: http://postimg.org/image/xbzmtkf3n/\r\n\r\nHints: http://postimg.org/image/6seg0ya1r/", :link => "Videos: http://www.youtube.com/watch?v=H1Czc3NL4c4&hd=1 AND http://blowmage.com/2013/05/29/minitest-rails-bffs", :created_at => "2013-12-04 00:31:15", :updated_at => "2013-12-04 00:31:15", :assignment_id => 4, :week => "Week 7", :note => nil },
  { :category => "Practice", :title => "#7B.2 - More Testing or Spec'ing [Extra Credit]", :description => "View instructions at link below.", :link => "http://postimg.org/image/plopu24bt/", :created_at => "2013-12-04 00:32:26", :updated_at => "2013-12-04 00:32:26", :assignment_id => 4, :week => "Week 7", :note => nil },
  { :category => "Practice", :title => "#7B.3 - Capybara Test [Extra Credit]", :description => "Capybara: https://github.com/jnicklas/capybara\r\n\r\nPoltergeist: https://github.com/jonleighton/poltergeist  ", :link => "View instructions here: http://postimg.org/image/z4lvbyfnr/", :created_at => "2013-12-04 00:34:05", :updated_at => "2013-12-04 00:34:05", :assignment_id => 4, :week => "Week 7", :note => nil },
  { :category => "Railscasts", :title => "Assets & Javascript", :description => "Asset Pipeline: http://railscasts.com/episodes/279-understanding-the-asset-pipeline", :link => "Turbolinks: http://railscasts.com/episodes/390-turbolinks", :created_at => "2013-12-04 00:39:05", :updated_at => "2013-12-04 00:39:05", :assignment_id => 4, :week => "Week 8", :note => nil },
  { :category => "Readings", :title => "Assets & JavaScript II", :description => "Javascript foundations: http://teamtreehouse.com/library/javascript-foundations", :link => "Chrome Dev Tools/Firebug: http://www.makeuseof.com/tag/figure-out-website-problems-with-chrome-developer-tools-or-firebug/", :created_at => "2013-12-04 00:40:52", :updated_at => "2013-12-04 00:40:52", :assignment_id => 4, :week => "Week 8", :note => nil }
], :without_protection => true )






