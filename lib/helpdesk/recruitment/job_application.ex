defmodule Helpdesk.Recruitment.JobApplication do
  use Ash.Resource,
    otp_app: :helpdesk,
    domain: Helpdesk.Recruitment,
    extensions: [AshAdmin.Resource, AshJsonApi.Resource],
    data_layer: AshPostgres.DataLayer

  json_api do
    type "job_application"
  end

  postgres do
    table "job_applications"
    repo Helpdesk.Repo
  end

  actions do
    defaults [
      :read,
      create: [:submitted_at, :status, :comments, :applicant_id, :posting_id],
      update: [:submitted_at, :status, :comments, :applicant_id, :posting_id]
    ]
  end

  attributes do
    uuid_primary_key :id

    attribute :submitted_at, :utc_datetime do
      allow_nil? false
    end

    attribute :status, :job_application_status do
      allow_nil? false
    end

    attribute :comments, :string do
      public? true
    end

    timestamps()
  end

  relationships do
    belongs_to :applicant, Helpdesk.Recruitment.Applicant do
      allow_nil? false
    end

    belongs_to :posting, Helpdesk.Recruitment.Posting do
      allow_nil? false
    end
  end
end
