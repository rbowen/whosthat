# Who's That?

Barebones CRM for tracking people, projects, and work teams.

With any luck, it will do more, eventually. Yes, it's in Perl, because
that's how old I am.

# Summary

    whosthat rcbowen <-- Details about person
    whoworkson airflow <-- list of people on that project or team
    addwho --name "Bob Marley" --alias bmarley <-- Creates a new person
        record
    editwho bmarley <-- Edits that user record

## Installing

Installing is a little manual for now. I'll fix that some day.

1. You'll need Perl, and a handful of modules

    cpan install Test::More
    cpan install YAML::Tiny

2. Edit lib/WhosThat.pm and set the $DATA variable to where you'd like to
store your data. In that directory:

    mkdir who
    mkdir project
    mkdir team

Sample data can be found in the sampledata/ directory. I store my data
files in Dropbox, so that it get sync'ed between my various systems.

3. Then run `install.sh`.  This will install the scripts in your
`~/perl5/bin` directory if you run it as you, and in the system
`perl5/bin` directory if you run it as root. That's probably in your
path, but if it's not, you may need to fix that.

e.g., by adding the following to your .bashrc

    export PATH="$PATH:$HOME/perl5/bin"

If there are any messages that indicate that a test
failed, you probably didn't create the data directories.

## Upgrading

If there's a new version, you can just

    git pull
    ./install.sh

## Usage

### whosthat <name>

Will list contact details for name, if found.

If its an @amazon.com email address, will provide a link to their
internal informational record.

### whoworkson <name>

Will look for either a TEAM or a PROJECT called *name* and tell you
who works on that.

### addwho

    addwho --name "Barney Rubble" --alias brubble

or

    addwho -n "Barney Rubble" -a brubble

Adds a new record for that invidual, and then opens it in $EDITOR for
further details. `alias` is usually an email address, and is used as the
name of the data file, so must be unique. If it's not unique, it will
complain at you.

Note that by default it gives them an @amazon.com email address. You can
fix that in lib/WhosThat.pm by editing the $DOMAIN variable.

### editwho brubble

Calm down. This just edits their data file in $EDITOR

### TODO

For now, this does exactly what I want it to do. I expect over time I'll
want more functionality, but simple is good. Tickets and pull requests
welcome.

