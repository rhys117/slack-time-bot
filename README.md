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
- After consideration the following documentation best suited the applications purpose: https://api.slack.com/slash-commands

Let's focus on the key points of what happens when a slash command is issued from a slack app
- A user in Slack types in the message box with the command, and submits it.
- A data payload is sent via an HTTP POST request to the URL configured for that command in your app.
- The app responds in some way.

Considering this is a simple application that only needs to respond to a HTTP POST request I concluded that a simple ruby sinatra web application would be suitable for this task.

## 2. Development
#### Slack Workplace
As per the documentation I created a slack application. I already had a test slack 'workplace', so I added it to my existing workplace.

#### Considering working locally
Seeing as I wanted an endpoint that the slack api could point to during development I used ngrok to make my localhost reachable.

#### Configuring slash comand
I added a new slash command via the slack api portal that pointed to my ngrok forwarding addresses adding '/time'.

#### Setup of sinatra app
Adding the ruby-version file and Gemfile and adding the relevant gems. I also setup rspec as per the recipes.sinatrab documenation.