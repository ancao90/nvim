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
          mm.alternate('app/unsupported/user.rb'),
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

    context('when the given path is a mailer path', function()
      it('returns alternative path', function()
        assert.are.same(
          mm.alternate('app/mailers/application_mailer.rb'),
          'spec/mailers/application_mailer_spec.rb'
        )
      end)
    end)

    context('when the given path is a nested mailer path', function()
      it('returns alternative path', function()
        assert.are.same(
          mm.alternate('app/mailers/users/alert_mailer.rb'),
          'spec/mailers/users/alert_mailer_spec.rb'
        )
      end)
    end)

    context('when the given path is a service path', function()
      it('returns alternative path', function()
        assert.are.same(
          mm.alternate('app/services/some_service.rb'),
          'spec/services/some_service_spec.rb'
        )
      end)
    end)

    context('when the given path is a nested service path', function()
      it('returns alternative path', function()
        assert.are.same(
          mm.alternate('app/services/nested/some_service.rb'),
          'spec/services/nested/some_service_spec.rb'
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

    context('with spec mailer path', function()
      it('returns mailer path', function()
        assert.are.same(
          mm.alternate('spec/mailers/application_mailer_spec.rb'),
          'app/mailers/application_mailer.rb'
        )
      end)
    end)

    context('with nested spec mailer path', function()
      it('returns nested mailer path', function()
        assert.are.same(
          mm.alternate('spec/mailers/users/alert_mailer_spec.rb'),
          'app/mailers/users/alert_mailer.rb'
        )
      end)
    end)

    context('with spec service path', function()
      it('returns service path', function()
        assert.are.same(
          mm.alternate('spec/services/some_service_spec.rb'),
          'app/services/some_service.rb'
        )
      end)
    end)

    context('with nested spec service path', function()
      it('returns nested service path', function()
        assert.are.same(
          mm.alternate('spec/services/nested/some_service_spec.rb'),
          'app/services/nested/some_service.rb'
        )
      end)
    end)
  end)
end)
