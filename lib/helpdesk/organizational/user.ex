defmodule Helpdesk.Organizational.User do
  use Ash.Resource,
    otp_app: :helpdesk,
    domain: Helpdesk.Organizational,
    extensions: [AshAdmin.Resource, AshJsonApi.Resource],
    data_layer: AshPostgres.DataLayer

  json_api do
    type "user"
  end

  postgres do
    table "users"
    repo Helpdesk.Repo
  end

  actions do
    defaults [:read, create: [:username, :email, :role], update: [:username, :email, :role]]
  end

  attributes do
    uuid_primary_key :id

    attribute :username, :string do
      allow_nil? false
      public? true
    end

    attribute :email, :string do
      allow_nil? false
      public? true
    end

    attribute :password_hash, :string do
      allow_nil? false
      sensitive? true
    end

    attribute :role, :string do
      allow_nil? false
      public? true
    end

    timestamps()
  end
end
