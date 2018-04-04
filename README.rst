=========
sari-sari
=========

Item Inventory Management System

|djangoversion| |builtwith|
|buildstatus| |appveyor| |coverage|
|license| |prswelcome| |gitter|

.. |djangoversion| image:: https://img.shields.io/badge/Using%20Django-2.0.4-blue.svg
    :target: https://docs.djangoproject.com/en/2.0/releases/2.0.4
    :alt: Using Django 2.0.4

.. |builtwith| image:: https://img.shields.io/badge/built%20with-Cookiecutter%20Django-ff69b4.svg
    :target: https://github.com/pydanny/cookiecutter-django
    :alt: Built with cookiecutter-django

.. |buildstatus| image:: https://api.travis-ci.org/njncalub/sari-sari.svg?branch=master
    :target: https://travis-ci.org/njncalub/sari-sari
    :alt: Travis Build Status

.. |appveyor| image:: https://ci.appveyor.com/api/projects/status/github/njncalub/sari-sari?branch=master&svg=true
    :target: https://ci.appveyor.com/project/njncalub/sari-sari
    :alt: AppVeyor Build Status

.. |coverage| image:: https://coveralls.io/repos/njncalub/sari-sari/badge.svg?branch=master
    :target: https://coveralls.io/r/njncalub/sari-sari
    :alt: Code Coverage Status

.. |license| image:: https://img.shields.io/badge/License-MIT-blue.svg
    :target: https://github.com/njncalub/sari-sari/blob/master/LICENSE
    :alt: License

.. |prswelcome| image:: https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=round-square
    :target: https://egghead.io/series/how-to-contribute-to-an-open-source-project-on-github
    :alt: PRs Welcome
    
.. |gitter| image:: https://badges.gitter.im/sari-sari.svg
    :target: https://gitter.im/sari-sari?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge
    :alt: Gitter

Initial Setup
-------------

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

Run your Django server. ::

    $ python manage.py runserver 0.0.0.0

Setting Up Your Users
---------------------

* To create a **normal user account**, just go to Sign Up and fill out the form. Once you submit it, you'll see a "Verify Your E-mail Address" page. Go to your console to see a simulated email verification message. Copy the link into your browser. Now the user's email should be verified and ready to go.

* To create a **superuser account**, use this command: ::

    $ python manage.py createsuperuser

For convenience, you can keep your normal user logged in on Chrome and your superuser logged in on Firefox (or similar), so that you can see how the site behaves for both kinds of users.

Test coverage
-------------

To run the tests, check your test coverage, and generate an HTML coverage report ::

    $ coverage run manage.py test
    $ coverage html
    $ open htmlcov/index.html

Running tests with py.test
--------------------------

Make your change. Add tests for your change. Make sure the tests pass: ::

    $ py.test

Contributing
------------

**Imposter syndrome disclaimer**: We want your help. No, really.

There may be a little voice inside your head that is telling you that you're not ready to be an open source contributor; that your skills aren't nearly good enough to contribute. What could you possibly offer a project like this one?

We assure you - the little voice in your head is wrong. If you can write code at all, you can contribute code to open source. Contributing to open source projects is a fantastic way to advance one's coding skills. Writing perfect code isn't the measure of a good developer (that would disqualify all of us!); it's trying to create something, making mistakes, and learning from those mistakes. That's how we all improve, and we are happy to help others learn.

Being an open source contributor doesn't just mean writing code, either. You can help out by writing documentation, tests, or even giving feedback about the project (and yes - that includes giving feedback about the contribution process). Some of these contributions may be the most valuable to the project as a whole, because you're coming to the project with fresh eyes, so you can see the errors and assumptions that seasoned contributors have glossed over.

For more information, please see the `contributing guide <https://github.com/njncalub/sari-sari/blob/master/CONTRIBUTING.rst>`_.
