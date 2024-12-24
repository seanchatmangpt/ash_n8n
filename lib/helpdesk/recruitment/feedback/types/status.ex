defmodule Helpdesk.Recruitment.Feedback.Types.Status do
  use Ash.Type.Enum, values: [:pending, :reviewed]
end
