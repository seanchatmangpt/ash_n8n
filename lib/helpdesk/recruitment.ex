defmodule Helpdesk.Recruitment do
  use Ash.Domain, extensions: [AshJsonApi.Domain, AshAdmin.Domain]

  json_api do
    routes do
      base_route "/applicants", Helpdesk.Recruitment.Applicant do
        get :read
        index :read
        post :create
      end

      base_route "/postings", Helpdesk.Recruitment.Posting do
        get :read
        index :read
        post :create
      end

      base_route "/feedbacks", Helpdesk.Recruitment.Feedback do
        get :read
        index :read
        post :create
      end

      base_route "/interviews", Helpdesk.Recruitment.Interview do
        get :read
        index :read
        post :create
      end

      base_route "/job_applications", Helpdesk.Recruitment.JobApplication do
        get :read
        index :read
        post :create
      end
    end
  end

  admin do
    show?(true)
  end

  resources do
    resource Helpdesk.Recruitment.Applicant
    resource Helpdesk.Recruitment.Posting
    resource Helpdesk.Recruitment.Feedback
    resource Helpdesk.Recruitment.Interview
    resource Helpdesk.Recruitment.JobApplication
  end
end
