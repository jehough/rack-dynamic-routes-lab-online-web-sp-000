class application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.match(/items/)
      item = req.path.split(/items/).last
      if @@items.detect {|obj| obj.name == item}
      price = @@items.detect {|obj| obj.name == item}.price
      resp.write "#{item} cost #{price}"
      resp.status = 200
    else
      resp.write = "Route not found"
      resp.status = 404
