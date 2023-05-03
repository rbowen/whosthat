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

## Install

perl Makefile.PL
make
make test
make install

