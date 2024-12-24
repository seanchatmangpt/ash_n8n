defmodule Helpdesk.Recruitment.Feedback do
  use Ash.Resource,
    otp_app: :helpdesk,
    domain: Helpdesk.Recruitment,
    extensions: [AshAdmin.Resource, AshJsonApi.Resource],
    data_layer: AshPostgres.DataLayer

  json_api do
    type "feedback"
  end

  postgres do
    table "feedbacks"
    repo Helpdesk.Repo
  end

  actions do
    defaults [
      :read,
      create: [:feedback_text, :given_at, :status, :job_application_id, :user_id],
      update: [:feedback_text, :given_at, :status, :job_application_id, :user_id]
    ]
  end

  attributes do
    uuid_primary_key :id

    attribute :feedback_text, :string do
      allow_nil? false
    end

    attribute :given_at, :utc_datetime do
      allow_nil? false
    end

    attribute :status, :feedback_status do
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
