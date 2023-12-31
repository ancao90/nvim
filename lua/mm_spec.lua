local mm = require('mm')

describe("mm", function()
  describe("alternate", function()
    context("with top level model", function()
      it("returns alternative path", function()
        assert.are.same(
          mm.alternate("app/models/user.rb"),
          "spec/models/user_spec.rb"
        )
      end)
    end)

    context("when model file name has underscore", function()
      it("returns alternative path", function()
        assert.are.same(
          mm.alternate("app/models/user_permission.rb"),
          "spec/models/user_permission_spec.rb"
        )
      end)
    end)
  end)
end)
