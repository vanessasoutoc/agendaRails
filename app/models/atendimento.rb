class Atendimento < ActiveRecord::Base

	validates :title, presence: {message: "Você precisa preencher esse campo."}
	validates :date, presence: {message: "Você precisa preencher esse campo."}, uniqueness: {message: "Já tem atendimento cadastrado para esse dia/horário, tente outro."}
	
	def self.search(query)
		where("LOWER(title) like ?", "%#{query}%") 
	end
end
