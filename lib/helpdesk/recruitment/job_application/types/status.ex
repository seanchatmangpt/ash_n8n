defmodule Helpdesk.Recruitment.JobApplication.Types.Status do
  use Ash.Type.Enum, values: [:submitted, :reviewing, :approved, :rejected]
end
