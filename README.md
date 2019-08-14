*Alum network setup - server and client*

You may need to install Ruby and/or update your Ruby version. Try installing RVM or rbenv to manage Ruby versions.

This project requires you to have:
Ruby 2.4.1

Clone down project to your local machine. In your terminal, run:

`bundle install` (if you error out here, it’s likely due to an incompatible Ruby version)
`rake db:create`
`rake db:migrate`
`rake db:seed`

`rspec` to run the test suite on the server

`rails s` to run server

in a second terminal tab:
cd into client (`/app/alum_network_client`)
`npm install`
`npm start` to run client
