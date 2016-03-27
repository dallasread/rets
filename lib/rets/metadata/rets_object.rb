module Rets
  module Metadata
    class RetsObject
      attr_reader :name, :mime_type, :description

      def initialize(name, mime_type, description)
        @name = name
        @mime_type = mime_type
        @description = description
      end

      def self.build(rets_object_fragment)
        rets_object_fragment = downcase_hash_keys(rets_object_fragment)
        name = rets_object_fragment["visiblename"]
        mime_type = rets_object_fragment["mimetype"]
        description = rets_object_fragment["description"]
        new(object_type, name, mime_type, description)
      end

      def print_tree(out = $stdout)
        out.puts "  Object: #{name}"
        out.puts "    MimeType: #{mime_type}"
        out.puts "    Description: #{description}"
      end

      def ==(other)
        name == other.name &&
          mime_type == other.mime_type &&
          description == other.description
      end

      private
      def self.downcase_hash_keys(hash)
        Hash[hash.map { |k, v| [k.downcase, v] }]
      end
    end
  end
end
