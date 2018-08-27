json.extract! course, :id, :title, :description, :duration, :code_or_url, :created_at, :updated_at
json.url course_url(course, format: :json)
