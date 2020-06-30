require 'byebug'
$stdout.sync = true

module Bundler
  module Why
    class Command < ::Bundler::Plugin::API
      command "why"

      def exec(command, args)
        if args.length == 1
          why(args.first)
        else
          warn 'Usage: bundle why gemname'
        end
      end

      private

      # `Bundler.load` is a memoized method, so it's OK if we call it a few
      # times.
      # @return Bundler::Runtime
      def runtime
        Bundler.load
      end

      # @param spec_set Bundler::SpecSet
      # @param gem_name String
      # @return Bundler::StubSpecification
      def find_one_spec_in_set(spec_set, gem_name)
        specs = runtime.specs[gem_name]
        if specs.length == 1
          specs.first
        else
          raise Error, format(
            'Expected gem name to match exactly 1 spec, got %d',
            specs.length
          )
        end
      end

      # @param path Array[Bundler::StubSpecification]
      # @void
      def print_path(path)
        puts path.map(&:name).join(' -> ')
      end

      # @param gem_name String
      # @void
      def why(gem_name)
        spec_set = runtime.specs
        spec = find_one_spec_in_set(spec_set, gem_name)
        traverse(spec_set, spec)
      end

      # @param spec_set Bundler::SpecSet
      # @param parent Bundler::StubSpecification
      # @param path Array[Bundler::StubSpecification]
      # @void
      def traverse(spec_set, parent, path = [parent])
        children = spec_set.select { |s|
          s.dependencies.any? { |d|
            d.type == :runtime && d.name == parent.name
          }
        }
        if children.empty?
          print_path(path)
        else
          children.each do |child|
            traverse(spec_set, child, [child].concat(path))
          end
        end
      end
    end
  end
end
