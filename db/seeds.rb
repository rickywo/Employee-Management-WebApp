# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Iterations initialization

Iteration.create(work_day: 5, start_date: DateTime.new(2016, 7, 11, 0, 0, 0), end_date: DateTime.new(2016, 7, 15, 0, 0, 0))
Iteration.create(work_day: 5, start_date: DateTime.new(2016, 7, 18, 0, 0, 0), end_date: DateTime.new(2016, 7, 22, 0, 0, 0))
Iteration.create(work_day: 5, start_date: DateTime.new(2016, 7, 25, 0, 0, 0), end_date: DateTime.new(2016, 7, 29, 0, 0, 0))
Iteration.create(work_day: 5, start_date: DateTime.new(2016, 8, 1, 0, 0, 0), end_date: DateTime.new(2016, 8, 5, 0, 0, 0))
Iteration.create(work_day: 5, start_date: DateTime.new(2016, 8, 15, 0, 0, 0), end_date: DateTime.new(2016, 8, 12, 0, 0, 0))
Iteration.create(work_day: 5, start_date: DateTime.new(2016, 8, 22, 0, 0, 0), end_date: DateTime.new(2016, 8, 19, 0, 0, 0))
Iteration.create(work_day: 5, start_date: DateTime.new(2016, 8, 29, 0, 0, 0), end_date: DateTime.new(2016, 8, 26, 0, 0, 0))
Iteration.create(work_day: 5, start_date: DateTime.new(2016, 9, 5, 0, 0, 0), end_date: DateTime.new(2016, 9, 2, 0, 0, 0))
Iteration.create(work_day: 5, start_date: DateTime.new(2016, 9, 12, 0, 0, 0), end_date: DateTime.new(2016, 9, 16, 0, 0, 0))
Iteration.create(work_day: 5, start_date: DateTime.new(2016, 9, 19, 0, 0, 0), end_date: DateTime.new(2016, 9, 23, 0, 0, 0))
Iteration.create(work_day: 5, start_date: DateTime.new(2016, 9, 26, 0, 0, 0), end_date: DateTime.new(2016, 9, 30, 0, 0, 0))
Iteration.create(work_day: 5, start_date: DateTime.new(2016, 10, 3, 0, 0, 0), end_date: DateTime.new(2016, 10, 7, 0, 0, 0))
Iteration.create(work_day: 5, start_date: DateTime.new(2016, 10, 10, 0, 0, 0), end_date: DateTime.new(2016, 10, 14, 0, 0, 0))
Iteration.create(work_day: 5, start_date: DateTime.new(2016, 10, 17, 0, 0, 0), end_date: DateTime.new(2016, 10, 21, 0, 0, 0))
Iteration.create(work_day: 5, start_date: DateTime.new(2016, 10, 24, 0, 0, 0), end_date: DateTime.new(2016, 10, 28, 0, 0, 0))
Iteration.create(work_day: 5, start_date: DateTime.new(2016, 10, 31, 0, 0, 0), end_date: DateTime.new(2016, 11, 4, 0, 0, 0))
Iteration.create(work_day: 5, start_date: DateTime.new(2016, 11, 7, 0, 0, 0), end_date: DateTime.new(2016, 11, 11, 0, 0, 0))
Iteration.create(work_day: 5, start_date: DateTime.new(2016, 11, 14, 0, 0, 0), end_date: DateTime.new(2016, 11, 18, 0, 0, 0))
Iteration.create(work_day: 5, start_date: DateTime.new(2016, 11, 21, 0, 0, 0), end_date: DateTime.new(2016, 11, 25, 0, 0, 0))
Iteration.create(work_day: 5, start_date: DateTime.new(2016, 11, 28, 0, 0, 0), end_date: DateTime.new(2016, 12, 2, 0, 0, 0))
Iteration.create(work_day: 5, start_date: DateTime.new(2016, 12, 5, 0, 0, 0), end_date: DateTime.new(2016, 12, 9, 0, 0, 0))
Iteration.create(work_day: 5, start_date: DateTime.new(2016, 12, 12, 0, 0, 0), end_date: DateTime.new(2016, 12, 16, 0, 0, 0))
Iteration.create(work_day: 5, start_date: DateTime.new(2016, 12, 19, 0, 0, 0), end_date: DateTime.new(2016, 12, 23, 0, 0, 0))
Iteration.create(work_day: 5, start_date: DateTime.new(2016, 12, 26, 0, 0, 0), end_date: DateTime.new(2016, 12, 30, 0, 0, 0))

