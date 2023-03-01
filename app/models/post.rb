class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ['Fiction', 'Non-Fiction']}
    validate :clickbaity


    def clickbaity
        phrases = ["Won't Believe", "Secret", "Top", "Guess"]
        phrases.each do |w|
            return true if self.title && self.title[w]
        end
        errors.add(:title, "Not clickbaity enough")
        # return false
    end 
end
