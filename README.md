# Padrino Blog Example App  

Just a little Blog example app to get to know the Padrino framework.  

I built the Authentication around ActiveRecord's `has_secure_password` and it was all built with TDD.  

It also has an 'admin' app that I built because a blog told me to ;-), but I've since realised that it's not actually much use for this app, so I might get rid of it, along with the `Account` model that comes with it.  

####Other ToDo's:  
- Refactor controller logic out into methods (not sure at the moment how to do this at the moment)  
- CSS  (especially building the navbar)  
- Check BCrypt's error handling, as might be able to eliminate form-error handling from the users_controller.  
- Make flash messages appear/disappear.  

Testing was done with RSpec and Capybara. Capybara took a bit of setting up, but nothing major (if you know what you're doing! Which I didn't, at first).  

It isn't deployed online yet. To run locally:  
`git clone git@github.com:Yorkshireman/padrino_blog.git`  
`bundle`  
`padrino start` starts the local server.  
- Navigate to [localhost:3000](http://localhost:3000) in your browser.  

To run the tests:  
`rspec`  
