json.extract! answer, :id, :body, :user_id, :question_id, :payment_id, :created_at, :updated_at
json.url answer_url(answer, format: :json)
