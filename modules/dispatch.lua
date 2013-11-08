--! @file dispatch

local http = require "luci.http"
local util = require "luci.util"

module "luci.commotion.dispatch"

local dispatch = {}

--! @name nodeurl
--! @brief  Parses
--! @param controller The luci controller passsed to a template.
--! @param prefix  The controller appended with the corresponding child path
--! @param name 
--! @param query A table of key value pairs making up a query
--! @return String value containing valid XML PCDATA from the given values combined into a url.
function dispatch.nodeurl(controller, prefix, name, query)
   local url = controller .. prefix .. name .. "/"
   if query then
	  url = url .. http.build_querystring(query)
   end
   return util.pcdata(url)
end

return dispatch
