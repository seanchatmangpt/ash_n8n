defmodule Helpdesk.Support.Ticket do
  use Ash.Resource,
    extensions: [AshJsonApi.Resource],
    otp_app: :helpdesk,
    domain: Helpdesk.Support,
    data_layer: AshPostgres.DataLayer

  json_api do
    type "ticket"
  end

  postgres do
    table "tickets"
    repo Helpdesk.Repo
  end

  actions do
    defaults [:read]

    create :open do
      accept [:subject]
    end

    update :close do
      accept []

      validate attribute_does_not_equal(:status, :closed) do
        message "Ticket is already closed"
      end

      change set_attribute(:status, :closed)
    end

    update :assign do
      accept [:representative_id]
    end
  end

  attributes do
    uuid_primary_key :id

    attribute :subject, :string do
      allow_nil? false
      public? true
    end

    attribute :status, :ticket_status do
      default :open
      allow_nil? false
    end
  end

  relationships do
    belongs_to :representative, Helpdesk.Support.Representative do
      public? true
    end
  end
end
