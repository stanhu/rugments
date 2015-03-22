API Documentation
=================

Aut be available at http://rubydoc.info/. Unfortunately currently the build with
yard fails...

Using the lexer DSL
-------------------

You can probably learn a lot just by reading through the existing lexers.
Basically, a lexer consists of a collection of states, each of which has several
rules.  A rule consists of a regular expression and an action, which yields
tokens and manipulates the state stack.  Each rule in the state on top of the
stack is tried *in order* until a match is found, at which point the action is
run, the match consumed from the stream, and the process repeated with the new
lexer on the top of the stack.  Each lexer has a special state called `:root`,
and the initial state stack consists of just this state.

Here's how you might use it:

.. code-block:: ruby

    class MyLexer < Rouge::RegexLexer
      state :root do
        # the "easy way"

        # simple rules
        rule /0x[0-9a-f]+/, Num::Hex

        # simple state stack manipulation
        rule /{-/, Comment, :next_state
        rule /-}/, Comment, :pop!

        # the "flexible way"
        rule /abc/ do |m|
          # m is the match, for accessing match groups manually

          # you can do the following things:
          pop!
          push :another_state
          push # assumed to be the current state
          state? :some_state # check if the current state is :some_state
          in_state? :some_state # check if :some_state is in the state stack

          # yield a token.  if no second argument is supplied, the value is
          # taken to be the whole match.
          # The sum of all the tokens yielded must be equivalent to the whole
          # match - otherwise characters will go missing from the user's input.
          token Generic::Output, m[0]

          # calls SomeOtherLexer.lex(str) and yields its output.  See the
          # HTML lexer for a nice example of this.
          # if no second argument is supplied, it is assumed to be the whole
          # match string.
          delegate SomeOtherLexer, str

          # the context object is the lexer itself, so you can stash state here
          @count ||= 0
          @count += 1

          # advanced: push a dynamically created anonymous state
          push do
            rule /.../, Generic::Output
          end
        end

        rule /(\w+)(:)/
          # "groups" yields the matched groups in order
          groups Name::Label, Punctuation
        end
      end

      start do
        # this is run whenever a fresh lex is started
      end
    end
