defmodule Helpdesk.Recruitment.Applicant do
  use Ash.Resource,
    otp_app: :helpdesk,
    domain: Helpdesk.Recruitment,
    extensions: [AshAdmin.Resource, AshJsonApi.Resource],
    data_layer: AshPostgres.DataLayer

  json_api do
    type "applicant"
  end

  postgres do
    table "applicants"
    repo Helpdesk.Repo
  end

  actions do
    defaults [
      :read,
      create: [:first_name, :last_name, :email, :phone, :resume_url, :linkedin_profile],
      update: [:first_name, :last_name, :email, :phone, :resume_url, :linkedin_profile]
    ]
  end

  attributes do
    uuid_primary_key :id

    attribute :first_name, :string do
      allow_nil? false
    end

    attribute :last_name, :string do
      allow_nil? false
    end

    attribute :email, :string do
      allow_nil? false
      public? true
    end

    attribute :phone, :string

    attribute :resume_url, :string do
      public? true
    end

    attribute :linkedin_profile, :string
    timestamps()
  end
end
