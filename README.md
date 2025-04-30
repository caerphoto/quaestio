# Quaestio

Demo Rails 8 web application. You can sign up to ask legal questions, and
verified lawyers can offer to answer, for a fee of their choosing.

In this demo you can approve yourself as a lawyer, allowing you to answer other
users' questions for a simulated fee payment.

Live demo available at:  
https://quaestio-4298fb2e0d38.herokuapp.com/

## Setup

This is a pretty standard Rails app, so setup is done in the usual way, assuming
you have Ruby 3.something installed:

* Clone the repo: `git clone https://github.com/caerphoto/quaestio`

* Switch to the newly-created directory and run `bin/setup`

The app should run, and you can now create an account and start posting
questions. If you like, you can create a secondary account and go through the
lawyer verification process so you can answer the questions of the first
account.

## Why did you

Creating a new Rails app from scratch is something of a novelty for me:
virtually all of the work I do for my job involves dealing with existing
applications, some of which have been around for nearly 15 years. Getting to
build this has been quite exciting, and is in a few cases the first time I've
had the chance to really get hands-on with new technologies, in particular
Turbo. Turns out, it's really nice, and it was interesting comparing it to some
previous experience I've had with HTMX. The latter feels easier to add to an
existing project, while Turbo seems to work best when the app is designed from
the start to use it.

I did initially get off to a rocky start when I tried to use Bootstrap, and got
into all kinds of asset-related stickiness for a while, so I cut my losses with
that one, and started afresh.

I have a tendency to spend endless hours fiddling with the UI, so for this
project I went with Simple.css just to get things going, and did my best to
resist tweaking everyhing. Hence the app looks quite basic, but hopefully still
plenty functional, and of course snappy, even on Heroku's basic slow tier
server.

I've also attempted where possible to make as much use of Rails's extensive
declarative-style functionality: using Active Record Associations, for example,
to manage as much of the ORM logic as possible.

Most of the complexity, really, is in the views: lots of HTML and Rails helper
use, which admittedly could be better organised and modularised; if only I had
more time... well, isn't that always the way?

## To do

I had some ideas that I wanted to include but didn't have time:

* A rating system for lawyers: once a user has provided payment for an answer,
  they can give it (and by extension, the lawyer who wrote it) a star rating.
  This rating would be visible to everyone prior to approving payment for an
  answer, so that ideally lawyers who give unhelpful answers are weeded out.

* An admin panel to manage users, questions, answers and categories. Kind of
  goes without saying; doing this via the Rails console is less than ideal.

* Rich text in questions and answers, via Markdown. Would need to be careful how
  it's presented in the UI, and require some careful setup of CSS to ensure it
  doesn't break the app layout.

