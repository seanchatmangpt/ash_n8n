defmodule Helpdesk.Organizational do
  use Ash.Domain, extensions: [AshJsonApi.Domain, AshAdmin.Domain]

  json_api do
    routes do
      base_route "/companies", Helpdesk.Organizational.Company do
        get :read
        index :read
        post :create
      end

      base_route "/user", Helpdesk.Organizational.User do
        get :read
        index :read
        post :create
      end
    end
  end

  admin do
    show?(true)
  end

  resources do
    resource Helpdesk.Organizational.Company
    resource Helpdesk.Organizational.User
  end
end
