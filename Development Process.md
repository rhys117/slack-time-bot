# Task
Write a Slack bot that responds to a slash command with the current time of day.
Specifications
- Choose any programming language you are comfortable with
- Bot should respond to slash command (e.g. ‘/time’) in a public channel
- Expected time taken: 1-2 hours
- Response formatting and structure is up to you

# Development Process
### 1. Identify Needs
Searching Slacks API docs. 
- After consideration the following documentation best suited the requirements of the task: https://api.slack.com/slash-commands

Let's focus on the key points of what happens when a slash command is issued from a slack app
- A user in Slack types in the message box with the command, and submits it.
- A data payload is sent via an HTTP POST request to the URL configured for that command in your app.
- The app responds in some way.

Considering this is a simple application that only needs to respond to a HTTP POST request I concluded that a simple ruby sinatra web application would be suitable for this task.

I then planned to use the following tools 
- Ngrok locally
- Travis CI 
- Docker 
- AWS

## 2. Development
#### Slack Workplace
As per the documentation I created a slack application. I already had a test slack 'workplace', so I added it to my existing workplace.

#### Considering working locally
Seeing as I wanted an endpoint that the slack api could point to during development I used ngrok to make my localhost reachable.

#### Configuring slash comand
I added a new slash command via the slack api portal that pointed to my ngrok forwarding addresses adding '/time'.

#### Setup of sinatra app
Adding the ruby-version file and Gemfile and adding the relevant gems. I also setup rspec as per the recipes.sinatrab documentation.

#### Wrote some tests
Wrote two basic rspec tests to cover if the app was responding to post requests to /time and if it was sending back the current time as the body of the response.

#### Wrote the code
Now the easy bit. Wrote the post request to respond with the current time in a string format.

#### Confirmed the tests were passing and also tested in the slack general channel. 
Perfect! It's working.

## 3. Further Considerations
#### Our time isn't very readable. "2019-07-11 17:51:55 +1000"
Lets fix that with strftime. Now we have something much more readable 'The current time is: 18:45:52 PM'

Our test is now failing due to time taken to run the extra bit of code when comparing Time.now. 
I changed the test to ensure that the times being compared were within acceptable ranges.

#### Security
Right now anyone could hit our api and get a response. Lets change that as per the slack api docs regarding verifying requests found here: 
https://api.slack.com/docs/verifying-requests-from-slack#signing_secrets_admin_page

I've added a before block that will return 403 unless the request is validated.

## CI/CD
We have our app, but now what about deploying it. Lets dockerize our app and ensure it's production ready.

I've added a dockerfile and a dockerfile.dev and setup a docker-compose file for local development.

I've configured a travis yml file and added it to Travis CI. 

Now once changes are pushed to master travis will build my docker images and run my tests and send me a report.

## AWS
Afterwards I've setup an elasticbeanstalk instance and iem keys and added the configuration to the travis yml and setup my env variables on aws.

I pushed my changes and confirmed that it was now running on AWS.

I then updated my my slash command in Slack API to have the AWS entpoint and confirmed that it was working. 

I also confirmed that attempts to hit the endpoint not from slack were getting 403 errors.

One thing I did notice was the time was wrong, I hadn't accounted for it running on american servers. I updated the dockerfile to include the correct timezone.

## Other thoughts
This still isn't perfect, It's running on WEBrick and doesn't have an nginx web server in front of it.

It might be nice to integrate options with the command such as timezone and give custom responses. 