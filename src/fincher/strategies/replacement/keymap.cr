module Fincher
  module ReplacementStrategies
    class Keymap < Base
      getter keymap

      def initialize(@seed : UInt32, @keymap : Fincher::Types::Keymap)
      end

      def replace(to_replace : String | Char) : String | Char
        case to_replace
        when String
          to_replace.gsub { |c| keymap_replace(c) }
        else
          keymap_replace(to_replace)
        end
      end

      private def keymap_replace(to_replace)
        keymap_entry = keymap[to_replace]?

        if keymap_entry
          keymap_entry.neighbors.sample(sampler)
        else
          raise UnknownKeyError.new("Unknown key '#{to_replace}' in keymap")
        end
      end

      private def sampler
        @sampler ||= Random.new(seed)
      end
    end
  end
end
