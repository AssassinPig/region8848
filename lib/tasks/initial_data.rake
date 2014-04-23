namespace :db do
  desc "initialize zhufeng's data" 
    task :populate => :environment do
      #Rake::Task['db:reset'].invoke
      make_initialize
      #make_categories
      #make_posts
  end
end

def make_initialize
  User.create!( :name => 'assassinpig',
                :email => 'assassinpig@gmail.com',
                :password => 'zhuzhushuai',
                :password_confirmation => 'zhuzhushuai',
                :admin => 1)
end

def make_categories
  Category.create(:name => 'default category')
end

def make_posts
  category = Category.first
  category.posts.create(:title => "title1",
                       :content => "title1-content1")
end
