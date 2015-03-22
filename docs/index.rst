.. rugments documentation master file, created by
   sphinx-quickstart on Sun Mar 22 12:14:41 2015.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Welcome to rugments's documentation!
====================================

Rugments is a syntax highlighter written in Ruby. It has been forked from Rouge_
in order to make it work with Gitlab. After some work I decided to maintain
Rugments as my own fork to improve the overall code quality. It can highlight
over 60 languages, and output e.g. HTML or ANSI 256-color text. Its HTML output
is compatible with stylesheets designed for pygments_.

.. warning::

    Rugments will gain a complete new API which aims to be very close to
    pygments. Currently there are no official stable releases yet. Rugments
    1.0.0.beta3 just includes some code style violation fixes and a new `HTML
    formatter`_. It can be considered as stable as there are no major changes.
    If you need documentation for Rugments 1.0.0.beta3 you still can have a look
    at Rouge and for the HTML formatter in the code. Everything else will be
    updated soon, but it is a lot of work.

.. _`HTML formatter`: https://github.com/rumpelsepp/rugments/blob/master/lib/rugments/formatters/html.rb
.. _Rouge: https://github.com/jneen/rouge
.. _pygments: http://pygments.org/


.. toctree::
   :maxdepth: 2

   quickstart
   api
   writing_lexers
   roadmap
   changelog
   authors
