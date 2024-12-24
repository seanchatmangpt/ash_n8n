defmodule Helpdesk.Recruitment.Interview.Types.Status do
  use Ash.Type.Enum, values: [:scheduled, :completed, :canceled]
end