# Capitalizable_group initialize
CapitalizableGroup.create(capitalizable_rate: 100, description: '100%')
CapitalizableGroup.create(capitalizable_rate: 50, description: '50%')
CapitalizableGroup.create(capitalizable_rate: 25, description: '25%')
CapitalizableGroup.create(capitalizable_rate: 0, description: '0%')

# Team initialize
Team.create(name: 'DELIVERY ENGINEERING', status: true)
Team.create(name: 'Paid Acquisition', status: true)
Team.create(name: 'SEARCH', status: true)
Team.create(name: 'Physical Product & Supply Chain', status: true)
Team.create(name: 'NEW MARKETS', status: true)
Team.create(name: 'UX - SHOP', status: true)
Team.create(name: 'ENGAGE', status: true)
Team.create(name: 'MOBILE', status: true)
Team.create(name: 'ARTIST SERVICES', status: true)

#Project initialize
=begin
      t.string :name
      t.integer :status (closed: 0, active: 1, suspended: 2)
      t.boolean :is_capitalizable
      t.integer :weight
      t.datetime :release_date
      t.text :description
      t.integer :team_id
=end
# Project of Team 1
Project.create(team_id: 4, name: 'Gallery Board', status: 1, is_capitalizable: true, weight: 10, release_date: nil, description: 'New product for RB - this is a brand new product and a new printing process providing a unique case product to RB. Design and build the customer, artsits and fulfillment experience related to the new product.')
Project.create(team_id: 4, name: 'Tapestry', status: 1, is_capitalizable: true, weight: 50, release_date: nil, description: 'New product for RB - this is a brand new product and a new printing process providing a unique case product to RB. Design and build the customer, artsits and fulfillment experience related to the new product.')
Project.create(team_id: 4, name: 'Acrylic Prism Block', status: 1, is_capitalizable: true, weight: 10, release_date: nil, description: 'New product for RB - this is a brand new product and a new printing process providing a unique case product to RB. Design and build the customer, artsits and fulfillment experience related to the new product.')
Project.create(team_id: 4, name: 'Nigel - Product Platform', status: 1, is_capitalizable: true, weight: 15, release_date: nil, description: 'Development of a platform that can efficiently scale to support dramatic increase of physical products')

# Project of Team 2
Project.create(team_id: 5, name: 'Spanish website content translation', status: 1, is_capitalizable: true, weight: 10, release_date: nil, description: 'Preparing the content (including legals and translations of existing content) for launching the site in Spanish')
Project.create(team_id: 5, name: 'Globalized process tooling', status: 1, is_capitalizable: true, weight: 90, release_date: nil, description: 'Now that RB.com has been internationalised (German, French and Spanish) we need to build tools for the engineering team to improve the time it takes & reduce the effort of gettting new features translated into the non-English languages and deployed to the production environment.')

# Project of Team 3
Project.create(team_id: 6, name: 'Checkout - Conversion', status: 1, is_capitalizable: true, weight: 20, release_date: nil, description: 'Improving the conversion rate of users who are adding to cart through to purchase, by simplifying the process and reducing unnecessary steps')
Project.create(team_id: 6, name: 'Stripe Payment Gateway', status: 1, is_capitalizable: true, weight: 70, release_date: nil, description: 'Introducing the ability to pay using the third party Stripe payment gateway')

