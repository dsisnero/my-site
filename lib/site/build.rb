require "dry/monads"
require "dry/monads/do"
require "dry/monads/result"

module Site
  class Build
    include Dry::Monads::Result::Mixin
    include Dry::Monads::Do.for(:call)

    include Deps[
      "prepare",
      "generate",
    ]

    def call(root)
      yield prepare.(root)
      yield generate.(root)
      Success()
    end
  end
end
