# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'soft_reference/version'

Gem::Specification.new do |spec|
  spec.name          = "soft_reference"
  spec.version       = SoftReference::VERSION
  spec.authors       = ['David Masover']
  spec.email         = ['masover@iastate.edu']
  spec.description   = 'Wrapper for java.lang.ref.SoftReference'
  spec.summary       = <<-END
                        Java's SoftReference is like a WeakReference, but with
                        a slightly stronger bias against being garbage
                        collected. It is useful for caches -- it is guaranteed
                        to be collected before an OutOfMemoryError, but if your
                        app has plenty of memory left, it will probably NOT be
                        collected. (A WeakReference would be much more likely
                        to be collected as soon as it's only weakly reachable.)

                        This gem wraps Java's SoftReference (for JRuby) when
                        available, and uses WeakRef (from the Ruby standard
                        library) when a real SoftReference is not available.
                      END
  spec.homepage      = ""
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