# Project of Team 4
Project.create(team_id: 7, name: 'Homepage - Hero Banner', status: 1, is_capitalizable: true, weight: 60, release_date: nil, description: 'Refresh the home page by adding a new hero banner and moving the campaign banner into the feed')
Project.create(team_id: 7, name: 'Icarus - Improve Product Support', status: 1, is_capitalizable: true, weight: 10, release_date: nil, description: 'Support more products in Icarus to allow Marketing to send out more targeted emails')
Project.create(team_id: 7, name: 'Homepage and Discover Experience - Cleanup', status: 1, is_capitalizable: true, weight: 30, release_date: nil, description: 'Clean up of a few loose ends in /discover and the homepage, including Translations and Content')

# Project of Team 5
Project.create(team_id: 3, name: 'Query Independent Score (used to be dependant)', status: 1, is_capitalizable: true, weight: 60, release_date: nil, description: 'Rank search results based on user click behaviour, promoting results with a higher probability of conversion')
Project.create(team_id: 3, name: 'Search UX Discovery', status: 1, is_capitalizable: true, weight: 20, release_date: nil, description: 'Discover usability issues with search on Redbubble, and validate potential solutions. ')
Project.create(team_id: 3, name: 'Artist Ranking feature for search ranking', status: 1, is_capitalizable: true, weight: 20, release_date: nil, description: '')

# Project of Team 6
Project.create(team_id: 2, name: 'Shopping feed - Popular Products', status: 1, is_capitalizable: true, weight: 50, release_date: nil, description: 'Populate the Shopping Feed with products that have a high probability of sales to improve revenue and CTR from Google Shopping and related channels')
Project.create(team_id: 2, name: 'Search Remarketing Emails', status: 1, is_capitalizable: true, weight: 50, release_date: nil, description: 'Send remarketing emails to users based on recent search activity on site to increase GTV from email channel')

# Project of Team 7
Project.create(team_id: 1, name: 'Resilient web application platform', status: 1, is_capitalizable: true, weight: 70, release_date: nil, description: 'Building tooling to manage resilient web applications')
Project.create(team_id: 1, name: 'Solr in AWS', status: 1, is_capitalizable: true, weight: 10, release_date: nil, description: 'Building scalable and resilient search infrastructure')
Project.create(team_id: 1, name: 'Continuous Delivery', status: 1, is_capitalizable: true, weight: 5, release_date: nil, description: 'Enable automatic deployments of code')

# Project of Team 8
Project.create(team_id: 8, name: 'Feed filtering ', status: 1, is_capitalizable: true, weight: 40, release_date: nil, description: 'Update prototype with discovered feed filtering pattern - allowing user to switch between topic based content, discovery on feed/filtering')
Project.create(team_id: 8, name: 'GraphQL API', status: 1, is_capitalizable: true, weight: 30, release_date: nil, description: 'Updated API with caching, volumes, volumes pagination')
Project.create(team_id: 8, name: 'Production App', status: 1, is_capitalizable: true, weight: 30, release_date: nil, description: 'Build product version of prototype which will be released Q3/4, specifically build out known feed structures ')

# Project of Team 9
Project.create(team_id: 9, name: 'Artist Driven Audience Profile Pages', status: 1, is_capitalizable: true, weight: 100, release_date: nil, description: 'Improve artist profile pages for conversion and sharability')


# Employee initialize
=begin
      t.string :name
      t.string :title
      t.boolean :status
      t.integer :employment_type 1: permanent 2: contract
      t.float :hourly_rate
      t.integer :location 1: Australia, 2: LA
      t.integer :capitalizable_group_id
      t.datetime :commencement_date
      t.datetime :termination_date
=end

#emplyee 1
#Employee.create(name: '', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 1, commencement_date: nil, termination_date: nil)

