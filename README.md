# Who's That?

Barebones CRM for tracking people, projects, and AWS service teams.

With any luck, it will do more, eventually.

## Usage

whosthat <name>

* Will list contact details for name, if found.
* Will list information, and a list of people, for a project or service,
  if found.

Eventually, will also allow adding/editing of these things, but for now,
we'll just manually edit yaml files.

And there should be a simple web interface, on twist.rcbowen.com, where
I can browse people, projects and services. Eventually. Not today.

Ok, go.

whoworkson <name>

Will look for either a SERVICE or a PROJECT called *name* and tell you
who works on that.

addwho --name "Barney Rubble" --alias brubble
or
addwho -n "Barney Rubble" -a brubble

Adds a new record for that invidual

editwho brubble

Edit their data file.

## TODO

Add a team designation that isn't a project or a service. Or ... should
we just rename service to team?

