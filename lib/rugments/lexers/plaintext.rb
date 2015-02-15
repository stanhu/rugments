module Rugments
  module Lexers
    class PlainText < Lexer
      title 'Plain Text'
      desc "A boring lexer that doesn't highlight anything"

      tag 'plaintext'
      aliases 'text'
      filenames '*.txt'
      mimetypes 'text/plain'

      def stream_tokens(string)
        yield Tokens::Text, string
      end
    end
  end
end
