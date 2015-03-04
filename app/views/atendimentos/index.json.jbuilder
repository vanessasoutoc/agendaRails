json.array!(@atendimentos) do |atendimento|
  json.extract! atendimento, :id, :date, :title, :description, :created_at
  json.url atendimento_url(atendimento, format: :html)
end
