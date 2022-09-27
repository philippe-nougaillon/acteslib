json.extract! demande, :id, :type_document, :nom, :prénom, :date_naissance, :lieu_naissance, :disctrict, :workflow_state, :created_at, :updated_at
json.url demande_url(demande, format: :json)
