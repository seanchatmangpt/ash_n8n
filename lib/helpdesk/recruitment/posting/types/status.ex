defmodule Helpdesk.Recruitment.Posting.Types.Status do
  use Ash.Type.Enum, values: [:draft, :active, :closed, :archived]
end
