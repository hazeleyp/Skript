json.extract! script_step, :id, :name, :description, :expectedOutcome, :status, :testUser, :testDepartment, :linkedIssue, :dateTested, :script_id, :created_at, :updated_at
json.url script_step_url(script_step, format: :json)
