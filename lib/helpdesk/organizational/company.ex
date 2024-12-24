defmodule Helpdesk.Organizational.Company do
  use Ash.Resource,
    otp_app: :helpdesk,
    domain: Helpdesk.Organizational,
    extensions: [AshAdmin.Resource, AshJsonApi.Resource],
    data_layer: AshPostgres.DataLayer

  json_api do
    type "company"
  end

  postgres do
    table "companies"
    repo Helpdesk.Repo
  end

  actions do
    defaults [
      :read,
      create: [:name, :industry, :description, :website],
      update: [:name, :industry, :description, :website]
    ]
  end

  attributes do
    uuid_primary_key :id

    attribute :name, :string do
      allow_nil? false
      public? true
    end

    attribute :industry, :string
    attribute :description, :string
    attribute :website, :string
    timestamps()
  end
end
