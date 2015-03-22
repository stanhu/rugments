Quickstart
==========

.. code-block:: ruby

    require 'rugments'

    source = File.read('/etc/bashrc')
    formatter = Rugments::Formatters::HTML.new(
      linenos: 'table',
      lineanchors: true,
      anchorlinenos: true
    )
    lexer = Rugments::Lexer.find_by_name('bash')
    puts formatter.render(lexer.lex(source))


Redcarpet Integration
---------------------

.. code-block:: ruby

    require 'redcarpet'
    require 'rugments'
    require 'rugments/plugins/redcarpet'

    class HTML < Redcarpet::Render::HTML
      include Rouge::Plugins::Redcarpet
    end
