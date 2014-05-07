module MotionKit
  class NoContextError < Exception
  end
  class ContextConflictError < Exception
  end
  class InvalidRootError < Exception
  end
  class InvalidDeferredError < Exception
  end
  class ApplyError < Exception
  end
  class NoSuperviewError < Exception
  end
  class NoCommonAncestorError < Exception
  end
end
::MK = MotionKit unless defined?(::MK)
