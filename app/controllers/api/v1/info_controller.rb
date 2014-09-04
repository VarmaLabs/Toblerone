module Api
  module V1
    class InfoController < BaseController

      before_filter :parse_pagination_params, only: :server

      def server

        @proc_code = Proc.new do
          @data = {
            server: "Passenger",
            "Ruby version" => "2.1.2-p95 (x86_64-darwin13.0)",
            "RubyGems version" => "2.2.2",
            "Rack version" => "1.5",
            "Rails version" => "4.1.5",
            "JavaScript Runtime" => "Node.js (V8)",
            "Active Record version" => "4.1.5",
            "Action Pack  version" => "4.1.5",
            "Action View version" => "4.1.5",
            "Action Mailer version" => "4.1.5",
            "Active Support version" => "4.1.5",
            "Middleware" => [
              "Rack::Sendfile",
              "ActionDispatch::Static",
              "Rack::Lock",
              "Rack::Runtime",
              "Rack::MethodOverride",
              "ActionDispatch::RequestId",
              "Rails::Rack::Logger",
              "ActionDispatch::ShowExceptions",
              "ActionDispatch::DebugExceptions",
              "BetterErrors::Middleware",
              "ActionDispatch::RemoteIp",
              "ActionDispatch::Reloader",
              "ActionDispatch::Callbacks",
              "ActiveRecord::Migration::CheckPending",
              "ActiveRecord::ConnectionAdapters::ConnectionManagement",
              "ActiveRecord::QueryCache",
              "ActionDispatch::Cookies",
              "ActionDispatch::Session::CookieStore",
              "ActionDispatch::Flash",
              "ActionDispatch::ParamsParser",
              "Rack::Head",
              "Rack::ConditionalGet",
              "Rack::ETag",
            ],
            "Environment" => "development",
            "Database adapter" => "postgresql",
            "Database schema version" => "0"
          }
          @success = true
          @errors = {}
        end

      end

    end
  end
end
