require 'faye'

faye_server = Faye::RackAdapter.new(mount: "/mount", timeout: 25)
run faye_server
