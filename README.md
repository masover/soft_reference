# SoftReference

Java's SoftReference is like a WeakReference, but with a slightly stronger bias against being garbage collected. It is useful for caches -- it is guaranteed to be collected before an OutOfMemoryError, but if your app has plenty of memory left, it will probably NOT be collected. (A WeakReference would be much more likely to be collected as soon as it's only weakly reachable.)

This gem wraps Java's SoftReference (for JRuby) when available, and uses WeakRef (from the Ruby standard library) when a real SoftReference is not available.

## Installation

I haven't published a gem yet. I figure I should build at least one actual use case before I inflict this on the world. If this sounds like it'd be useful to you, let me know and I'll publish a gem.

## Usage

    ref = SoftReference.new obj
    ref.get  # returns obj, or nil if obj has been garbage collected

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

Alternatively, offer to take this over and maintain it, or suggest a library it should belong to. It's 42 lines, for #{deity}'s sake!