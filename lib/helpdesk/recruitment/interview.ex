defmodule Helpdesk.Recruitment.Interview do
  use Ash.Resource,
    otp_app: :helpdesk,
    domain: Helpdesk.Recruitment,
    extensions: [AshAdmin.Resource, AshJsonApi.Resource],
    data_layer: AshPostgres.DataLayer

  json_api do
    type "interview"
  end

  postgres do
    table "interviews"
    repo Helpdesk.Repo
  end

  actions do
    defaults [
      :read,
      create: [:scheduled_at, :location, :interviewer, :status, :job_application_id, :user_id],
      update: [:scheduled_at, :location, :interviewer, :status, :job_application_id, :user_id]
    ]
  end

  attributes do
    uuid_primary_key :id

    attribute :scheduled_at, :utc_datetime do
      allow_nil? false
    end

    attribute :location, :string

    attribute :interviewer, :string do
      allow_nil? false
    end

    attribute :status, :interview_status do
      allow_nil? false
    end

    timestamps()
  end

  relationships do
    belongs_to :job_application, Helpdesk.Recruitment.JobApplication do
      allow_nil? false
    end

    belongs_to :user, Helpdesk.Organizational.User do
      allow_nil? false
    end
  end
end
