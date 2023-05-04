# Who's That?

Barebones CRM for tracking people, projects, and work teams.

With any luck, it will do more, eventually.

## Installing

Installing is a little manual for now. Maybe I'll fix that some day.

You'll need Perl, and a handful of modules

  cpan install Test::More
  cpan install YAML::Tiny

Edit lib/WhosThat.pm and set the $DATA variable to where you'd like to
store your data. In that directory:

    mkdir who
    mkdir project
    mkdir team

Then run install.sh

## Usage

### whosthat <name>

* Will list contact details for name, if found.
* Will list information, and a list of people, for a project or team,
  if found.

Eventually, will also allow adding/editing of these things, but for now,
we'll just manually edit yaml files.

And there should be a simple web interface, on twist.rcbowen.com, where
I can browse people, projects and team. Eventually. Not today.

Ok, go.

### whoworkson <name>

Will look for either a SERVICE or a PROJECT called *name* and tell you
who works on that.

### addwho

addwho --name "Barney Rubble" --alias brubble
or
addwho -n "Barney Rubble" -a brubble

Adds a new record for that invidual, and then opens it in $EDITOR for
further details. `alias` is usually an email address, and is used as the
name of the data file, so must be unique.

### editwho brubble

Edit their data file in $EDITOR

### TODO

For now, you'll need to manually create any team and project YAML files.
See the sampledata directory for what this should look like.

