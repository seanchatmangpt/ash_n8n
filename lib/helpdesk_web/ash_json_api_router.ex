defmodule HelpdeskWeb.AshJsonApiRouter do
  use AshJsonApi.Router,
    domains: [
      Module.concat(["Helpdesk.Support"]),
      Module.concat(["Helpdesk.Organizational"]),
      Module.concat(["Helpdesk.Recruitment"])
    ],
    open_api: "/open_api"
end
