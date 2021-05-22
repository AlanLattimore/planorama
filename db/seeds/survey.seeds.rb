#surveys

Survey_Question.delete_all
Survey_Group.delete_all
Survey.delete_all

3.times.each do |i|
    s = Survey.create(
        name: { "Survey # #{i}" },
        welcome: Faker::Movies::Hobbit.quote,
        thank_you: { "Thank you for responding." },
        public: true,
        authenticate: Faker::Boolean.boolean(true_ratio: 0.9)

        #alias character varying(191),
        #submit_string character varying DEFAULT 'Save'::character varying,
        #header_image character varying DEFAULT ''::character varying,
        #use_captcha boolean DEFAULT false,
        #transition_accept_status public.acceptance_status_enum,
        #transition_decline_status public.acceptance_status_enum,
        #declined_msg text,
        #authenticate_msg text,
        #anonymous boolean DEFAULT false
    )

    2.times.each do |j|
        sg = Survey_Group.create(
            name: { " Group #{j}" },
            description: Faker::Movies::Ghostbusters.quote,
            survey: s,
            sort_order: Faker::Number.unique.number(digits: 3)
        )

        Survey_Question.create(
            title: { "Question Title for group #{j} in survey #{i}" },
            question: { "This is the actual question" },
            survey_group: sg,
            sort_order: 1,
            question_type: {textfield},
            answer_type: {String}

            #mandatory boolean DEFAULT false,
            #text_size integer,
            #horizontal boolean DEFAULT false,
            #private boolean DEFAULT false,
            #regex character varying,
            #mapping character varying(200)
        )
    end
end


p "Created #{Survey.count} surveys."
