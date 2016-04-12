# waste-not-api

This is the api for the Waste Not App

Here are the docs for the endpoints
https://docs.google.com/presentation/d/1jaFXSg7GODEJr11FlJ6WqQGizS3iRZeMfHZES7sn4vo/edit?usp=sharing

How to test:

Run this curl request with the data substituted to sign up:
`curl --data "handle=$YOUR_HANDLE&email=$YOUR_EMAIL&password=123456" boiling-hamlet-59303.herokuapp.com/users/signup`

You will receive a token, this is important to write down, because you will need it to make other requests

If you do lose it, running this command:
`curl --data "email=$YOUR_EMAIL&password=123456" boiling-hamlet-59303.herokuapp.com/users/signup`

Will drop your last token and send you a new one to use

To create a group, you may run:
`curl --data "name=$YOUR_GROUP_NAME&token=$YOUR_TOKEN" boiling-hamlet-59303.herokuapp.com/groups/create`

This will create a group and automatically make you a member

To add a location to the group, sending this command:
`curl --data "name=$YOUR_LOCATION_NAME&token=$YOUR_TOKEN" boiling-hamlet-59303.herokuapp.com/locations/new`

Will add a location and send you back an ID that gets stored in the app's local database
