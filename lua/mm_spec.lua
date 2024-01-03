local mm = require('mm')

describe('mm', function()
  describe('alternate', function()
    context('with top level model', function()
      it('returns alternative path', function()
        assert.are.same(
          mm.alternate('app/models/user.rb'),
          'spec/models/user_spec.rb'
        )
      end)
    end)

    context('when model file name has underscore', function()
      it('returns alternative path', function()
        assert.are.same(
          mm.alternate('app/models/user_permission.rb'),
          'spec/models/user_permission_spec.rb'
        )
      end)
    end)

    context('when the given path is not supported', function()
      it('returns nil', function()
        assert.are.same(
          mm.alternate('app/services/user.rb'),
          nil
        )
      end)
    end)

    context('when the given path is a controller path', function()
      it('returns alternative path', function()
        assert.are.same(
          mm.alternate('app/controllers/users_controller.rb', 'show'),
          'spec/requests/users/show_spec.rb'
        )
      end)
    end)

    context('with spec request path', function()
      it('returns controller path', function()
        assert.are.same(
          mm.alternate('spec/requests/users/show_spec.rb'),
          'app/controllers/users_controller.rb'
        )
      end)
    end)

    context('with spec model path', function()
      it('returns model path', function()
        assert.are.same(
          mm.alternate('spec/models/user_spec.rb'),
          'app/models/user.rb'
        )
      end)
    end)
  end)
end)
