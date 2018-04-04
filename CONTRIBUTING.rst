============
Contributing
============

Introduction
------------

First off, thank you for considering contributing to sari-sari. sari-sari is a community-driven project, so it's people like you that make sari-sari useful and successful.

Following these guidelines helps to communicate that you respect the time of the developers managing and developing this open source project. In return, they should reciprocate that respect in addressing your issue, assessing changes, and helping you finalize your pull requests.

We love contributions from community members, just like you! There are many ways to contribute, from writing tutorials or examples, improvements to the documentation, submitting bug report and feature requests, or even writing code which can be incorporated into sari-sari for everyone to use. If you get stuck at any point you can create an `issue on GitHub <https://github.com/njncalub/sari-sari/issues>`_ or contact us at one of the other channels mentioned below.

For more information on contributing to open source projects, `GitHub's own guide <https://guides.github.com/activities/contributing-to-open-source/>`_ is a great starting point.

Getting Started
---------------

Interested in helping build sari-sari? Have a few minutes to tackle an issue? In this guide we will get you setup and integrated into contributing to sari-sari!

What Can I Do?
^^^^^^^^^^^^^^
* Tackle any `issues <https://github.com/njncalub/sari-sari/issues>`_ you wish! We have a special label for issues that beginners might want to try. Have a look at our `current beginner issues <https://github.com/njncalub/sari-sari/issues?q=is%3Aopen+is%3Aissue+label%3A%22Difficulty%3A+Beginner%22>`_.

* Contribute code you already have. It doesn’t need to be perfect! We will help you clean
  things up, test it, etc.

* Make a tutorial or example of how to do something.

How Can I Talk to You?
^^^^^^^^^^^^^^^^^^^^^^
Discussion of sari-sari development often happens in the issue tracker and in pull requests. In addition, the developers monitor the `Gitter chat room <https://gitter.im/sari-sari>`_ for the project as well.

Ground Rules
^^^^^^^^^^^^
The goal is to maintain a diverse community that's pleasant for everyone. Please be considerate and respectful of others by following our `code of conduct <https://github.com/njncalub/sari-sari/blob/master/CODE_OF_CONDUCT.rst>`_. Other items:

* Each pull request should consist of a logical collection of changes. You can include multiple bug fixes in a single pull request, but they should be related. For unrelated changes, please submit multiple pull requests.

* Do not commit changes to files that are irrelevant to your feature or bugfix (eg: .gitignore).

* Be willing to accept criticism and work on improving your code; we don't want to break other users' code, so care must be taken not to introduce bugs.

* Be aware that the pull request review process is not immediate, and is generally proportional to the size of the pull request.

Reporting a bug
^^^^^^^^^^^^^^^
When creating a new issue, please be as specific as possible. Include the version of the code you were using, as well as what operating system you are running. If possible, include complete, minimal example code that reproduces the problem.

Pull Requests
^^^^^^^^^^^^^
**Working on your first Pull Request?** You can learn how from this *free* video series `How to Contribute to an Open Source Project on GitHub <https://egghead.io/courses/how-to-contribute-to-an-open-source-project-on-github>`_, Aaron Meurer's `tutorial on the git workflow <https://www.asmeurer.com/git-workflow/>`_, or the guide `“How to Contribute to Open Source" <https://opensource.guide/how-to-contribute/>`_.

We love pull requests from everyone. Fork, then clone the repo: ::

    $ git clone git@github.com:your-username/sari-sari.git

Install dependencies for your machine and Python environment. ::

    $ ./utility/install_os_dependencies.sh
    $ ./utility/install_python_dependencies.sh

Create your database. In this setup, we'll be using `PostgreSQL <https://www.postgresql.org/download/>`_. ::

    $ sudo -u postgres psql
    $ CREATE USER <POSTGRES_USER> WITH PASSWORD '<POSTGRES_PASSWORD>';
    $ CREATE DATABASE <POSTGRES_DB>;
    $ ALTER ROLE <POSTGRES_USER> SET client_encoding TO "utf8";
    $ ALTER ROLE <POSTGRES_USER> SET default_transaction_isolation TO "read committed";
    $ ALTER ROLE <POSTGRES_USER> SET timezone TO "UTC";
    $ GRANT ALL PRIVILEGES ON DATABASE <POSTGRES_DB> TO <POSTGRES_USER>;
    $ \q

You can also create a .env file on your project's root directory. ::

    $ echo "DATABASE_URL=postgres://<POSTGRES_USER>:<POSTGRES_PASSWORD>@<DB_HOST>:<DB_PORT>/<POSTGRES_DB>" > .env
    $ export DJANGO_READ_DOT_ENV_FILE=True

Migrate your database. ::

    $ python manage.py migrate

Make your change. Add tests for your change and make sure the tests pass: ::

    $ py.test

Commit the changes you made. Chris Beams has written a `guide <https://chris.beams.io/posts/git-commit/>`_ on how to write good commit messages.

Push to your fork and `submit a pull request <https://github.com/njncalub/sari-sari/compare/>`_.

For the Pull Request to be accepted, you need to agree to the sari-sari Contributor License Agreement (CLA). This will be handled automatically upon submission of a Pull Request.

See `here <https://github.com/njncalub/sari-sari/blob/master/CLA.md>`_ for more explanation and rationale behind sari-sari's CLA.

Code Review
^^^^^^^^^^^
Once you've submitted a Pull Request, at this point you're waiting on us. You should expect to hear at least a comment within a couple of days. We may suggest some changes or improvements or alternatives.

Some things that will increase the chance that your pull request is accepted:

* Write tests.
* Follow `PEP8 <http://pep8.org>`_ for style. (The `flake8` utility can help with this.)
* Write a `good commit message <https://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html>`_.

Pull requests will automatically have tests run by Travis. This includes running both the unit tests as well as the *flake8* code linter.


Other Channels
^^^^^^^^^^^^^^
If you're interested in contacting us or being a part of the community in other ways, feel free to contact us in
`sari-sari's Gitter Channel <https://gitter.im/sari-sari>`_, ask questions using the `"sari-sari" tag on Stack Overflow <https://stackoverflow.com/questions/tagged/sari-sari>`_, or send an email to [njncalub's address](mailto:njncalub+sarisari@gmail.com).