#emplyee 1
Employee.create(name: 'Marcus Flint', title: '', status: true, employment_type: 1, hourly_rate: 25, location:0, capitalizable_group_id: 1, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 1, employee_id: 1, dedication_weight: 100)
#emplyee 2
Employee.create(name: 'Harry Potter', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 1, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 2, employee_id: 2, dedication_weight: 100)
#emplyee 3
Employee.create(name: 'Rita Skeeter', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 1, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 3, employee_id: 3, dedication_weight: 100)
#emplyee 4
Employee.create(name: 'Dudley Dursley', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 1, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 4, employee_id: 4, dedication_weight: 100)
#emplyee 5
Employee.create(name: 'Salazar Slytherin', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 1, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 5, employee_id: 5, dedication_weight: 100)
#emplyee 6
Employee.create(name: 'Remus Lupin', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 1, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 6, employee_id: 6, dedication_weight: 100)
#emplyee 7
Employee.create(name: 'Cedric Diggory', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 1, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 7, employee_id: 7, dedication_weight: 100)
#emplyee 8
Employee.create(name: 'Horace Slughorn', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 1, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 8, employee_id: 8, dedication_weight: 100)
#emplyee 9
Employee.create(name: 'Alicia Spinnet', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 1, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 9, employee_id: 9, dedication_weight: 100)
#emplyee 10
Employee.create(name: 'Cornelius Fudge', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 1, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 1, employee_id: 10, dedication_weight: 100)
#emplyee 11
Employee.create(name: 'Gilderoy Lockhart', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 1, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 2, employee_id: 11, dedication_weight: 100)
#emplyee 12
Employee.create(name: 'Nymphadora Tonks', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 1, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 3, employee_id: 12, dedication_weight: 100)
#emplyee 13
Employee.create(name: 'Minerva McGonagall', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 1, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 4, employee_id: 13, dedication_weight: 100)
#emplyee 14
Employee.create(name: 'Blaise Zabini', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 1, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 6, employee_id: 14, dedication_weight: 100)
#emplyee 15
Employee.create(name: 'Dedalus Diggle', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 1, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 7, employee_id: 15, dedication_weight: 100)
#emplyee 16
Employee.create(name: 'Lucius Malfoy', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 1, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 8, employee_id: 16, dedication_weight: 100)
#emplyee 17
Employee.create(name: 'Thomas Riddle', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 1, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 1, employee_id: 17, dedication_weight: 100)
#emplyee 18
Employee.create(name: 'Lavender Brown', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 1, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 2, employee_id: 18, dedication_weight: 100)
#emplyee 19
Employee.create(name: 'Filius Flitwick', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 1, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 3, employee_id: 19, dedication_weight: 100)
#emplyee 20
Employee.create(name: 'Garrick Ollivander', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 1, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 4, employee_id: 20, dedication_weight: 100)
#emplyee 21
Employee.create(name: 'Fred Weasley', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 1, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 6, employee_id: 21, dedication_weight: 100)
#emplyee 22
Employee.create(name: 'Fenrir Greyback', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 1, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 7, employee_id: 22, dedication_weight: 100)
#emplyee 23
Employee.create(name: 'Peter Pettigrew', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 1, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 8, employee_id: 23, dedication_weight: 100)
#emplyee 24
Employee.create(name: 'Lee Jordan', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 1, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 1, employee_id: 24, dedication_weight: 100)
#emplyee 25
Employee.create(name: 'Lily Potter', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 1, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 2, employee_id: 25, dedication_weight: 100)
#emplyee 26
Employee.create(name: 'Poppy Pomfrey', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 1, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 3, employee_id: 26, dedication_weight: 100)
#emplyee 27
Employee.create(name: 'Godric Gryffindor', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 1, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 4, employee_id: 27, dedication_weight: 100)
#emplyee 28
Employee.create(name: 'Cho Chang', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 1, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 6, employee_id: 28, dedication_weight: 100)
#emplyee 29
Employee.create(name: 'Marge Dursley', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 1, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 7, employee_id: 29, dedication_weight: 100)
#emplyee 30
Employee.create(name: 'Penelope Clearwater', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 1, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 3, employee_id: 30, dedication_weight: 100)
#emplyee 31
Employee.create(name: 'Mundungus Fletcher', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 1, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 4, employee_id: 31, dedication_weight: 100)
#emplyee 32
Employee.create(name: 'Arthur Weasley', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 1, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 6, employee_id: 32, dedication_weight: 100)
#emplyee 33
Employee.create(name: 'Nicolas Flamel', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 1, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 4, employee_id: 33, dedication_weight: 100)
#emplyee 34
Employee.create(name: 'George Weasley', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 1, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 6, employee_id: 34, dedication_weight: 100)
#emplyee 35
Employee.create(name: 'Moaning Myrtle', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 1, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 4, employee_id: 35, dedication_weight: 100)
#emplyee 36
Employee.create(name: 'Ginny Weasley', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 1, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 4, employee_id: 36, dedication_weight: 100)
#emplyee 37
Employee.create(name: 'Andromeda Tonks', title: '', status: true, employment_type: 2, hourly_rate: 25, location:1, capitalizable_group_id: 1, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 1, employee_id: 37, dedication_weight: 100)
#emplyee 38
Employee.create(name: 'Lord Voldemort', title: '', status: true, employment_type: 2, hourly_rate: 25, location:1, capitalizable_group_id: 1, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 4, employee_id: 38, dedication_weight: 100)
#emplyee 39
Employee.create(name: 'Argus Filch', title: '', status: true, employment_type: 2, hourly_rate: 25, location:1, capitalizable_group_id: 1, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 5, employee_id: 39, dedication_weight: 100)
#emplyee 40
Employee.create(name: 'Percy Weasley', title: '', status: true, employment_type: 2, hourly_rate: 25, location:1, capitalizable_group_id: 1, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 6, employee_id: 40, dedication_weight: 100)
#emplyee 41
Employee.create(name: 'Augusta Longbottom', title: '', status: true, employment_type: 2, hourly_rate: 25, location:1, capitalizable_group_id: 1, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 8, employee_id: 41, dedication_weight: 100)
#emplyee 42
Employee.create(name: 'Helga Hufflepuff', title: '', status: true, employment_type: 2, hourly_rate: 25, location:1, capitalizable_group_id: 1, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 9, employee_id: 42, dedication_weight: 100)
#emplyee 43
Employee.create(name: 'Dean Thomas', title: '', status: true, employment_type: 2, hourly_rate: 25, location:1, capitalizable_group_id: 1, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 4, employee_id: 43, dedication_weight: 100)
#emplyee 44
Employee.create(name: 'Millicent Bulstrode', title: '', status: true, employment_type: 2, hourly_rate: 25, location:1, capitalizable_group_id: 1, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 5, employee_id: 44, dedication_weight: 100)
#emplyee 45
Employee.create(name: 'Marvolo Gaunt', title: '', status: true, employment_type: 2, hourly_rate: 25, location:1, capitalizable_group_id: 1, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 4, employee_id: 45, dedication_weight: 100)
#emplyee 46
Employee.create(name: 'Oliver Wood', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 2, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 1, employee_id: 46, dedication_weight: 100)
#emplyee 47
Employee.create(name: 'Barty Crouch', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 2, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 2, employee_id: 47, dedication_weight: 50)
TeamMember.create(team_id: 3, employee_id: 47, dedication_weight: 50)
#emplyee 48
Employee.create(name: 'Rowena Ravenclaw', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 2, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 4, employee_id: 48, dedication_weight: 100)
#emplyee 49
Employee.create(name: 'Frank Longbottom', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 2, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 5, employee_id: 49, dedication_weight: 50)
TeamMember.create(team_id: 6, employee_id: 49, dedication_weight: 50)
#emplyee 50
Employee.create(name: 'Seamus Finnigan', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 2, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 7, employee_id: 50, dedication_weight: 50)
TeamMember.create(team_id: 8, employee_id: 50, dedication_weight: 50)
#emplyee 51
Employee.create(name: 'Viktor Krum', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 2, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 9, employee_id: 51, dedication_weight: 100)
#emplyee 52
Employee.create(name: 'Draco Malfoy', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 2, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 1, employee_id: 52, dedication_weight: 100)
#emplyee 53
Employee.create(name: 'Luna Lovegood', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 2, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 2, employee_id: 53, dedication_weight: 40)
TeamMember.create(team_id: 3, employee_id: 53, dedication_weight: 40)
TeamMember.create(team_id: 9, employee_id: 53, dedication_weight: 20)
#emplyee 54
Employee.create(name: 'Quirinus Quirrell', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 2, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 4, employee_id: 54, dedication_weight: 50)
TeamMember.create(team_id: 5, employee_id: 54, dedication_weight: 50)
#emplyee 55
Employee.create(name: 'Pomona Sprout', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 2, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 6, employee_id: 55, dedication_weight: 100)
#emplyee 56
Employee.create(name: 'Severus Snape', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 2, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 7, employee_id: 56, dedication_weight: 100)
#emplyee 57
Employee.create(name: 'Alice Longbottom', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 2, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 8, employee_id: 57, dedication_weight: 100)
#emplyee 58
Employee.create(name: 'Bellatrix Lestrange', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 2, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 4, employee_id: 58, dedication_weight: 100)
#emplyee 59
Employee.create(name: 'Amos Diggory', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 2, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 6, employee_id: 59, dedication_weight: 100)
#emplyee 60
Employee.create(name: 'Albus Dumbledore', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 2, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 7, employee_id: 60, dedication_weight: 100)
#emplyee 61
Employee.create(name: 'Alastor Moody', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 2, commencement_date: nil, termination_date: nil)

