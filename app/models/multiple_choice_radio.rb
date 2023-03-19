class MultipleChoiceRadio < QuizQuestion
  def edit
    html = super

    # for i in 0..3
    [0, 1, 2, 3].each do |i|
      html += '<tr><td>'

      html += '<input type="radio" name="quiz_question_choices[' + id.to_s + '][MultipleChoiceRadio][correctindex]" '
      html += 'id="quiz_question_choices_' + id.to_s + '_MultipleChoiceRadio_correctindex_' + (i + 1).to_s + '" value="' + (i + 1).to_s + '" '
      html += 'checked="checked" ' if @quiz_question_choices[i].iscorrect
      html += '/>'

      html += '<input type="text" name="quiz_question_choices[' + id.to_s + '][MultipleChoiceRadio][' + (i + 1).to_s + '][txt]" '
      html += 'id="quiz_question_choices_' + id.to_s + '_MultipleChoiceRadio_' + (i + 1).to_s + '_txt" '
      html += 'value="' + @quiz_question_choices[i].txt + '" size="40" />'

      html += '</td></tr>'
    end

    html.html_safe
    # safe_join(html)
  end

  def complete
    quiz_question_choices = QuizQuestionChoice.where(question_id: id)
    html = '<label for="' + id.to_s + '">' + txt + '</label><br>'
    # for i in 0..3
    [0, 1, 2, 3].each do |i|
      # txt = quiz_question_choices[i].txt
      html += '<input name = ' + "\"#{id}\" "
      html += 'id = ' + "\"#{id}" + '_' + "#{i + 1}\" "
      html += 'value = ' + "\"#{quiz_question_choices[i].txt}\" "
      html += 'type="radio"/>'
      html += quiz_question_choices[i].txt.to_s
      html += '</br>'
    end
    html
  end

  def view_completed_question(user_answer)
    quiz_question_choices = QuizQuestionChoice.where(question_id: id)

    html = ''
    quiz_question_choices.each do |answer|
      html += if answer.iscorrect
                '<b>' + answer.txt + '</b> -- Correct <br>'
              else
                answer.txt + '<br>'
              end
    end

    html += '<br>Your answer is: '
    html += '<b>' + user_answer.first.comments.to_s + '</b>'
    html += if user_answer.first.answer == 1
              '<img src="/assets/Check-icon.png"/>'
            else
              '<img src="/assets/delete_icon.png"/>'
            end
    html += '</b>'
    html += '<br><br><hr>'
    html.html_safe
    # safe_join(html)
  end
end
