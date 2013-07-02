require "soft_reference/version"

class SoftReference
  if defined? Java

    Reference = Java::java.lang.ref.SoftReference

    def initialize obj
      @ref = obj.nil? ? nil : Reference.new(obj)
    end

    def get
      @ref.nil? ? nil : @ref.get
    end

  else

    require 'weakref'

    class Reference
      def initialize obj
        @obj = obj
      end

      def get
        @obj
      end
    end

    def initialize obj
      @ref = obj.nil? ? Reference.new(nil) : WeakRef.new(Reference.new(obj))
    end

    def get
      begin
        @ref.get
      rescue WeakRef::RefError
        nil
      end
    end
  end
end
