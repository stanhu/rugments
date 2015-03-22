Writing Lexers
==============

.. warning::

    This document is a work in progress. This lexer style is not implemented yet!

The lexer style differs a bit from rouge as the goal of rugments is clean design
without too much magic.

.. code-block:: ruby

    module Rugments
      module Lexers
        class Diff < LexerBase
          # Metadata of this lexer.
          @title = 'diff'
          @desc = 'Unified diffs or patches'
          @tag = 'diff'
          @aliases = %w(patch udiff)
          @filenames = %w(*.diff *.patch)
          @mimetypes = %w(text/x-diff text/x-patch)

          # If you want to define other class instance variables
          # like "@keywords" feel free to add them *below* the
          # metadata. Don't forget to create the getter methods.
          #
          #   attr_reader :keywords
          #
          #   @keywords = Set.new %w(
          #     auto break case const continue default do else enum extern
          #     for goto if register restricted return sizeof static struct
          #     switch typedef union volatile virtual while
          #   )

          # Here comes most important part:
          # State and rules definitions
          #
          # NOTE: Use parentheses for "rule" because "ruby -w" throws
          #       tons of warnings.
          state :header do
            rule(/^diff .*?\n(?=---|\+\+\+)/m, Generic::Heading)
            rule(/^--- .*?\n/, Generic::Deleted)
            rule(/^\+\+\+ .*?\n/, Generic::Inserted)
          end

          state :diff do
            rule(/@@ -\d+,\d+ \+\d+,\d+ @@.*?\n/, Generic::Heading)
            rule(/^\+.*?\n/, Generic::Inserted)
            rule(/^-.*?\n/, Generic::Deleted)
            rule(/^ .*?\n/, Text)
            rule(/^.*?\n/, Error)
          end

          state :root do
            mixin :header
            mixin :diff
          end

          # Add any methods *below* the state and rules definitions.
          def self.analyze_text(text)
            return 1 if text.start_with?('Index: ')
            return 1 if text.start_with?('diff ')
            return 0.9 if text =~ /\A---.*?\n\+\+\+/m
          end
        end
      end
    end
