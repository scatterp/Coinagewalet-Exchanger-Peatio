module Private::Withdraws
  class TritiumsController < ::Private::Withdraws::BaseController
    include ::Withdraws::Withdrawable
  end
end
