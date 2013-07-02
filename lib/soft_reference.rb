require "soft_reference/version"

class SoftReference
  if defined? Java

    Reference = Java::java.lang.ref.SoftReference

    def initialize obj
      @ref = Reference.new obj
    end

    def get
      @ref.get
    end

    def alive?
      @ref.get.nil?
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
      @ref = WeakRef.new Reference.new obj
    end

    def get
      begin
        @ref.get
      rescue WeakRef::RefError
        nil
      end
    end

    def alive?
      @ref.weakref_alive?
    end

  end
end
