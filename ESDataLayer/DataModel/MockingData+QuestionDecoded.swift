extension Array where Element == DataModel.QuestionDecoded {
    static public func mockData() -> [DataModel.QuestionDecoded] {
        [
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("principles"),
                    question: .localizable("What is the supreme law of the land?"),
                    correctAnswers: [.localizable("The Constitution")],
                    wrongAnswers: [
                        .localizable("The Bill of Rights"),
                        .localizable("The Declaration of Independence"),
                        .localizable("The Emancipation Proclamation"),
                        .localizable("Presidents Day")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("singleAnswer")
                        ) ?? .single,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("principles"),
                    question: .localizable("What does the Constitution do?"),
                    correctAnswers: [
                        .localizable("Defines the government"),
                        .localizable("Sets up the government"),
                        .localizable("Protects basic rights of Americans")
                    ],
                    wrongAnswers: [
                        .localizable("states rights"),
                        .localizable("Green movement"),
                        .localizable("Declares independence from Great Britain"),
                        .localizable("Christmas")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("interchangeAnswer")
                        ) ?? .interchange,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("principles"),
                    question: .localizable("The idea of self-government is in the first three words of the Constitution. What are these words?"),
                    correctAnswers: [.localizable("We the People")],
                    wrongAnswers: [
                        .localizable("freedom of religion"),
                        .localizable("In God We Trust"),
                        .localizable("United We Stand"),
                        .localizable("Life, Liberty, Happiness")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("singleAnswer")
                        ) ?? .single,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("principles"),
                    question: .localizable("What is an amendment?"),
                    correctAnswers: [
                        .localizable("An addition (to the Constitution)"),
                        .localizable("A change (to the Constitution)")
                    ],
                    wrongAnswers: [
                        .localizable("Appoints federal judges"),
                        .localizable("President"),
                        .localizable("A removal of a law"),
                        .localizable("A court ruling")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("interchangeAnswer")
                        ) ?? .interchange,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("principles"),
                    question: .localizable("What do we call the first ten amendments to the Constitution?"),
                    correctAnswers: [.localizable("The Bill of Rights")],
                    wrongAnswers: [
                        .localizable("The Federalist Papers"),
                        .localizable("To conquer the British"),
                        .localizable("The Declaration of Independence"),
                        .localizable("The Articles of Confederation")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("singleAnswer")
                        ) ?? .single,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("principles"),
                    question: .localizable("What is one right or freedom from the First Amendment?"),
                    correctAnswers: [
                        .localizable("Speech"),
                        .localizable("Petition the government"),
                        .localizable("Assembly"),
                        .localizable("Religion"),
                        .localizable("Press")
                    ],
                    wrongAnswers: [
                        .localizable("Trial by jury"),
                        .localizable("Cherokee"),
                        .localizable("To declare war"),
                        .localizable("Right to bear arms")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("interchangeAnswer")
                        ) ?? .interchange,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("principles"),
                    question: .localizable("How many amendments does the Constitution have?"),
                    correctAnswers: [.localizable("Twenty-seven (27)")],
                    wrongAnswers: [
                        .localizable("Twenty-one (21)"),
                        .localizable("To set up schools"),
                        .localizable("Thirty-three (33)"),
                        .localizable("Ten (10)")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("singleAnswer")
                        ) ?? .single,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("principles"),
                    question: .localizable("What did the Declaration of Independence do?"),
                    correctAnswers: [
                        .localizable("Declared our independence (from Great Britain)"),
                        .localizable("Said that the United States is free (from Great Britain)"),
                        .localizable("Announced our independence (from Great Britain)")
                    ],
                    wrongAnswers: [
                        .localizable("eight (8)"),
                        .localizable("Established the U.S. Constitution"),
                        .localizable("Korean War"),
                        .localizable("Decides if a law goes against the Constitution")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("interchangeAnswer")
                        ) ?? .interchange,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("principles"),
                    question: .localizable("What are two rights in the Declaration of Independence?"),
                    correctAnswers: [
                        .localizable("Pursuit of happiness"),
                        .localizable("Liberty"),
                        .localizable("Life")
                    ],
                    wrongAnswers: [
                        .localizable("Mohegan"),
                        .localizable("Freedom of speech"),
                        .localizable("Freedom from taxation"),
                        .localizable("Right to bear arms")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("multipleAnswer")
                        ) ?? .multiple,
                    answerQuantity: 3,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("principles"),
                    question: .localizable("What is freedom of religion?"),
                    correctAnswers: [.localizable("You can practice any religion, or not practice a religion.")],
                    wrongAnswers: [
                        .localizable("Freedom of religion applies only in churches."),
                        .localizable("Only major religions are recognized."),
                        .localizable("Checks and balances"),
                        .localizable("You must choose a religion by age 18.")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("singleAnswer")
                        ) ?? .single,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("principles"),
                    question: .localizable("What is the economic system in the United States?"),
                    correctAnswers: [
                        .localizable("Capitalist economy"),
                        .localizable("Market economy")
                    ],
                    wrongAnswers: [
                        .localizable("Socialist economy"),
                        .localizable("Judicial review"),
                        .localizable("April 15"),
                        .localizable("Planned economy")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("interchangeAnswer")
                        ) ?? .interchange,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("principles"),
                    question: .localizable("What is the rule of law?"),
                    correctAnswers: [
                        .localizable("Government must obey the law"),
                        .localizable("No one is above the law"),
                        .localizable("Leaders must obey the law"),
                        .localizable("Everyone must follow the law")
                    ],
                    wrongAnswers: [
                        .localizable("Mike Pence"),
                        .localizable("The president decides the law"),
                        .localizable("Navajo"),
                        .localizable("the right to bear arms")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("interchangeAnswer")
                        ) ?? .interchange,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("systems"),
                    question: .localizable("Name one branch or part of the government."),
                    correctAnswers: [
                        .localizable("President"),
                        .localizable("Congress"),
                        .localizable("Judicial"),
                        .localizable("The courts"),
                        .localizable("Executive"),
                        .localizable("Legislative")
                    ],
                    wrongAnswers: [
                        .localizable("Federal Reserve"),
                        .localizable("because there were 13 original colonies"),
                        .localizable("State governments"),
                        .localizable("Two hundred (200)")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("interchangeAnswer")
                        ) ?? .interchange,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("systems"),
                    question: .localizable("What stops one branch of government from becoming too powerful?"),
                    correctAnswers: [
                        .localizable("Checks and balances"),
                        .localizable("Separation of powers")
                    ],
                    wrongAnswers: [
                        .localizable("Publius"),
                        .localizable("Judicial review"),
                        .localizable("Executive orders"),
                        .localizable("George Washington")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("interchangeAnswer")
                        ) ?? .interchange,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("systems"),
                    question: .localizable("Who is in charge of the executive branch?"),
                    correctAnswers: [.localizable("The President")],
                    wrongAnswers: [
                        .localizable("The Speaker of the House"),
                        .localizable("The Vice President"),
                        .localizable("The Chief Justice"),
                        .localizable("Everyone must follow the law")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("singleAnswer")
                        ) ?? .single,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("systems"),
                    question: .localizable("Who makes federal laws?"),
                    correctAnswers: [
                        .localizable("The Congress"),
                        .localizable("The Senate and the House (of Representatives)"),
                        .localizable("The U.S. (national) legislature")
                    ],
                    wrongAnswers: [
                        .localizable("The Constitution was written"),
                        .localizable("because the stripes represent the original colonies"),
                        .localizable("The Supreme Court"),
                        .localizable("The Vice President")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("interchangeAnswer")
                        ) ?? .interchange,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("systems"),
                    question: .localizable("What are the two parts of the U.S. Congress?"),
                    correctAnswers: [.localizable("The Senate and House (of Representatives)")],
                    wrongAnswers: [
                        .localizable("The Cabinet and Congress"),
                        .localizable("The President and Vice President"),
                        .localizable("The Judicial and Executive branches"),
                        .localizable("because there is one star for each state")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("singleAnswer")
                        ) ?? .single,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("systems"),
                    question: .localizable("How many U.S. Senators are there?"),
                    correctAnswers: [.localizable("One hundred (100)")],
                    wrongAnswers: [
                        .localizable("Fifty (50)"),
                        .localizable("Two hundred (200)"),
                        .localizable("Vietnam War"),
                        .localizable("Four hundred thirty-five (435)")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("singleAnswer")
                        ) ?? .single,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("systems"),
                    question: .localizable("We elect a U.S. Senator for how many years?"),
                    correctAnswers: [.localizable("six (6)")],
                    wrongAnswers: [
                        .localizable("eight (8)"),
                        .localizable("Freedom"),
                        .localizable("four (4)"),
                        .localizable("two (2)")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("singleAnswer")
                        ) ?? .single,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("systems"),
                    question: .localizable("Who is one of your state U.S. Senators now?"),
                    correctAnswers: [.localizable("Answers will vary")],
                    wrongAnswers: [
                        .localizable("Russia, China, and Germany"),
                        .localizable("American Samoa"),
                        .localizable("Provide schooling and education"),
                        .localizable("Petition the government")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("stateAnswer")
                        ) ?? .stateAnswer,
                    answerQuantity: nil,
                    answerKey: .localizable("senator")
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("systems"),
                    question: .localizable("The House of Representatives has how many voting members?"),
                    correctAnswers: [.localizable("Four hundred thirty-five (435)")],
                    wrongAnswers: [
                        .localizable("Two hundred (200)"),
                        .localizable("Freedom from taxation"),
                        .localizable("Three hundred (300)"),
                        .localizable("One hundred (100)")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("singleAnswer")
                        ) ?? .single,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("systems"),
                    question: .localizable("We elect a U.S. Representative for how many years?"),
                    correctAnswers: [.localizable("Two (2)")],
                    wrongAnswers: [
                        .localizable("Four (4)"),
                        .localizable("Six (6)"),
                        .localizable("One (1)"),
                        .localizable("Nancy Pelosi")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("singleAnswer")
                        ) ?? .single,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("systems"),
                    question: .localizable("Name your U.S. Representative"),
                    correctAnswers: [.localizable("Answers will vary")],
                    wrongAnswers: [
                        .localizable("Michigan"),
                        .localizable("because each star represents a state"),
                        .localizable("Massachusetts"),
                        .localizable("Everyone must follow the law")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("stateAnswer")
                        ) ?? .stateAnswer,
                    answerQuantity: nil,
                    answerKey: .localizable("representative")
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("systems"),
                    question: .localizable("Who does a U.S. Senator represent?"),
                    correctAnswers: [.localizable("All people of the state")],
                    wrongAnswers: [
                        .localizable("Mike Pence"),
                        .localizable("Only state lawmakers"),
                        .localizable("Only people who voted for them"),
                        .localizable("Only the people in their political party")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("singleAnswer")
                        ) ?? .single,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("systems"),
                    question: .localizable("Why do some states have more Representatives than other states?"),
                    correctAnswers: [
                        .localizable("Because some states have more people"),
                        .localizable("Because of the state population"),
                        .localizable("Because they have more people")
                    ],
                    wrongAnswers: [
                        .localizable("Give a driver license"),
                        .localizable("Because they are larger in size"),
                        .localizable("Leaders must obey the law"),
                        .localizable("The Federal Court of Appeals")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("interchangeAnswer")
                        ) ?? .interchange,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("systems"),
                    question: .localizable("We elect a President for how many years?"),
                    correctAnswers: [.localizable("Four (4)")],
                    wrongAnswers: [
                        .localizable("Two (2)"),
                        .localizable("Six (6)"),
                        .localizable("Delaware"),
                        .localizable("Eight (8)")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("singleAnswer")
                        ) ?? .single,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("systems"),
                    question: .localizable("In what month do we vote for President?"),
                    correctAnswers: [.localizable("November")],
                    wrongAnswers: [
                        .localizable("The Judicial and Executive branches"),
                        .localizable("October"),
                        .localizable("January"),
                        .localizable("December")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("singleAnswer")
                        ) ?? .single,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("systems"),
                    question: .localizable("What is the name of the President of the United States now?"),
                    correctAnswers: [.localizable("Donald J. Trump")],
                    wrongAnswers: [
                        .localizable("Religious freedom"),
                        .localizable("Socialist economy"),
                        .localizable("South Carolina"),
                        .localizable("Zuni")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("peopleAnswer")
                        ) ?? .peopleAnswer,
                    answerQuantity: nil,
                    answerKey: .localizable("president")
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("systems"),
                    question: .localizable("What is the name of the Vice President of the United States now?"),
                    correctAnswers: [.localizable("Mike Pence")],
                    wrongAnswers: [
                        .localizable("Publicly support or oppose an issue or policy"),
                        .localizable("At age eighteen (18)"),
                        .localizable("Secretary of Transportation"),
                        .localizable("because there are 50 states")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("peopleAnswer")
                        ) ?? .peopleAnswer,
                    answerQuantity: nil,
                    answerKey: .localizable("vicePresident")
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("systems"),
                    question: .localizable("If the President can no longer serve, who becomes President?"),
                    correctAnswers: [.localizable("The Vice President")],
                    wrongAnswers: [
                        .localizable("You can practice any religion, or not practice a religion."),
                        .localizable("The Speaker of the House"),
                        .localizable("The Secretary of State"),
                        .localizable("The Chief Justice")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("singleAnswer")
                        ) ?? .single,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("systems"),
                    question: .localizable("If both the President and the Vice President can no longer serve, who becomes President?"),
                    correctAnswers: [.localizable("The Speaker of the House")],
                    wrongAnswers: [
                        .localizable("The Secretary of State"),
                        .localizable("The Chief Justice"),
                        .localizable("The President Pro Tempore of the Senate"),
                        .localizable("Provide protection (police)")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("singleAnswer")
                        ) ?? .single,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("systems"),
                    question: .localizable("Who is the Commander in Chief of the military?"),
                    correctAnswers: [.localizable("The President")],
                    wrongAnswers: [
                        .localizable("The Secretary of Defense"),
                        .localizable("The Vice President"),
                        .localizable("The Chairman of the Joint Chiefs"),
                        .localizable("Secretary of the Interior")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("singleAnswer")
                        ) ?? .single,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("systems"),
                    question: .localizable("Who signs bills to become laws?"),
                    correctAnswers: [.localizable("The President")],
                    wrongAnswers: [
                        .localizable("October"),
                        .localizable("The Speaker of the House"),
                        .localizable("The Vice President"),
                        .localizable("The Chief Justice")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("singleAnswer")
                        ) ?? .single,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("systems"),
                    question: .localizable("Who vetoes bills?"),
                    correctAnswers: [.localizable("The President")],
                    wrongAnswers: [
                        .localizable("The Speaker of the House"),
                        .localizable("Navajo"),
                        .localizable("The Chief Justice"),
                        .localizable("The Senate Majority Leader")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("singleAnswer")
                        ) ?? .single,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("systems"),
                    question: .localizable("What does the President Cabinet do?"),
                    correctAnswers: [.localizable("Advises the President")],
                    wrongAnswers: [
                        .localizable("Commands the military"),
                        "1776",
                        .localizable("Writes federal regulations"),
                        .localizable("Approves laws")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("singleAnswer")
                        ) ?? .single,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("systems"),
                    question: .localizable("What are two Cabinet-level positions?"),
                    correctAnswers: [
                        .localizable("Secretary of Commerce"),
                        .localizable("Secretary of the Interior"),
                        .localizable("Secretary of Veterans Affairs"),
                        .localizable("Secretary of Homeland Security"),
                        .localizable("Secretary of Health and Human Services"),
                        .localizable("Attorney General"),
                        .localizable("Secretary of Education"),
                        .localizable("Secretary of State"),
                        .localizable("Secretary of Labor"),
                        .localizable("Secretary of the Treasury"),
                        .localizable("Vice President"),
                        .localizable("Secretary of Agriculture"),
                        .localizable("Secretary of Transportation"),
                        .localizable("Secretary of Housing and Urban Development"),
                        .localizable("Secretary of Energy"),
                        .localizable("Secretary of Defense")
                    ],
                    wrongAnswers: [
                        .localizable("Majority Leader"),
                        .localizable("Speaker of the House"),
                        .localizable("Blackfeet"),
                        .localizable("Chief Justice")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("multipleAnswer")
                        ) ?? .multiple,
                    answerQuantity: 16,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("systems"),
                    question: .localizable("What does the judicial branch do?"),
                    correctAnswers: [
                        .localizable("Reviews laws"),
                        .localizable("Explains laws"),
                        .localizable("Resolves disputes (disagreements)"),
                        .localizable("Decides if a law goes against the Constitution")
                    ],
                    wrongAnswers: [
                        .localizable("Appoints federal judges"),
                        .localizable("June 14"),
                        .localizable("Enforces laws"),
                        .localizable("Press")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("interchangeAnswer")
                        ) ?? .interchange,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("systems"),
                    question: .localizable("What is the highest court in the United States?"),
                    correctAnswers: [.localizable("The Supreme Court")],
                    wrongAnswers: [
                        .localizable("Only state lawmakers"),
                        .localizable("The District Court"),
                        .localizable("The Constitutional Court"),
                        .localizable("The Federal Court of Appeals")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("singleAnswer")
                        ) ?? .single,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("systems"),
                    question: .localizable("How many justices are on the Supreme Court?"),
                    correctAnswers: [.localizable("Nine (9)")],
                    wrongAnswers: [
                        .localizable("Twelve (12)"),
                        .localizable("Seven (7)"),
                        .localizable("Ten (10)"),
                        .localizable("You must choose a religion by age 18.")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("singleAnswer")
                        ) ?? .single,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("systems"),
                    question: .localizable("Who is the Chief Justice of the United States now?"),
                    correctAnswers: [.localizable("John Roberts")],
                    wrongAnswers: [
                        .localizable("Vietnam War"),
                        .localizable("California"),
                        .localizable("Defend the Constitution and laws of the United States"),
                        .localizable("Planned economy")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("peopleAnswer")
                        ) ?? .peopleAnswer,
                    answerQuantity: nil,
                    answerKey: .localizable("chiefJustice")
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("systems"),
                    question: .localizable("Under our Constitution, some powers belong to the federal government. What is one power of the federal government?"),
                    correctAnswers: [
                        .localizable("To make treaties"),
                        .localizable("To create an army"),
                        .localizable("To print money"),
                        .localizable("To declare war")
                    ],
                    wrongAnswers: [
                        .localizable("To issue driver licenses"),
                        .localizable("To set up schools"),
                        .localizable("Korean War"),
                        .localizable("Sioux")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("interchangeAnswer")
                        ) ?? .interchange,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("systems"),
                    question: .localizable("Under our Constitution, some powers belong to the states. What is one power of the states?"),
                    correctAnswers: [
                        .localizable("Provide schooling and education"),
                        .localizable("Give a driver license"),
                        .localizable("Approve zoning and land use"),
                        .localizable("Provide safety (fire departments)"),
                        .localizable("Provide protection (police)")
                    ],
                    wrongAnswers: [
                        .localizable("Freedom"),
                        .localizable("Delaware"),
                        .localizable("The Bill of Rights was debated"),
                        .localizable("Print money")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("interchangeAnswer")
                        ) ?? .interchange,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("systems"),
                    question: .localizable("Who is the Governor of your state now?"),
                    correctAnswers: [.localizable("Answers will vary")],
                    wrongAnswers: [
                        .localizable("Oneida"),
                        .localizable("Only if joining the military"),
                        .localizable("John Roberts"),
                        .localizable("No one is above the law")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("stateAnswer")
                        ) ?? .stateAnswer,
                    answerQuantity: nil,
                    answerKey: .localizable("governor")
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("systems"),
                    question: .localizable("What is the capital of your state?"),
                    correctAnswers: [.localizable("Answers will vary")],
                    wrongAnswers: [
                        .localizable("Philadelphia"),
                        .localizable("South Carolina"),
                        .localizable("Massachusetts"),
                        .localizable("Market economy")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("stateAnswer")
                        ) ?? .stateAnswer,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("systems"),
                    question: .localizable("What are the two major political parties in the United States?"),
                    correctAnswers: [.localizable("Democratic and Republican")],
                    wrongAnswers: [
                        .localizable("Serve in the U.S. military (if needed)"),
                        .localizable("Green and Libertarian"),
                        .localizable("Federalist and Whig"),
                        .localizable("Labor and Conservative")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("singleAnswer")
                        ) ?? .single,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("systems"),
                    question: .localizable("What is the political party of the President now?"),
                    correctAnswers: [.localizable("Republican")],
                    wrongAnswers: [
                        .localizable("Independent"),
                        .localizable("Secretary of Homeland Security"),
                        .localizable("Libertarian"),
                        .localizable("Democratic")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("singleAnswer")
                        ) ?? .single,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("systems"),
                    question: .localizable("What is the name of the Speaker of the House of Representatives now?"),
                    correctAnswers: [.localizable("Nancy Pelosi")],
                    wrongAnswers: [
                        .localizable("Nine (9)"),
                        .localizable("Attorney General"),
                        .localizable("Federalist and Whig"),
                        .localizable("Obey the laws of the United States")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("peopleAnswer")
                        ) ?? .peopleAnswer,
                    answerQuantity: nil,
                    answerKey: .localizable("speaker")
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("rights"),
                    question: .localizable("There are four amendments to the Constitution about who can vote. Describe one of them."),
                    correctAnswers: [
                        .localizable("Citizens eighteen (18) and older can vote"),
                        .localizable("A male citizen of any race (can vote)."),
                        .localizable("You dont have to pay (a poll tax) to vote"),
                        .localizable("Any citizen can vote. (Women and men can vote)")
                    ],
                    wrongAnswers: [
                        .localizable("Only property owners can vote"),
                        .localizable("Only taxpayers can vote"),
                        .localizable("Trial by jury"),
                        .localizable("Valentine Day")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("interchangeAnswer")
                        ) ?? .interchange,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("rights"),
                    question: .localizable("What is one responsibility that is only for United States citizens?"),
                    correctAnswers: [
                        .localizable("Vote in a federal election"),
                        .localizable("Serve on a jury")
                    ],
                    wrongAnswers: [
                        .localizable("Give an elected official your opinion on an issue"),
                        .localizable("Pay taxes"),
                        .localizable("A court ruling"),
                        .localizable("Obey the law")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("interchangeAnswer")
                        ) ?? .interchange,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("rights"),
                    question: .localizable("Name one right only for United States citizens"),
                    correctAnswers: [
                        .localizable("Run for federal office"),
                        .localizable("Vote in a federal election")
                    ],
                    wrongAnswers: [
                        .localizable("The Congress"),
                        .localizable("Freedom of religion"),
                        .localizable("Freedom of speech"),
                        .localizable("Declared our independence (from Great Britain)")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("interchangeAnswer")
                        ) ?? .interchange,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("rights"),
                    question: .localizable("What are two rights of everyone living in the United States?"),
                    correctAnswers: [
                        .localizable("freedom of religion"),
                        .localizable("freedom of expression"),
                        .localizable("the right to bear arms"),
                        .localizable("freedom of assembly"),
                        .localizable("freedom to petition the government"),
                        .localizable("freedom of speech")
                    ],
                    wrongAnswers: [
                        .localizable("because there is one star for each state"),
                        .localizable("free college education"),
                        .localizable("Because they have more people"),
                        .localizable("New York")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("multipleAnswer")
                        ) ?? .multiple,
                    answerQuantity: 6,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("rights"),
                    question: .localizable("What do we show loyalty to when we say the Pledge of Allegiance?"),
                    correctAnswers: [
                        .localizable("The flag"),
                        .localizable("The United States")
                    ],
                    wrongAnswers: [
                        .localizable("The military"),
                        .localizable("The Constitution"),
                        .localizable("Valentine Day"),
                        .localizable("Secretary of Agriculture")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("interchangeAnswer")
                        ) ?? .interchange,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("rights"),
                    question: .localizable("What is one promise you make when you become a United States citizen?"),
                    correctAnswers: [
                        .localizable("Be loyal to the United States"),
                        .localizable("Give up loyalty to other countries"),
                        .localizable("Serve (do important work for) the nation (if needed)"),
                        .localizable("Obey the laws of the United States"),
                        .localizable("Defend the Constitution and laws of the United States"),
                        .localizable("Serve in the U.S. military (if needed)")
                    ],
                    wrongAnswers: [
                        .localizable("Only taxpayers can vote"),
                        .localizable("Pay no taxes"),
                        .localizable("Only state lawmakers"),
                        .localizable("Twenty-seven (27)")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("interchangeAnswer")
                        ) ?? .interchange,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("rights"),
                    question: .localizable("How old do citizens have to be to vote for President?"),
                    correctAnswers: [.localizable("Eighteen (18) and older")],
                    wrongAnswers: [
                        .localizable("Sixteen (16) and older"),
                        .localizable("Any age with parental consent"),
                        .localizable("freedom of expression"),
                        .localizable("Twenty-one (21) and older")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("singleAnswer")
                        ) ?? .single,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("rights"),
                    question: .localizable("What are two ways that Americans can participate in their democracy?"),
                    correctAnswers: [
                        .localizable("Write to a newspaper"),
                        .localizable("Run for office"),
                        .localizable("Join a community group"),
                        .localizable("Join a civic group"),
                        .localizable("Publicly support or oppose an issue or policy"),
                        .localizable("Call Senators and Representatives"),
                        .localizable("Give an elected official your opinion on an issue"),
                        .localizable("Help with a campaign"),
                        .localizable("Vote"),
                        .localizable("Join a political party")
                    ],
                    wrongAnswers: [
                        .localizable("Pay extra taxes"),
                        .localizable("Martin Luther King, Jr. Day"),
                        .localizable("Join the military to vote"),
                        .localizable("Atlantic Ocean")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("multipleAnswer")
                        ) ?? .multiple,
                    answerQuantity: 10,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("rights"),
                    question: .localizable("When is the last day you can send in federal income tax forms?"),
                    correctAnswers: [.localizable("April 15")],
                    wrongAnswers: [
                        .localizable("December 31"),
                        .localizable("War of 1812"),
                        .localizable("May 1"),
                        .localizable("March 1")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("singleAnswer")
                        ) ?? .single,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("government"),
                    type: .localizable("rights"),
                    question: .localizable("When must all men register for the Selective Service?"),
                    correctAnswers: [
                        .localizable("Between eighteen (18) and twenty-six (26)"),
                        .localizable("At age eighteen (18)")
                    ],
                    wrongAnswers: [
                        .localizable("The Secretary of Defense"),
                        .localizable("Only if joining the military"),
                        .localizable("Choctaw"),
                        .localizable("Before turning 16")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("interchangeAnswer")
                        ) ?? .interchange,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("history-geo"),
                    type: .localizable("history-colonial"),
                    question: .localizable("What is one reason colonists came to America?"),
                    correctAnswers: [
                        .localizable("Economic opportunity"),
                        .localizable("Practice their religion"),
                        .localizable("Escape persecution"),
                        .localizable("Religious freedom"),
                        .localizable("Freedom"),
                        .localizable("Political liberty")
                    ],
                    wrongAnswers: [
                        .localizable("Secretary of the Interior"),
                        .localizable("To conquer the British"),
                        .localizable("To avoid paying taxes"),
                        .localizable("Maryland")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("interchangeAnswer")
                        ) ?? .interchange,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("history-geo"),
                    type: .localizable("history-colonial"),
                    question: .localizable("Who lived in America before the Europeans arrived?"),
                    correctAnswers: [.localizable("Native Americans")],
                    wrongAnswers: [
                        .localizable("Declared our independence (from Great Britain)"),
                        .localizable("Africans"),
                        .localizable("Pilgrims"),
                        .localizable("British settlers")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("singleAnswer")
                        ) ?? .single,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("history-geo"),
                    type: .localizable("history-colonial"),
                    question: .localizable("What group of people was taken to America and sold as slaves?"),
                    correctAnswers: [
                        .localizable("Africans"),
                        .localizable("People from Africa")
                    ],
                    wrongAnswers: [
                        .localizable("Montana"),
                        .localizable("Native Americans"),
                        .localizable("Europeans"),
                        .localizable("Presidents Day")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("interchangeAnswer")
                        ) ?? .interchange,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("history-geo"),
                    type: .localizable("history-colonial"),
                    question: .localizable("Why did the colonists fight the British?"),
                    correctAnswers: [
                        .localizable("Because they didnt have self-government"),
                        .localizable("Because the British army stayed in their houses (boarding, quartering)"),
                        .localizable("Because of high taxes (taxation without representation)")
                    ],
                    wrongAnswers: [
                        .localizable("Huron"),
                        .localizable("Because they disliked tea"),
                        .localizable("New York City"),
                        .localizable("Signer of the Emancipation Proclamation")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("singleAnswer")
                        ) ?? .single,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("history-geo"),
                    type: .localizable("history-colonial"),
                    question: .localizable("Who wrote the Declaration of Independence?"),
                    correctAnswers: [.localizable("Thomas Jefferson")],
                    wrongAnswers: [
                        .localizable("John Adams"),
                        .localizable("Chief Justice"),
                        .localizable("Benjamin Franklin"),
                        .localizable("George Washington")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("singleAnswer")
                        ) ?? .single,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("history-geo"),
                    type: .localizable("history-colonial"),
                    question: .localizable("When was the Declaration of Independence adopted?"),
                    correctAnswers: [.localizable("July 4, 1776")],
                    wrongAnswers: [
                        .localizable("June 4, 1776"),
                        .localizable("September 17, 1787"),
                        .localizable("July 2, 1776"),
                        .localizable("A removal of a law")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("singleAnswer")
                        ) ?? .single,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("history-geo"),
                    type: .localizable("history-colonial"),
                    question: .localizable("There were 13 original states. Name three."),
                    correctAnswers: [
                        .localizable("North Carolina"),
                        .localizable("Pennsylvania"),
                        .localizable("Maryland"),
                        .localizable("New Jersey"),
                        .localizable("Georgia"),
                        .localizable("Delaware"),
                        .localizable("Massachusetts"),
                        .localizable("South Carolina"),
                        .localizable("Connecticut"),
                        .localizable("Virginia"),
                        .localizable("New Hampshire"),
                        .localizable("Rhode Island"),
                        .localizable("New York")
                    ],
                    wrongAnswers: [
                        .localizable("To print money"),
                        .localizable("Ohio"),
                        .localizable("Vermont"),
                        .localizable("Obey the law")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("multipleAnswer")
                        ) ?? .multiple,
                    answerQuantity: 13,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("history-geo"),
                    type: .localizable("history-colonial"),
                    question: .localizable("What happened at the Constitutional Convention?"),
                    correctAnswers: [
                        .localizable("The Constitution was written"),
                        .localizable("The Founding Fathers wrote the Constitution")
                    ],
                    wrongAnswers: [
                        .localizable("War of 1812"),
                        .localizable("The Bill of Rights was debated"),
                        .localizable("January"),
                        .localizable("The Declaration of Independence was signed")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("interchangeAnswer")
                        ) ?? .interchange,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("history-geo"),
                    type: .localizable("history-colonial"),
                    question: .localizable("When was the Constitution written?"),
                    correctAnswers: ["1787"],
                    wrongAnswers: [
                        "1801",
                        "1776",
                        .localizable("Pennsylvania"),
                        "1791"
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("singleAnswer")
                        ) ?? .single,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("history-geo"),
                    type: .localizable("history-colonial"),
                    question: .localizable("The Federalist Papers supported the passage of the U.S. Constitution. Name one of the writers"),
                    correctAnswers: [
                        .localizable("Publius"),
                        .localizable("John Jay"),
                        .localizable("James Madison"),
                        .localizable("Alexander Hamilton")
                    ],
                    wrongAnswers: [
                        .localizable("Only state lawmakers"),
                        .localizable("World War II"),
                        .localizable("Apache"),
                        .localizable("George Washington")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("interchangeAnswer")
                        ) ?? .interchange,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("history-geo"),
                    type: .localizable("history-colonial"),
                    question: .localizable("What is one thing Benjamin Franklin is famous for?"),
                    correctAnswers: [
                        .localizable("U.S. diplomat"),
                        .localizable("Oldest member of the Constitutional Convention"),
                        .localizable("First Postmaster General of the United States"),
                        .localizable("Started the first free libraries"),
                        .localizable("Writer of Poor Richard Almanac")
                    ],
                    wrongAnswers: [
                        .localizable("Arctic Ocean"),
                        .localizable("Immigration"),
                        .localizable("The Secretary of State"),
                        .localizable("Signer of the Emancipation Proclamation")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("interchangeAnswer")
                        ) ?? .interchange,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("history-geo"),
                    type: .localizable("history-colonial"),
                    question: .localizable("Who is the Father of Our Country?"),
                    correctAnswers: [.localizable("George Washington")],
                    wrongAnswers: [
                        .localizable("Vote"),
                        .localizable("Donald J. Trump"),
                        .localizable("May 1"),
                        .localizable("Japan, Korea, and Vietnam")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("peopleAnswer")
                        ) ?? .peopleAnswer,
                    answerQuantity: nil,
                    answerKey: .localizable("washington")
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("history-geo"),
                    type: .localizable("history-colonial"),
                    question: .localizable("Who was the first President?"),
                    correctAnswers: [.localizable("George Washington")],
                    wrongAnswers: [
                        .localizable("Fought for civil rights"),
                        .localizable("To conquer the British"),
                        .localizable("The United States"),
                        .localizable("The District Court")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("peopleAnswer")
                        ) ?? .peopleAnswer,
                    answerQuantity: nil,
                    answerKey: .localizable("washington")
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("history-geo"),
                    type: .localizable("history-1800"),
                    question: .localizable("What territory did the United States buy from France in 1803?"),
                    correctAnswers: [
                        .localizable("Louisiana"),
                        .localizable("The Louisiana Territory")
                    ],
                    wrongAnswers: [
                        .localizable("Independence Day"),
                        .localizable("Texas"),
                        .localizable("Florida"),
                        .localizable("Freed the slaves (Emancipation Proclamation)")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("interchangeAnswer")
                        ) ?? .interchange,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("history-geo"),
                    type: .localizable("history-1800"),
                    question: .localizable("Name one war fought by the United States in the 1800s"),
                    correctAnswers: [
                        .localizable("Civil War"),
                        .localizable("Mexican-American War"),
                        .localizable("War of 1812"),
                        .localizable("Spanish-American War")
                    ],
                    wrongAnswers: [
                        .localizable("Japan, Korea, and Vietnam"),
                        .localizable("Independence Day"),
                        .localizable("World War I"),
                        .localizable("Nuclear power plants")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("interchangeAnswer")
                        ) ?? .interchange,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("history-geo"),
                    type: .localizable("history-1800"),
                    question: .localizable("Name the U.S. war between the North and the South."),
                    correctAnswers: [.localizable("The Civil War")],
                    wrongAnswers: [
                        .localizable("The Revolutionary War"),
                        .localizable("The Vietnam War"),
                        .localizable("The Korean War"),
                        .localizable("Twenty-one (21)")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("singleAnswer")
                        ) ?? .single,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("history-geo"),
                    type: .localizable("history-1800"),
                    question: .localizable("Name one problem that led to the Civil War"),
                    correctAnswers: [
                        .localizable("economic reasons"),
                        .localizable("slavery"),
                        .localizable("states rights")
                    ],
                    wrongAnswers: [
                        .localizable("Write to a newspaper"),
                        .localizable("taxation without representation"),
                        .localizable("A removal of a law"),
                        .localizable("Nuclear power plants")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("interchangeAnswer")
                        ) ?? .interchange,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("history-geo"),
                    type: .localizable("history-1800"),
                    question: .localizable("What was one important thing that Abraham Lincoln did?"),
                    correctAnswers: [
                        .localizable("Led the United States during the Civil War"),
                        .localizable("Saved (or preserved) the Union"),
                        .localizable("Freed the slaves (Emancipation Proclamation)")
                    ],
                    wrongAnswers: [
                        .localizable("Pay extra taxes"),
                        .localizable("slavery"),
                        .localizable("Oldest member of the Constitutional Convention"),
                        .localizable("Declared war on Britain")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("interchangeAnswer")
                        ) ?? .interchange,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("history-geo"),
                    type: .localizable("history-1800"),
                    question: .localizable("What did the Emancipation Proclamation do?"),
                    correctAnswers: [.localizable("Freed slaves in the Confederate states")],
                    wrongAnswers: [
                        .localizable("Gave women the right to vote"),
                        .localizable("Ended the Civil War"),
                        .localizable("Established the U.S. Constitution"),
                        .localizable("Leaders must obey the law")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("singleAnswer")
                        ) ?? .single,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("history-geo"),
                    type: .localizable("history-1800"),
                    question: .localizable("What did Susan B. Anthony do?"),
                    correctAnswers: [
                        .localizable("fought for civil rights"),
                        .localizable("fought for women rights")
                    ],
                    wrongAnswers: [
                        .localizable("wrote the Constitution"),
                        .localizable("led the Civil War"),
                        .localizable("Because of the state population"),
                        .localizable("Maryland")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("interchangeAnswer")
                        ) ?? .interchange,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("history-geo"),
                    type: .localizable("history-modern"),
                    question: .localizable("Name one war fought by the United States in the 1900s."),
                    correctAnswers: [
                        .localizable("(Persian) Gulf War"),
                        .localizable("Vietnam War"),
                        .localizable("World War I"),
                        .localizable("World War II"),
                        .localizable("Korean War")
                    ],
                    wrongAnswers: [
                        .localizable("The Chief Justice"),
                        .localizable("Revolutionary War"),
                        .localizable("September 17"),
                        .localizable("Because they didnt have self-government")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("interchangeAnswer")
                        ) ?? .interchange,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("history-geo"),
                    type: .localizable("history-modern"),
                    question: .localizable("Who was President during World War I?"),
                    correctAnswers: [.localizable("Woodrow Wilson")],
                    wrongAnswers: [
                        .localizable("Mohegan"),
                        .localizable("Congress"),
                        .localizable("Vermont"),
                        .localizable("Answers will vary")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("peopleAnswer")
                        ) ?? .peopleAnswer,
                    answerQuantity: nil,
                    answerKey: .localizable("wilson")
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("history-geo"),
                    type: .localizable("history-modern"),
                    question: .localizable("Who was President during the Great Depression and World War II?"),
                    correctAnswers: [.localizable("Franklin Roosevelt")],
                    wrongAnswers: [
                        .localizable("Only if joining the military"),
                        .localizable("Thanksgiving"),
                        .localizable("Leaders must obey the law"),
                        .localizable("Approve zoning and land use")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("peopleAnswer")
                        ) ?? .peopleAnswer,
                    answerQuantity: nil,
                    answerKey: .localizable("roosevelt")
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("history-geo"),
                    type: .localizable("history-modern"),
                    question: .localizable("Who did the United States fight in World War II?"),
                    correctAnswers: [.localizable("Japan, Germany, and Italy")],
                    wrongAnswers: [
                        .localizable("Russia, China, and Germany"),
                        .localizable("France, Germany, and Britain"),
                        .localizable("Japan, Korea, and Vietnam"),
                        .localizable("California")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("singleAnswer")
                        ) ?? .single,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("history-geo"),
                    type: .localizable("history-modern"),
                    question: .localizable("Before he was President, Eisenhower was a general. What war was he in?"),
                    correctAnswers: [.localizable("World War II")],
                    wrongAnswers: [
                        .localizable("Japan, Korea, and Vietnam"),
                        .localizable("Vietnam War"),
                        .localizable("World War I"),
                        .localizable("Korean War")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("singleAnswer")
                        ) ?? .single,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("history-geo"),
                    type: .localizable("history-modern"),
                    question: .localizable("During the Cold War, what was the main concern of the United States?"),
                    correctAnswers: [.localizable("Communism")],
                    wrongAnswers: [
                        .localizable("Gave women the right to vote"),
                        .localizable("Terrorism"),
                        .localizable("Immigration"),
                        .localizable("Nuclear power plants")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("singleAnswer")
                        ) ?? .single,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("history-geo"),
                    type: .localizable("history-modern"),
                    question: .localizable("What movement tried to end racial discrimination?"),
                    correctAnswers: [.localizable("Civil rights (movement)")],
                    wrongAnswers: [
                        .localizable("Only people who voted for them"),
                        .localizable("Green movement"),
                        .localizable("Labor movement"),
                        .localizable("Women suffrage")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("singleAnswer")
                        ) ?? .single,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("history-geo"),
                    type: .localizable("history-modern"),
                    question: .localizable("What did Martin Luther King, Jr. do?"),
                    correctAnswers: [
                        .localizable("Fought for civil rights"),
                        .localizable("Worked for equality for all Americans")
                    ],
                    wrongAnswers: [
                        .localizable("Wrote the Declaration of Independence"),
                        .localizable("Was a U.S. President"),
                        .localizable("Freedom from taxation"),
                        .localizable("two (2)")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("interchangeAnswer")
                        ) ?? .interchange,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("history-geo"),
                    type: .localizable("history-modern"),
                    question: .localizable("What major event happened on September 11, 2001, in the United States?"),
                    correctAnswers: [.localizable("Terrorists attacked the United States.")],
                    wrongAnswers: [
                        .localizable("The Civil Rights Act was passed."),
                        .localizable("The U.S. declared war on Iraq."),
                        .localizable("led the Civil War"),
                        .localizable("The stock market crashed.")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("singleAnswer")
                        ) ?? .single,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("history-geo"),
                    type: .localizable("history-modern"),
                    question: .localizable("Name one American Indian tribe in the United States."),
                    correctAnswers: [
                        .localizable("Choctaw"),
                        .localizable("Apache"),
                        .localizable("Seminole"),
                        .localizable("Pueblo"),
                        .localizable("Sioux"),
                        .localizable("Inuit"),
                        .localizable("Navajo"),
                        .localizable("Teton"),
                        .localizable("Oneida"),
                        .localizable("Creek"),
                        .localizable("Arawak"),
                        .localizable("Lakota"),
                        .localizable("Shawnee"),
                        .localizable("Blackfeet"),
                        .localizable("Cheyenne"),
                        .localizable("Huron"),
                        .localizable("Crow"),
                        .localizable("Cherokee"),
                        .localizable("Hopi"),
                        .localizable("Mohegan"),
                        .localizable("Chippewa"),
                        .localizable("Iroquois")
                    ],
                    wrongAnswers: [
                        .localizable("Executive"),
                        .localizable("Established the U.S. Constitution"),
                        .localizable("led the Civil War"),
                        .localizable("Zuni")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("interchangeAnswer")
                        ) ?? .interchange,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("history-geo"),
                    type: .localizable("geography"),
                    question: .localizable("Name one of the two longest rivers in the United States"),
                    correctAnswers: [
                        .localizable("Mississippi River"),
                        .localizable("Missouri River")
                    ],
                    wrongAnswers: [
                        .localizable("Mohegan"),
                        .localizable("Two hundred (200)"),
                        .localizable("Rio Grande"),
                        .localizable("Colorado River")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("interchangeAnswer")
                        ) ?? .interchange,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("history-geo"),
                    type: .localizable("geography"),
                    question: .localizable("What ocean is on the West Coast of the United States?"),
                    correctAnswers: [.localizable("Pacific Ocean")],
                    wrongAnswers: [
                        .localizable("Arctic Ocean"),
                        .localizable("Atlantic Ocean"),
                        .localizable("Labor Day"),
                        .localizable("Indian Ocean")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("singleAnswer")
                        ) ?? .single,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("history-geo"),
                    type: .localizable("geography"),
                    question: .localizable("What ocean is on the East Coast of the United States?"),
                    correctAnswers: [.localizable("Atlantic Ocean")],
                    wrongAnswers: [
                        .localizable("Southern Ocean"),
                        .localizable("Pacific Ocean"),
                        .localizable("Alaska"),
                        .localizable("Indian Ocean")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("singleAnswer")
                        ) ?? .single,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("history-geo"),
                    type: .localizable("geography"),
                    question: .localizable("Name one U.S. territory."),
                    correctAnswers: [
                        .localizable("U.S. Virgin Islands"),
                        .localizable("Northern Mariana Islands"),
                        .localizable("Guam"),
                        .localizable("American Samoa"),
                        .localizable("Puerto Rico")
                    ],
                    wrongAnswers: [
                        .localizable("Because they didnt have self-government"),
                        .localizable("eight (8)"),
                        .localizable("Serve (do important work for) the nation (if needed)"),
                        .localizable("Hawaii")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("interchangeAnswer")
                        ) ?? .interchange,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("history-geo"),
                    type: .localizable("geography"),
                    question: .localizable("Name one state that borders Canada."),
                    correctAnswers: [
                        .localizable("Pennsylvania"),
                        .localizable("North Dakota"),
                        .localizable("Idaho"),
                        .localizable("Minnesota"),
                        .localizable("Montana"),
                        .localizable("Ohio"),
                        .localizable("Maine"),
                        .localizable("Alaska"),
                        .localizable("Michigan"),
                        .localizable("Vermont"),
                        .localizable("New Hampshire"),
                        .localizable("Washington"),
                        .localizable("New York")
                    ],
                    wrongAnswers: [
                        .localizable("Independent"),
                        .localizable("Ended the Civil War"),
                        .localizable("Texas"),
                        .localizable("California")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("interchangeAnswer")
                        ) ?? .interchange,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("history-geo"),
                    type: .localizable("geography"),
                    question: .localizable("Name one state that borders Mexico."),
                    correctAnswers: [
                        .localizable("New Mexico"),
                        .localizable("Texas"),
                        .localizable("Arizona"),
                        .localizable("California")
                    ],
                    wrongAnswers: [
                        .localizable("Nevada"),
                        .localizable("To declare war"),
                        .localizable("Utah"),
                        .localizable("Secretary of the Treasury")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("interchangeAnswer")
                        ) ?? .interchange,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("history-geo"),
                    type: .localizable("geography"),
                    question: .localizable("What is the capital of the United States?"),
                    correctAnswers: [.localizable("Washington, D.C.")],
                    wrongAnswers: [
                        .localizable("Philadelphia"),
                        .localizable("New York City"),
                        .localizable("four (4)"),
                        .localizable("Los Angeles")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("singleAnswer")
                        ) ?? .single,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("history-geo"),
                    type: .localizable("geography"),
                    question: .localizable("Where is the Statue of Liberty?"),
                    correctAnswers: [
                        .localizable("Liberty Island"),
                        .localizable("New York (Harbor)")
                    ],
                    wrongAnswers: [
                        .localizable("Ellis Island"),
                        .localizable("Benjamin Franklin"),
                        .localizable("Immigration"),
                        .localizable("Washington, D.C.")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("interchangeAnswer")
                        ) ?? .interchange,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("history-geo"),
                    type: .localizable("symbols"),
                    question: .localizable("Why does the flag have 13 stripes?"),
                    correctAnswers: [
                        .localizable("because there were 13 original colonies"),
                        .localizable("because the stripes represent the original colonies")
                    ],
                    wrongAnswers: [
                        .localizable("because of 13 founding fathers"),
                        .localizable("because there were 13 amendments"),
                        .localizable("Choctaw"),
                        .localizable("Vermont")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("interchangeAnswer")
                        ) ?? .interchange,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("history-geo"),
                    type: .localizable("symbols"),
                    question: .localizable("Why does the flag have 50 stars?"),
                    correctAnswers: [
                        .localizable("because each star represents a state"),
                        .localizable("because there are 50 states"),
                        .localizable("because there is one star for each state")
                    ],
                    wrongAnswers: [
                        .localizable("Connecticut"),
                        .localizable("because of the 50 founding fathers"),
                        .localizable("Give up loyalty to other countries"),
                        .localizable("Pay taxes")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("interchangeAnswer")
                        ) ?? .interchange,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("history-geo"),
                    type: .localizable("symbols"),
                    question: .localizable("What is the name of the national anthem?"),
                    correctAnswers: [.localizable("The Star-Spangled Banner")],
                    wrongAnswers: [
                        .localizable("My Country, 'Tis of Thee"),
                        .localizable("God Bless America"),
                        .localizable("America the Beautiful"),
                        .localizable("The United States")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("singleAnswer")
                        ) ?? .single,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("history-geo"),
                    type: .localizable("symbols"),
                    question: .localizable("When do we celebrate Independence Day?"),
                    correctAnswers: [.localizable("July 4")],
                    wrongAnswers: [
                        .localizable("Philadelphia"),
                        .localizable("June 14"),
                        .localizable("September 17"),
                        .localizable("July 1")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("singleAnswer")
                        ) ?? .single,
                    answerQuantity: nil,
                    answerKey: nil
                ),
            DataModel
                .QuestionDecoded(
                    category: .localizable("history-geo"),
                    type: .localizable("symbols"),
                    question: .localizable("Name two national U.S. holidays."),
                    correctAnswers: [
                        .localizable("Christmas"),
                        .localizable("Veterans Day"),
                        .localizable("Columbus Day"),
                        .localizable("Independence Day"),
                        .localizable("Thanksgiving"),
                        .localizable("Presidents Day"),
                        .localizable("Labor Day"),
                        .localizable("New Year Day"),
                        .localizable("Martin Luther King, Jr. Day"),
                        .localizable("Memorial Day")
                    ],
                    wrongAnswers: [
                        .localizable("Cherokee"),
                        .localizable("Easter"),
                        .localizable("September 17"),
                        .localizable("Valentine Day")
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: .localizable("multipleAnswer")
                        ) ?? .multiple,
                    answerQuantity: 10,
                    answerKey: nil
                )
        ]
    }
}
