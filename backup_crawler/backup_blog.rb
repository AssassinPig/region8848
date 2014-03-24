#encoding: utf-8
require 'mechanize'
require 'logger'

agent = Mechanize.new
agent.user_agent_alias='Mac Safari'
system("rm fetch.log")
agent.log = Logger.new "fetch.log"
todo_list = Array.new
visited_list = Array.new

define_method :initialize_crawler do 
  #todo_list << "http://region8848.herokuapp.com/static_pages/posts"
  todo_list << "http://192.168.0.120:3000/posts/1"
end

def crawler_main(agent, todo_list, visited_list)

  page = agent.get todo_list.first
  visited_list << todo_list.first

  while true
    post_title=String.new
    post_category=String.new
    post_content=String.new
    page.search('post_title').map do |node|
      post_title = node.text
      post_title.delete! "\n"
      post_title.lstrip!.rstrip!
    end

    page.search('post_category').map do |node|
      post_category=node.text
      post_category.rstrip!
    end

    page.search('post_content').map do |node|
      post_content=node.text
      post_content.rstrip!
    end

     save_file = File.join(File.expand_path(File.dirname(__FILE__) + "/web_fetched"), post_title) 

      #print "save file:#{save_file}\n" 
      File.open(save_file, "w+") do |file|
        file.puts post_category 
        file.puts post_content 
      end

     flag=false
     page.links_with(:href => /posts\/\d/).each do |link|

       if visited_list.include? link.href
         next
       end

       puts link.href
       visited_list << link.href

       flag=true
       page=link.click
       next
     end

     if flag==false
       break
     end

  end
end

initialize_crawler
crawler_main(agent, todo_list, visited_list)
