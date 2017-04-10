module Admin
  module Withdraws
    class TritiumsController < ::Admin::Withdraws::BaseController
      load_and_authorize_resource :class => '::Withdraws::Tritium'

      def index
        start_at = DateTime.now.ago(60 * 60 * 24)
        @one_tritiums = @tritiums.with_aasm_state(:accepted).order("id DESC")
        @all_tritiums = @tritiums.without_aasm_state(:accepted).where('created_at > ?', start_at).order("id DESC")
      end

      def show
      end

      def update
        @tritium.process!
        redirect_to :back, notice: t('.notice')
      end

      def destroy
        @tritium.reject!
        redirect_to :back, notice: t('.notice')
      end
    end
  end
end
