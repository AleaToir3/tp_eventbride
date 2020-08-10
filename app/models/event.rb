class Event < ApplicationRecord
    ##############################################
    # la différence entre valide et validate'S'  #
    # valide c'est la methode                    #
    # valides c'est les parametres               #
    ##############################################
    validates :start_date, presence: true 
    validate :start_date_not_before_time_now
    validates :duration, presence: true, :numericality => { greater_than: 0 }
    validate :duration_minutes 
    validates :title, presence: true, length: { in: 5..140, message: "Un titre fait entre 5 et 140 caractères" }
    validates :description, presence: true, length: { in: 20..1000 }
    validates :price, presence: true, length: { in: 1..1000, message: "Le prix doit etre compris entre 1 et 1000 €" } 
    validates :location, presence: true
    
    def start_date_not_before_time_now #Méthode pour ne pas entrer une date antérieur à la date de debut de l'event
	    if start_date < Date.today
            errors.add(:start_date, "la date ne doit pas etre dans le passé") 
        end  
    end

    def duration_minutes #Méthode de durée de l'event en positif et multiple de 5
        unless duration.present? && duration > 0 && duration % 5 == 0
            errors.add(:duration, "la durée doit etre positive et multiple de 5")
          end
     end

end
    