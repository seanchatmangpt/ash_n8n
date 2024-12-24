defmodule Helpdesk.Recruitment.Posting do
  use Ash.Resource,
    otp_app: :helpdesk,
    domain: Helpdesk.Recruitment,
    extensions: [AshAdmin.Resource, AshJsonApi.Resource],
    data_layer: AshPostgres.DataLayer

  json_api do
    type "posting"
  end

  postgres do
    table "postings"
    repo Helpdesk.Repo
  end

  actions do
    defaults [
      :read,
      create: [
        :title,
        :description,
        :location,
        :salary_range,
        :employment_type,
        :closing_date,
        :status,
        :company_id
      ],
      update: [
        :title,
        :description,
        :location,
        :salary_range,
        :employment_type,
        :closing_date,
        :status,
        :company_id
      ]
    ]
  end

  attributes do
    uuid_primary_key :id

    attribute :title, :string do
      allow_nil? false
    end

    attribute :description, :string
    attribute :location, :string
    attribute :salary_range, :string

    attribute :employment_type, :string do
      allow_nil? false
    end

    attribute :closing_date, :date

    attribute :status, :posting_status do
      allow_nil? false
    end

    timestamps()
  end

  relationships do
    belongs_to :company, Helpdesk.Organizational.Company do
      allow_nil? false
    end
  end
end
