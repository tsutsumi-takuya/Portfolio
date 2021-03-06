Geocoder.configure(
# Geocoding options
# timeout: 3,                 # geocoding service timeout (secs)
# lookup: :google,            # name of geocoding service (symbol)
# ip_lookup: :ipinfo_io,      # name of IP address geocoding service (symbol)
language: :ja,                # :enから:jaに変えた
# use_https: false,           # use HTTPS for lookup requests? (if supported)
# http_proxy: nil,            # HTTP proxy server (user:pass@host:port)
# https_proxy: nil,           # HTTPS proxy server (user:pass@host:port)
api_key: "AIzaSyA_EKYkZqEkdP91lWz6xANhKO-B7vUbPaQ",               # APIキーを設定しないと動きません
# cache: nil,                 # cache object (must respond to #[], #[]=, and #del)
# cache_prefix: 'geocoder:',  # prefix (string) to use for all cache keys
# Exceptions that should not be rescued by default
# (if you want to implement custom error handling);
# supports SocketError and Timeout::Error
# always_raise: [],
# Calculation options
# units: :mi,                 # :km for kilometers or :mi for miles 1mi=1.6km
# distances: :linear          # :spherical or :linear
)