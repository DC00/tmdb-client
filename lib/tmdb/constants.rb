module Tmdb
  module Constants

    MOCK             = "mock".freeze
    MOCK_FAIL        = "mock_fail".freeze
    MOCK_VENDOR_FAIL = "mock_vendor_fail".freeze
    PRODUCTION       = "production".freeze

    GUEST_SESSION_URL  = "/3/authentication/guest_session/new".freeze
    SESSION_URL        = "/3/authentication/session/new".freeze
    TOKEN_REQUEST_URL  = "/4/auth/request_token".freeze
    VALIDATE_LOGIN_URL = "/3/authentication/token/validate_login".freeze

  end
end
