# Backend API for a slack command bot that tells the time.
## Backend ENV variables that need to be set:
- SERVER_PORT
- SLACK_SIGNING_SECRET

The server port can be a any port of your choosing. 

The slack signing secret comes from the slack app itself and can be found under basics settings on api.slack.com.

If you're using this you'll need ot configure your slack app to have a slash command for /time that points to this API endpoint.
- eg. myapi.com/time