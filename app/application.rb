class application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.match(/items/)
      item = req.path.split(/items/).last
      price = @@items.detect {|obj| obj.name == item}.price
