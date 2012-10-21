# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def generate_quiz(questions, choices)
    ret = ''
    questions.each do |key, question|
      ret += "<p>#{question}</p>"
      ret += '<ul class="quiz unstyled">'
      choices[key].each do |choice|
        ret += '<li>'
        ret += radio_button_tag("quiz[#{key}]", choice) + ' ' + choice
        ret += '</li>'
      end
      ret += '</ul>'
    end
    ret.html_safe
  end

  def admin?
    current_user && current_user.admin?
  end

  def normal_user
    current_user && !current_user.admin?
  end

  def manager?
    current_user.role == User::ROLE_OPTIONS[0]
  end 

  def employee?
    current_user.role == USER::ROLE_OPTIONS[1]
  end
end