TeamMember.create(team_id: 2, employee_id: 61, dedication_weight: 10)
TeamMember.create(team_id: 3, employee_id: 61, dedication_weight: 15)
TeamMember.create(team_id: 4, employee_id: 61, dedication_weight: 20)
TeamMember.create(team_id: 5, employee_id: 61, dedication_weight: 10)
TeamMember.create(team_id: 6, employee_id: 61, dedication_weight: 10)
TeamMember.create(team_id: 7, employee_id: 61, dedication_weight: 15)
TeamMember.create(team_id: 8, employee_id: 61, dedication_weight: 15)
TeamMember.create(team_id: 9, employee_id: 61, dedication_weight: 5)
#emplyee 62
Employee.create(name: 'Fleur Delacour', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 2, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 2, employee_id: 62, dedication_weight: 10)
TeamMember.create(team_id: 3, employee_id: 62, dedication_weight: 15)
TeamMember.create(team_id: 4, employee_id: 62, dedication_weight: 20)
TeamMember.create(team_id: 5, employee_id: 62, dedication_weight: 10)
TeamMember.create(team_id: 6, employee_id: 62, dedication_weight: 10)
TeamMember.create(team_id: 7, employee_id: 62, dedication_weight: 15)
TeamMember.create(team_id: 8, employee_id: 62, dedication_weight: 15)
TeamMember.create(team_id: 9, employee_id: 62, dedication_weight: 5)
#emplyee 63
Employee.create(name: 'Gabrielle Delacour', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 3, commencement_date: nil, termination_date: nil)
TeamMember.create(team_id: 1, employee_id: 63, dedication_weight: 15)
TeamMember.create(team_id: 2, employee_id: 63, dedication_weight: 10)
TeamMember.create(team_id: 3, employee_id: 63, dedication_weight: 15)
TeamMember.create(team_id: 4, employee_id: 63, dedication_weight: 20)
TeamMember.create(team_id: 5, employee_id: 63, dedication_weight: 10)
TeamMember.create(team_id: 6, employee_id: 63, dedication_weight: 10)
TeamMember.create(team_id: 7, employee_id: 63, dedication_weight: 15)
TeamMember.create(team_id: 9, employee_id: 63, dedication_weight: 5)
#emplyee 64
Employee.create(name: 'Hermione Granger', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 4, commencement_date: nil, termination_date: nil)
#emplyee 65
#Employee.create(name: '', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 4, commencement_date: nil, termination_date: nil)
#emplyee 66
#Employee.create(name: '', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 1, commencement_date: nil, termination_date: nil)
#emplyee 67
#Employee.create(name: '', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 1, commencement_date: nil, termination_date: nil)
#emplyee 68
#Employee.create(name: '', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 1, commencement_date: nil, termination_date: nil)
#emplyee 69
#Employee.create(name: '', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 1, commencement_date: nil, termination_date: nil)
#emplyee 70
#Employee.create(name: '', title: '', status: true, employment_type: 1, hourly_rate: 25, location:1, capitalizable_group_id: 1, commencement_date: nil, termination_date: nil)
