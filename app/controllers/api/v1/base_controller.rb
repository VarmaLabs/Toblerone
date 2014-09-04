module Api
  module V1
    class BaseController < ActionController::API
      include ParamsParserHelper

      after_filter :execute_proc_code

      def execute_proc_code
        if @proc_code
          render_json_response(@proc_code)
        else
          render status: 500, json: {error: "@proc_code not found"}
        end
      end

      def handle_error(e)
        @status = 200
        @success = false
        @data = {
                  errors: {
                    name:  e.message,
                    description: I18n.translate("response.#{e.message.underscore}")
                  }
                }
        @data[:errors][:details] = @errors unless @errors.blank?
        @data[:errors][:stack] = e.backtrace if Rails.env == "development" || ["true", "t", "1", "yes"].include?(params[:debug].to_s.downcase.strip)
      end

      def prepare_response
        @status ||= 200
        @success = @success == false ? (false) : (true)
        @response_hash = {success: @success}
        @response_hash[:alert] = @alert unless @alert.blank?
        @response_hash[:total_data] = @total_data unless @total_data.blank?
        @response_hash[:per_page] = @per_page unless @per_page.blank?
        @response_hash[:current_page] = @current_page unless @current_page.blank?
        @response_hash[:data] = @data unless @data.blank?
        @response_hash[:errors] = @errors unless @errors.blank?
      end

      ## This method will accept a proc, execute it and render the json
      def render_json_response(proc_code)

        begin
          proc_code.call
        rescue ValidationError, InvalidLoginError, FailedToCreateError, FailedToUpdateError, FailedToDeleteError, AuthenticationError => e
          handle_error(e)
        rescue Exception => e
          handle_error(e)
        end

        prepare_response

        render status: @status, json: @response_hash
        return

      end

    end
  end
end
