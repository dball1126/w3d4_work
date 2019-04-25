# == Schema Information
#
# Table name: responses
#
#  id               :bigint(8)        not null, primary key
#  answer_choice_id :integer
#  user_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Response < ApplicationRecord
    # validates_uniqueness_of :user_id, :answer_choice_id
    before_validation :not_duplicate_response

    belongs_to :respondent,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User

    belongs_to :answer_choice,
        primary_key: :id,
        foreign_key: :answer_choice_id,
        class_name:  :AnswerChoice


            # Not Working
       def not_duplicate_response
           user = User.find_by(id: self.user_id)
           previous_answer = AnswerChoice.find_by(id: self.answer_choice_id)

           user.responses.each do |response|
            if response == previous_answer)
                    return false 
            end
         end
       end

end
