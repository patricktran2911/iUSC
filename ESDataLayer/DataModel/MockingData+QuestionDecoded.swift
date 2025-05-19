import ESLocalizer
import Combine
import Foundation

extension Array where Element == DataModel.QuestionDecoded {
    static public func dataPublisher() -> AnyPublisher<[DataModel.QuestionDecoded], Never> {
        UserDefaults.standard.publisher(for: \.appLocale).map { _ in
            [
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("principles", table: .dataModel),
                        question: ESLocalizer.text("What is the supreme law of the land?", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("The Constitution", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("The Bill of Rights", table: .dataModel),
                            ESLocalizer.text("The Declaration of Independence", table: .dataModel),
                            ESLocalizer.text("The Emancipation Proclamation", table: .dataModel),
                            ESLocalizer.text("Presidents Day", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "singleAnswer"
                            ) ?? .single,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("principles", table: .dataModel),
                        question: ESLocalizer.text("What does the Constitution do?", table: .dataModel),
                        correctAnswers: [
                            ESLocalizer.text("Defines the government", table: .dataModel),
                            ESLocalizer.text("Sets up the government", table: .dataModel),
                            ESLocalizer.text("Protects basic rights of Americans", table: .dataModel)
                        ],
                        wrongAnswers: [
                            ESLocalizer.text("states rights", table: .dataModel),
                            ESLocalizer.text("Green movement", table: .dataModel),
                            ESLocalizer.text("Declares independence from Great Britain", table: .dataModel),
                            ESLocalizer.text("Christmas", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "interchangeAnswer"
                            ) ?? .interchange,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("principles", table: .dataModel),
                        question: ESLocalizer.text("The idea of self-government is in the first three words of the Constitution. What are these words?", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("We the People", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("freedom of religion", table: .dataModel),
                            ESLocalizer.text("In God We Trust", table: .dataModel),
                            ESLocalizer.text("United We Stand", table: .dataModel),
                            ESLocalizer.text("Life, Liberty, Happiness", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "singleAnswer"
                            ) ?? .single,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("principles", table: .dataModel),
                        question: ESLocalizer.text("What is an amendment?", table: .dataModel),
                        correctAnswers: [
                            ESLocalizer.text("An addition (to the Constitution)", table: .dataModel),
                            ESLocalizer.text("A change (to the Constitution)", table: .dataModel)
                        ],
                        wrongAnswers: [
                            ESLocalizer.text("Appoints federal judges", table: .dataModel),
                            ESLocalizer.text("President", table: .dataModel),
                            ESLocalizer.text("A removal of a law", table: .dataModel),
                            ESLocalizer.text("A court ruling", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "interchangeAnswer"
                            ) ?? .interchange,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("principles", table: .dataModel),
                        question: ESLocalizer.text("What do we call the first ten amendments to the Constitution?", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("The Bill of Rights", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("The Federalist Papers", table: .dataModel),
                            ESLocalizer.text("To conquer the British", table: .dataModel),
                            ESLocalizer.text("The Declaration of Independence", table: .dataModel),
                            ESLocalizer.text("The Articles of Confederation", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "singleAnswer"
                            ) ?? .single,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("principles", table: .dataModel),
                        question: ESLocalizer.text("What is one right or freedom from the First Amendment?", table: .dataModel),
                        correctAnswers: [
                            ESLocalizer.text("Speech", table: .dataModel),
                            ESLocalizer.text("Petition the government", table: .dataModel),
                            ESLocalizer.text("Assembly", table: .dataModel),
                            ESLocalizer.text("Religion", table: .dataModel),
                            ESLocalizer.text("Press", table: .dataModel)
                        ],
                        wrongAnswers: [
                            ESLocalizer.text("Trial by jury", table: .dataModel),
                            ESLocalizer.text("Cherokee", table: .dataModel),
                            ESLocalizer.text("To declare war", table: .dataModel),
                            ESLocalizer.text("Right to bear arms", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "interchangeAnswer"
                            ) ?? .interchange,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("principles", table: .dataModel),
                        question: ESLocalizer.text("How many amendments does the Constitution have?", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("Twenty-seven (27)", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("Twenty-one (21)", table: .dataModel),
                            ESLocalizer.text("To set up schools", table: .dataModel),
                            ESLocalizer.text("Thirty-three (33)", table: .dataModel),
                            ESLocalizer.text("Ten (10)", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "singleAnswer"
                            ) ?? .single,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("principles", table: .dataModel),
                        question: ESLocalizer.text("What did the Declaration of Independence do?", table: .dataModel),
                        correctAnswers: [
                            ESLocalizer.text("Declared our independence (from Great Britain)", table: .dataModel),
                            ESLocalizer.text("Said that the United States is free (from Great Britain)", table: .dataModel),
                            ESLocalizer.text("Announced our independence (from Great Britain)", table: .dataModel)
                        ],
                        wrongAnswers: [
                            ESLocalizer.text("eight (8)", table: .dataModel),
                            ESLocalizer.text("Established the U.S. Constitution", table: .dataModel),
                            ESLocalizer.text("Korean War", table: .dataModel),
                            ESLocalizer.text("Decides if a law goes against the Constitution", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "interchangeAnswer"
                            ) ?? .interchange,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("principles", table: .dataModel),
                        question: ESLocalizer.text("What are two rights in the Declaration of Independence?", table: .dataModel),
                        correctAnswers: [
                            ESLocalizer.text("Pursuit of happiness", table: .dataModel),
                            ESLocalizer.text("Liberty", table: .dataModel),
                            ESLocalizer.text("Life", table: .dataModel)
                        ],
                        wrongAnswers: [
                            ESLocalizer.text("Mohegan", table: .dataModel),
                            ESLocalizer.text("Freedom of speech", table: .dataModel),
                            ESLocalizer.text("Freedom from taxation", table: .dataModel),
                            ESLocalizer.text("Right to bear arms", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "multipleAnswer"
                            ) ?? .multiple,
                        answerQuantity: 3,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("principles", table: .dataModel),
                        question: ESLocalizer.text("What is freedom of religion?", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("You can practice any religion, or not practice a religion.", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("Freedom of religion applies only in churches.", table: .dataModel),
                            ESLocalizer.text("Only major religions are recognized.", table: .dataModel),
                            ESLocalizer.text("Checks and balances", table: .dataModel),
                            ESLocalizer.text("You must choose a religion by age 18.", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "singleAnswer"
                            ) ?? .single,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("principles", table: .dataModel),
                        question: ESLocalizer.text("What is the economic system in the United States?", table: .dataModel),
                        correctAnswers: [
                            ESLocalizer.text("Capitalist economy", table: .dataModel),
                            ESLocalizer.text("Market economy", table: .dataModel)
                        ],
                        wrongAnswers: [
                            ESLocalizer.text("Socialist economy", table: .dataModel),
                            ESLocalizer.text("Judicial review", table: .dataModel),
                            ESLocalizer.text("April 15", table: .dataModel),
                            ESLocalizer.text("Planned economy", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "interchangeAnswer"
                            ) ?? .interchange,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("principles", table: .dataModel),
                        question: ESLocalizer.text("What is the rule of law?", table: .dataModel),
                        correctAnswers: [
                            ESLocalizer.text("Government must obey the law", table: .dataModel),
                            ESLocalizer.text("No one is above the law", table: .dataModel),
                            ESLocalizer.text("Leaders must obey the law", table: .dataModel),
                            ESLocalizer.text("Everyone must follow the law", table: .dataModel)
                        ],
                        wrongAnswers: [
                            ESLocalizer.text("Mike Pence", table: .dataModel),
                            ESLocalizer.text("The president decides the law", table: .dataModel),
                            ESLocalizer.text("Navajo", table: .dataModel),
                            ESLocalizer.text("the right to bear arms", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "interchangeAnswer"
                            ) ?? .interchange,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("systems", table: .dataModel),
                        question: ESLocalizer.text("Name one branch or part of the government.", table: .dataModel),
                        correctAnswers: [
                            ESLocalizer.text("President", table: .dataModel),
                            ESLocalizer.text("Congress", table: .dataModel),
                            ESLocalizer.text("Judicial", table: .dataModel),
                            ESLocalizer.text("The courts", table: .dataModel),
                            ESLocalizer.text("Executive", table: .dataModel),
                            ESLocalizer.text("Legislative", table: .dataModel)
                        ],
                        wrongAnswers: [
                            ESLocalizer.text("Federal Reserve", table: .dataModel),
                            ESLocalizer.text("because there were 13 original colonies", table: .dataModel),
                            ESLocalizer.text("State governments", table: .dataModel),
                            ESLocalizer.text("Two hundred (200)", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "interchangeAnswer"
                            ) ?? .interchange,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("systems", table: .dataModel),
                        question: ESLocalizer.text("What stops one branch of government from becoming too powerful?", table: .dataModel),
                        correctAnswers: [
                            ESLocalizer.text("Checks and balances", table: .dataModel),
                            ESLocalizer.text("Separation of powers", table: .dataModel)
                        ],
                        wrongAnswers: [
                            ESLocalizer.text("Publius", table: .dataModel),
                            ESLocalizer.text("Judicial review", table: .dataModel),
                            ESLocalizer.text("Executive orders", table: .dataModel),
                            ESLocalizer.text("George Washington", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "interchangeAnswer"
                            ) ?? .interchange,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("systems", table: .dataModel),
                        question: ESLocalizer.text("Who is in charge of the executive branch?", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("The President", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("The Speaker of the House", table: .dataModel),
                            ESLocalizer.text("The Vice President", table: .dataModel),
                            ESLocalizer.text("The Chief Justice", table: .dataModel),
                            ESLocalizer.text("Everyone must follow the law", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "singleAnswer"
                            ) ?? .single,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("systems", table: .dataModel),
                        question: ESLocalizer.text("Who makes federal laws?", table: .dataModel),
                        correctAnswers: [
                            ESLocalizer.text("The Congress", table: .dataModel),
                            ESLocalizer.text("The Senate and the House (of Representatives)", table: .dataModel),
                            ESLocalizer.text("The U.S. (national) legislature", table: .dataModel)
                        ],
                        wrongAnswers: [
                            ESLocalizer.text("The Constitution was written", table: .dataModel),
                            ESLocalizer.text("because the stripes represent the original colonies", table: .dataModel),
                            ESLocalizer.text("The Supreme Court", table: .dataModel),
                            ESLocalizer.text("The Vice President", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "interchangeAnswer"
                            ) ?? .interchange,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("systems", table: .dataModel),
                        question: ESLocalizer.text("What are the two parts of the U.S. Congress?", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("The Senate and House (of Representatives)", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("The Cabinet and Congress", table: .dataModel),
                            ESLocalizer.text("The President and Vice President", table: .dataModel),
                            ESLocalizer.text("The Judicial and Executive branches", table: .dataModel),
                            ESLocalizer.text("because there is one star for each state", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "singleAnswer"
                            ) ?? .single,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("systems", table: .dataModel),
                        question: ESLocalizer.text("How many U.S. Senators are there?", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("One hundred (100)", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("Fifty (50)", table: .dataModel),
                            ESLocalizer.text("Two hundred (200)", table: .dataModel),
                            ESLocalizer.text("Vietnam War", table: .dataModel),
                            ESLocalizer.text("Four hundred thirty-five (435)", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "singleAnswer"
                            ) ?? .single,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("systems", table: .dataModel),
                        question: ESLocalizer.text("We elect a U.S. Senator for how many years?", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("six (6)", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("eight (8)", table: .dataModel),
                            ESLocalizer.text("Freedom", table: .dataModel),
                            ESLocalizer.text("four (4)", table: .dataModel),
                            ESLocalizer.text("two (2)", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "singleAnswer"
                            ) ?? .single,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("systems", table: .dataModel),
                        question: ESLocalizer.text("Who is one of your state U.S. Senators now?", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("Answers will vary", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("Russia, China, and Germany", table: .dataModel),
                            ESLocalizer.text("American Samoa", table: .dataModel),
                            ESLocalizer.text("Provide schooling and education", table: .dataModel),
                            ESLocalizer.text("Petition the government", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "stateAnswer"
                            ) ?? .stateAnswer,
                        answerQuantity: nil,
                        answerKey: ESLocalizer.text("senator", table: .dataModel)
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("systems", table: .dataModel),
                        question: ESLocalizer.text("The House of Representatives has how many voting members?", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("Four hundred thirty-five (435)", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("Two hundred (200)", table: .dataModel),
                            ESLocalizer.text("Freedom from taxation", table: .dataModel),
                            ESLocalizer.text("Three hundred (300)", table: .dataModel),
                            ESLocalizer.text("One hundred (100)", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "singleAnswer"
                            ) ?? .single,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("systems", table: .dataModel),
                        question: ESLocalizer.text("We elect a U.S. Representative for how many years?", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("Two (2)", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("Four (4)", table: .dataModel),
                            ESLocalizer.text("Six (6)", table: .dataModel),
                            ESLocalizer.text("One (1)", table: .dataModel),
                            ESLocalizer.text("Nancy Pelosi", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "singleAnswer"
                            ) ?? .single,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("systems", table: .dataModel),
                        question: ESLocalizer.text("Name your U.S. Representative", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("Answers will vary", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("Michigan", table: .dataModel),
                            ESLocalizer.text("because each star represents a state", table: .dataModel),
                            ESLocalizer.text("Massachusetts", table: .dataModel),
                            ESLocalizer.text("Everyone must follow the law", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "stateAnswer"
                            ) ?? .stateAnswer,
                        answerQuantity: nil,
                        answerKey: ESLocalizer.text("representative", table: .dataModel)
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("systems", table: .dataModel),
                        question: ESLocalizer.text("Who does a U.S. Senator represent?", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("All people of the state", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("Mike Pence", table: .dataModel),
                            ESLocalizer.text("Only state lawmakers", table: .dataModel),
                            ESLocalizer.text("Only people who voted for them", table: .dataModel),
                            ESLocalizer.text("Only the people in their political party", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "singleAnswer"
                            ) ?? .single,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("systems", table: .dataModel),
                        question: ESLocalizer.text("Why do some states have more Representatives than other states?", table: .dataModel),
                        correctAnswers: [
                            ESLocalizer.text("Because some states have more people", table: .dataModel),
                            ESLocalizer.text("Because of the state population", table: .dataModel),
                            ESLocalizer.text("Because they have more people", table: .dataModel)
                        ],
                        wrongAnswers: [
                            ESLocalizer.text("Give a driver license", table: .dataModel),
                            ESLocalizer.text("Because they are larger in size", table: .dataModel),
                            ESLocalizer.text("Leaders must obey the law", table: .dataModel),
                            ESLocalizer.text("The Federal Court of Appeals", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "interchangeAnswer"
                            ) ?? .interchange,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("systems", table: .dataModel),
                        question: ESLocalizer.text("We elect a President for how many years?", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("Four (4)", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("Two (2)", table: .dataModel),
                            ESLocalizer.text("Six (6)", table: .dataModel),
                            ESLocalizer.text("Delaware", table: .dataModel),
                            ESLocalizer.text("Eight (8)", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "singleAnswer"
                            ) ?? .single,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("systems", table: .dataModel),
                        question: ESLocalizer.text("In what month do we vote for President?", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("November", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("The Judicial and Executive branches", table: .dataModel),
                            ESLocalizer.text("October", table: .dataModel),
                            ESLocalizer.text("January", table: .dataModel),
                            ESLocalizer.text("December", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "singleAnswer"
                            ) ?? .single,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("systems", table: .dataModel),
                        question: ESLocalizer.text("What is the name of the President of the United States now?", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("Donald J. Trump", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("Religious freedom", table: .dataModel),
                            ESLocalizer.text("Socialist economy", table: .dataModel),
                            ESLocalizer.text("South Carolina", table: .dataModel),
                            ESLocalizer.text("Zuni", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "peopleAnswer"
                            ) ?? .peopleAnswer,
                        answerQuantity: nil,
                        answerKey: ESLocalizer.text("president", table: .dataModel)
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("systems", table: .dataModel),
                        question: ESLocalizer.text("What is the name of the Vice President of the United States now?", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("Mike Pence", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("Publicly support or oppose an issue or policy", table: .dataModel),
                            ESLocalizer.text("At age eighteen (18)", table: .dataModel),
                            ESLocalizer.text("Secretary of Transportation", table: .dataModel),
                            ESLocalizer.text("because there are 50 states", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "peopleAnswer"
                            ) ?? .peopleAnswer,
                        answerQuantity: nil,
                        answerKey: ESLocalizer.text("vicePresident", table: .dataModel)
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("systems", table: .dataModel),
                        question: ESLocalizer.text("If the President can no longer serve, who becomes President?", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("The Vice President", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("You can practice any religion, or not practice a religion.", table: .dataModel),
                            ESLocalizer.text("The Speaker of the House", table: .dataModel),
                            ESLocalizer.text("The Secretary of State", table: .dataModel),
                            ESLocalizer.text("The Chief Justice", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "singleAnswer"
                            ) ?? .single,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("systems", table: .dataModel),
                        question: ESLocalizer.text("If both the President and the Vice President can no longer serve, who becomes President?", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("The Speaker of the House", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("The Secretary of State", table: .dataModel),
                            ESLocalizer.text("The Chief Justice", table: .dataModel),
                            ESLocalizer.text("The President Pro Tempore of the Senate", table: .dataModel),
                            ESLocalizer.text("Provide protection (police)", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "singleAnswer"
                            ) ?? .single,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("systems", table: .dataModel),
                        question: ESLocalizer.text("Who is the Commander in Chief of the military?", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("The President", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("The Secretary of Defense", table: .dataModel),
                            ESLocalizer.text("The Vice President", table: .dataModel),
                            ESLocalizer.text("The Chairman of the Joint Chiefs", table: .dataModel),
                            ESLocalizer.text("Secretary of the Interior", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "singleAnswer"
                            ) ?? .single,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("systems", table: .dataModel),
                        question: ESLocalizer.text("Who signs bills to become laws?", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("The President", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("October", table: .dataModel),
                            ESLocalizer.text("The Speaker of the House", table: .dataModel),
                            ESLocalizer.text("The Vice President", table: .dataModel),
                            ESLocalizer.text("The Chief Justice", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "singleAnswer"
                            ) ?? .single,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("systems", table: .dataModel),
                        question: ESLocalizer.text("Who vetoes bills?", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("The President", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("The Speaker of the House", table: .dataModel),
                            ESLocalizer.text("Navajo", table: .dataModel),
                            ESLocalizer.text("The Chief Justice", table: .dataModel),
                            ESLocalizer.text("The Senate Majority Leader", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "singleAnswer"
                            ) ?? .single,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("systems", table: .dataModel),
                        question: ESLocalizer.text("What does the President Cabinet do?", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("Advises the President", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("Commands the military", table: .dataModel),
                            "1776",
                            ESLocalizer.text("Writes federal regulations", table: .dataModel),
                            ESLocalizer.text("Approves laws", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "singleAnswer"
                            ) ?? .single,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("systems", table: .dataModel),
                        question: ESLocalizer.text("What are two Cabinet-level positions?", table: .dataModel),
                        correctAnswers: [
                            ESLocalizer.text("Secretary of Commerce", table: .dataModel),
                            ESLocalizer.text("Secretary of the Interior", table: .dataModel),
                            ESLocalizer.text("Secretary of Veterans Affairs", table: .dataModel),
                            ESLocalizer.text("Secretary of Homeland Security", table: .dataModel),
                            ESLocalizer.text("Secretary of Health and Human Services", table: .dataModel),
                            ESLocalizer.text("Attorney General", table: .dataModel),
                            ESLocalizer.text("Secretary of Education", table: .dataModel),
                            ESLocalizer.text("Secretary of State", table: .dataModel),
                            ESLocalizer.text("Secretary of Labor", table: .dataModel),
                            ESLocalizer.text("Secretary of the Treasury", table: .dataModel),
                            ESLocalizer.text("Vice President", table: .dataModel),
                            ESLocalizer.text("Secretary of Agriculture", table: .dataModel),
                            ESLocalizer.text("Secretary of Transportation", table: .dataModel),
                            ESLocalizer.text("Secretary of Housing and Urban Development", table: .dataModel),
                            ESLocalizer.text("Secretary of Energy", table: .dataModel),
                            ESLocalizer.text("Secretary of Defense", table: .dataModel)
                        ],
                        wrongAnswers: [
                            ESLocalizer.text("Majority Leader", table: .dataModel),
                            ESLocalizer.text("Speaker of the House", table: .dataModel),
                            ESLocalizer.text("Blackfeet", table: .dataModel),
                            ESLocalizer.text("Chief Justice", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "multipleAnswer"
                            ) ?? .multiple,
                        answerQuantity: 16,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("systems", table: .dataModel),
                        question: ESLocalizer.text("What does the judicial branch do?", table: .dataModel),
                        correctAnswers: [
                            ESLocalizer.text("Reviews laws", table: .dataModel),
                            ESLocalizer.text("Explains laws", table: .dataModel),
                            ESLocalizer.text("Resolves disputes (disagreements)", table: .dataModel),
                            ESLocalizer.text("Decides if a law goes against the Constitution", table: .dataModel)
                        ],
                        wrongAnswers: [
                            ESLocalizer.text("Appoints federal judges", table: .dataModel),
                            ESLocalizer.text("June 14", table: .dataModel),
                            ESLocalizer.text("Enforces laws", table: .dataModel),
                            ESLocalizer.text("Press", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "interchangeAnswer"
                            ) ?? .interchange,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("systems", table: .dataModel),
                        question: ESLocalizer.text("What is the highest court in the United States?", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("The Supreme Court", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("Only state lawmakers", table: .dataModel),
                            ESLocalizer.text("The District Court", table: .dataModel),
                            ESLocalizer.text("The Constitutional Court", table: .dataModel),
                            ESLocalizer.text("The Federal Court of Appeals", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "singleAnswer"
                            ) ?? .single,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("systems", table: .dataModel),
                        question: ESLocalizer.text("How many justices are on the Supreme Court?", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("Nine (9)", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("Twelve (12)", table: .dataModel),
                            ESLocalizer.text("Seven (7)", table: .dataModel),
                            ESLocalizer.text("Ten (10)", table: .dataModel),
                            ESLocalizer.text("You must choose a religion by age 18.", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "singleAnswer"
                            ) ?? .single,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("systems", table: .dataModel),
                        question: ESLocalizer.text("Who is the Chief Justice of the United States now?", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("John Roberts", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("Vietnam War", table: .dataModel),
                            ESLocalizer.text("California", table: .dataModel),
                            ESLocalizer.text("Defend the Constitution and laws of the United States", table: .dataModel),
                            ESLocalizer.text("Planned economy", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "peopleAnswer"
                            ) ?? .peopleAnswer,
                        answerQuantity: nil,
                        answerKey: ESLocalizer.text("chiefJustice", table: .dataModel)
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("systems", table: .dataModel),
                        question: ESLocalizer.text("Under our Constitution, some powers belong to the federal government. What is one power of the federal government?", table: .dataModel),
                        correctAnswers: [
                            ESLocalizer.text("To make treaties", table: .dataModel),
                            ESLocalizer.text("To create an army", table: .dataModel),
                            ESLocalizer.text("To print money", table: .dataModel),
                            ESLocalizer.text("To declare war", table: .dataModel)
                        ],
                        wrongAnswers: [
                            ESLocalizer.text("To issue driver licenses", table: .dataModel),
                            ESLocalizer.text("To set up schools", table: .dataModel),
                            ESLocalizer.text("Korean War", table: .dataModel),
                            ESLocalizer.text("Sioux", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "interchangeAnswer"
                            ) ?? .interchange,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("systems", table: .dataModel),
                        question: ESLocalizer.text("Under our Constitution, some powers belong to the states. What is one power of the states?", table: .dataModel),
                        correctAnswers: [
                            ESLocalizer.text("Provide schooling and education", table: .dataModel),
                            ESLocalizer.text("Give a driver license", table: .dataModel),
                            ESLocalizer.text("Approve zoning and land use", table: .dataModel),
                            ESLocalizer.text("Provide safety (fire departments)", table: .dataModel),
                            ESLocalizer.text("Provide protection (police)", table: .dataModel)
                        ],
                        wrongAnswers: [
                            ESLocalizer.text("Freedom", table: .dataModel),
                            ESLocalizer.text("Delaware", table: .dataModel),
                            ESLocalizer.text("The Bill of Rights was debated", table: .dataModel),
                            ESLocalizer.text("Print money", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "interchangeAnswer"
                            ) ?? .interchange,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("systems", table: .dataModel),
                        question: ESLocalizer.text("Who is the Governor of your state now?", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("Answers will vary", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("Oneida", table: .dataModel),
                            ESLocalizer.text("Only if joining the military", table: .dataModel),
                            ESLocalizer.text("John Roberts", table: .dataModel),
                            ESLocalizer.text("No one is above the law", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "stateAnswer"
                            ) ?? .stateAnswer,
                        answerQuantity: nil,
                        answerKey: ESLocalizer.text("governor", table: .dataModel)
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("systems", table: .dataModel),
                        question: ESLocalizer.text("What is the capital of your state?", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("Answers will vary", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("Philadelphia", table: .dataModel),
                            ESLocalizer.text("South Carolina", table: .dataModel),
                            ESLocalizer.text("Massachusetts", table: .dataModel),
                            ESLocalizer.text("Market economy", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "stateAnswer"
                            ) ?? .stateAnswer,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("systems", table: .dataModel),
                        question: ESLocalizer.text("What are the two major political parties in the United States?", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("Democratic and Republican", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("Serve in the U.S. military (if needed)", table: .dataModel),
                            ESLocalizer.text("Green and Libertarian", table: .dataModel),
                            ESLocalizer.text("Federalist and Whig", table: .dataModel),
                            ESLocalizer.text("Labor and Conservative", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "singleAnswer"
                            ) ?? .single,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("systems", table: .dataModel),
                        question: ESLocalizer.text("What is the political party of the President now?", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("Republican", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("Independent", table: .dataModel),
                            ESLocalizer.text("Secretary of Homeland Security", table: .dataModel),
                            ESLocalizer.text("Libertarian", table: .dataModel),
                            ESLocalizer.text("Democratic", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "singleAnswer"
                            ) ?? .single,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("systems", table: .dataModel),
                        question: ESLocalizer.text("What is the name of the Speaker of the House of Representatives now?", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("Nancy Pelosi", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("Nine (9)", table: .dataModel),
                            ESLocalizer.text("Attorney General", table: .dataModel),
                            ESLocalizer.text("Federalist and Whig", table: .dataModel),
                            ESLocalizer.text("Obey the laws of the United States", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "peopleAnswer"
                            ) ?? .peopleAnswer,
                        answerQuantity: nil,
                        answerKey: ESLocalizer.text("speaker", table: .dataModel)
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("rights", table: .dataModel),
                        question: ESLocalizer.text("There are four amendments to the Constitution about who can vote. Describe one of them.", table: .dataModel),
                        correctAnswers: [
                            ESLocalizer.text("Citizens eighteen (18) and older can vote", table: .dataModel),
                            ESLocalizer.text("A male citizen of any race (can vote).", table: .dataModel),
                            ESLocalizer.text("You dont have to pay (a poll tax) to vote", table: .dataModel),
                            ESLocalizer.text("Any citizen can vote. (Women and men can vote)", table: .dataModel)
                        ],
                        wrongAnswers: [
                            ESLocalizer.text("Only property owners can vote", table: .dataModel),
                            ESLocalizer.text("Only taxpayers can vote", table: .dataModel),
                            ESLocalizer.text("Trial by jury", table: .dataModel),
                            ESLocalizer.text("Valentine Day", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "interchangeAnswer"
                            ) ?? .interchange,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("rights", table: .dataModel),
                        question: ESLocalizer.text("What is one responsibility that is only for United States citizens?", table: .dataModel),
                        correctAnswers: [
                            ESLocalizer.text("Vote in a federal election", table: .dataModel),
                            ESLocalizer.text("Serve on a jury", table: .dataModel)
                        ],
                        wrongAnswers: [
                            ESLocalizer.text("Give an elected official your opinion on an issue", table: .dataModel),
                            ESLocalizer.text("Pay taxes", table: .dataModel),
                            ESLocalizer.text("A court ruling", table: .dataModel),
                            ESLocalizer.text("Obey the law", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "interchangeAnswer"
                            ) ?? .interchange,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("rights", table: .dataModel),
                        question: ESLocalizer.text("Name one right only for United States citizens", table: .dataModel),
                        correctAnswers: [
                            ESLocalizer.text("Run for federal office", table: .dataModel),
                            ESLocalizer.text("Vote in a federal election", table: .dataModel)
                        ],
                        wrongAnswers: [
                            ESLocalizer.text("The Congress", table: .dataModel),
                            ESLocalizer.text("Freedom of religion", table: .dataModel),
                            ESLocalizer.text("Freedom of speech", table: .dataModel),
                            ESLocalizer.text("Declared our independence (from Great Britain)", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "interchangeAnswer"
                            ) ?? .interchange,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("rights", table: .dataModel),
                        question: ESLocalizer.text("What are two rights of everyone living in the United States?", table: .dataModel),
                        correctAnswers: [
                            ESLocalizer.text("freedom of religion", table: .dataModel),
                            ESLocalizer.text("freedom of expression", table: .dataModel),
                            ESLocalizer.text("the right to bear arms", table: .dataModel),
                            ESLocalizer.text("freedom of assembly", table: .dataModel),
                            ESLocalizer.text("freedom to petition the government", table: .dataModel),
                            ESLocalizer.text("freedom of speech", table: .dataModel)
                        ],
                        wrongAnswers: [
                            ESLocalizer.text("because there is one star for each state", table: .dataModel),
                            ESLocalizer.text("free college education", table: .dataModel),
                            ESLocalizer.text("Because they have more people", table: .dataModel),
                            ESLocalizer.text("New York", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "multipleAnswer"
                            ) ?? .multiple,
                        answerQuantity: 6,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("rights", table: .dataModel),
                        question: ESLocalizer.text("What do we show loyalty to when we say the Pledge of Allegiance?", table: .dataModel),
                        correctAnswers: [
                            ESLocalizer.text("The flag", table: .dataModel),
                            ESLocalizer.text("The United States", table: .dataModel)
                        ],
                        wrongAnswers: [
                            ESLocalizer.text("The military", table: .dataModel),
                            ESLocalizer.text("The Constitution", table: .dataModel),
                            ESLocalizer.text("Valentine Day", table: .dataModel),
                            ESLocalizer.text("Secretary of Agriculture", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "interchangeAnswer"
                            ) ?? .interchange,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("rights", table: .dataModel),
                        question: ESLocalizer.text("What is one promise you make when you become a United States citizen?", table: .dataModel),
                        correctAnswers: [
                            ESLocalizer.text("Be loyal to the United States", table: .dataModel),
                            ESLocalizer.text("Give up loyalty to other countries", table: .dataModel),
                            ESLocalizer.text("Serve (do important work for) the nation (if needed)", table: .dataModel),
                            ESLocalizer.text("Obey the laws of the United States", table: .dataModel),
                            ESLocalizer.text("Defend the Constitution and laws of the United States", table: .dataModel),
                            ESLocalizer.text("Serve in the U.S. military (if needed)", table: .dataModel)
                        ],
                        wrongAnswers: [
                            ESLocalizer.text("Only taxpayers can vote", table: .dataModel),
                            ESLocalizer.text("Pay no taxes", table: .dataModel),
                            ESLocalizer.text("Only state lawmakers", table: .dataModel),
                            ESLocalizer.text("Twenty-seven (27)", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "interchangeAnswer"
                            ) ?? .interchange,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("rights", table: .dataModel),
                        question: ESLocalizer.text("How old do citizens have to be to vote for President?", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("Eighteen (18) and older", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("Sixteen (16) and older", table: .dataModel),
                            ESLocalizer.text("Any age with parental consent", table: .dataModel),
                            ESLocalizer.text("freedom of expression", table: .dataModel),
                            ESLocalizer.text("Twenty-one (21) and older", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "singleAnswer"
                            ) ?? .single,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("rights", table: .dataModel),
                        question: ESLocalizer.text("What are two ways that Americans can participate in their democracy?", table: .dataModel),
                        correctAnswers: [
                            ESLocalizer.text("Write to a newspaper", table: .dataModel),
                            ESLocalizer.text("Run for office", table: .dataModel),
                            ESLocalizer.text("Join a community group", table: .dataModel),
                            ESLocalizer.text("Join a civic group", table: .dataModel),
                            ESLocalizer.text("Publicly support or oppose an issue or policy", table: .dataModel),
                            ESLocalizer.text("Call Senators and Representatives", table: .dataModel),
                            ESLocalizer.text("Give an elected official your opinion on an issue", table: .dataModel),
                            ESLocalizer.text("Help with a campaign", table: .dataModel),
                            ESLocalizer.text("Vote", table: .dataModel),
                            ESLocalizer.text("Join a political party", table: .dataModel)
                        ],
                        wrongAnswers: [
                            ESLocalizer.text("Pay extra taxes", table: .dataModel),
                            ESLocalizer.text("Martin Luther King, Jr. Day", table: .dataModel),
                            ESLocalizer.text("Join the military to vote", table: .dataModel),
                            ESLocalizer.text("Atlantic Ocean", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "multipleAnswer"
                            ) ?? .multiple,
                        answerQuantity: 10,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("rights", table: .dataModel),
                        question: ESLocalizer.text("When is the last day you can send in federal income tax forms?", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("April 15", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("December 31", table: .dataModel),
                            ESLocalizer.text("War of 1812", table: .dataModel),
                            ESLocalizer.text("May 1", table: .dataModel),
                            ESLocalizer.text("March 1", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "singleAnswer"
                            ) ?? .single,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "government",
                        type: ESLocalizer.text("rights", table: .dataModel),
                        question: ESLocalizer.text("When must all men register for the Selective Service?", table: .dataModel),
                        correctAnswers: [
                            ESLocalizer.text("Between eighteen (18) and twenty-six (26)", table: .dataModel),
                            ESLocalizer.text("At age eighteen (18)", table: .dataModel)
                        ],
                        wrongAnswers: [
                            ESLocalizer.text("The Secretary of Defense", table: .dataModel),
                            ESLocalizer.text("Only if joining the military", table: .dataModel),
                            ESLocalizer.text("Choctaw", table: .dataModel),
                            ESLocalizer.text("Before turning 16", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "interchangeAnswer"
                            ) ?? .interchange,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "history-geo",
                        type: ESLocalizer.text("history-colonial", table: .dataModel),
                        question: ESLocalizer.text("What is one reason colonists came to America?", table: .dataModel),
                        correctAnswers: [
                            ESLocalizer.text("Economic opportunity", table: .dataModel),
                            ESLocalizer.text("Practice their religion", table: .dataModel),
                            ESLocalizer.text("Escape persecution", table: .dataModel),
                            ESLocalizer.text("Religious freedom", table: .dataModel),
                            ESLocalizer.text("Freedom", table: .dataModel),
                            ESLocalizer.text("Political liberty", table: .dataModel)
                        ],
                        wrongAnswers: [
                            ESLocalizer.text("Secretary of the Interior", table: .dataModel),
                            ESLocalizer.text("To conquer the British", table: .dataModel),
                            ESLocalizer.text("To avoid paying taxes", table: .dataModel),
                            ESLocalizer.text("Maryland", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "interchangeAnswer"
                            ) ?? .interchange,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "history-geo",
                        type: ESLocalizer.text("history-colonial", table: .dataModel),
                        question: ESLocalizer.text("Who lived in America before the Europeans arrived?", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("Native Americans", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("Declared our independence (from Great Britain)", table: .dataModel),
                            ESLocalizer.text("Africans", table: .dataModel),
                            ESLocalizer.text("Pilgrims", table: .dataModel),
                            ESLocalizer.text("British settlers", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "singleAnswer"
                            ) ?? .single,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "history-geo",
                        type: ESLocalizer.text("history-colonial", table: .dataModel),
                        question: ESLocalizer.text("What group of people was taken to America and sold as slaves?", table: .dataModel),
                        correctAnswers: [
                            ESLocalizer.text("Africans", table: .dataModel),
                            ESLocalizer.text("People from Africa", table: .dataModel)
                        ],
                        wrongAnswers: [
                            ESLocalizer.text("Montana", table: .dataModel),
                            ESLocalizer.text("Native Americans", table: .dataModel),
                            ESLocalizer.text("Europeans", table: .dataModel),
                            ESLocalizer.text("Presidents Day", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "interchangeAnswer"
                            ) ?? .interchange,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "history-geo",
                        type: ESLocalizer.text("history-colonial", table: .dataModel),
                        question: ESLocalizer.text("Why did the colonists fight the British?", table: .dataModel),
                        correctAnswers: [
                            ESLocalizer.text("Because they didnt have self-government", table: .dataModel),
                            ESLocalizer.text("Because the British army stayed in their houses (boarding, quartering)", table: .dataModel),
                            ESLocalizer.text("Because of high taxes (taxation without representation)", table: .dataModel)
                        ],
                        wrongAnswers: [
                            ESLocalizer.text("Huron", table: .dataModel),
                            ESLocalizer.text("Because they disliked tea", table: .dataModel),
                            ESLocalizer.text("New York City", table: .dataModel),
                            ESLocalizer.text("Signer of the Emancipation Proclamation", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "singleAnswer"
                            ) ?? .single,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "history-geo",
                        type: ESLocalizer.text("history-colonial", table: .dataModel),
                        question: ESLocalizer.text("Who wrote the Declaration of Independence?", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("Thomas Jefferson", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("John Adams", table: .dataModel),
                            ESLocalizer.text("Chief Justice", table: .dataModel),
                            ESLocalizer.text("Benjamin Franklin", table: .dataModel),
                            ESLocalizer.text("George Washington", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "singleAnswer"
                            ) ?? .single,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "history-geo",
                        type: ESLocalizer.text("history-colonial", table: .dataModel),
                        question: ESLocalizer.text("When was the Declaration of Independence adopted?", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("July 4, 1776", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("June 4, 1776", table: .dataModel),
                            ESLocalizer.text("September 17, 1787", table: .dataModel),
                            ESLocalizer.text("July 2, 1776", table: .dataModel),
                            ESLocalizer.text("A removal of a law", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "singleAnswer"
                            ) ?? .single,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "history-geo",
                        type: ESLocalizer.text("history-colonial", table: .dataModel),
                        question: ESLocalizer.text("There were 13 original states. Name three.", table: .dataModel),
                        correctAnswers: [
                            ESLocalizer.text("North Carolina", table: .dataModel),
                            ESLocalizer.text("Pennsylvania", table: .dataModel),
                            ESLocalizer.text("Maryland", table: .dataModel),
                            ESLocalizer.text("New Jersey", table: .dataModel),
                            ESLocalizer.text("Georgia", table: .dataModel),
                            ESLocalizer.text("Delaware", table: .dataModel),
                            ESLocalizer.text("Massachusetts", table: .dataModel),
                            ESLocalizer.text("South Carolina", table: .dataModel),
                            ESLocalizer.text("Connecticut", table: .dataModel),
                            ESLocalizer.text("Virginia", table: .dataModel),
                            ESLocalizer.text("New Hampshire", table: .dataModel),
                            ESLocalizer.text("Rhode Island", table: .dataModel),
                            ESLocalizer.text("New York", table: .dataModel)
                        ],
                        wrongAnswers: [
                            ESLocalizer.text("To print money", table: .dataModel),
                            ESLocalizer.text("Ohio", table: .dataModel),
                            ESLocalizer.text("Vermont", table: .dataModel),
                            ESLocalizer.text("Obey the law", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "multipleAnswer"
                            ) ?? .multiple,
                        answerQuantity: 13,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "history-geo",
                        type: ESLocalizer.text("history-colonial", table: .dataModel),
                        question: ESLocalizer.text("What happened at the Constitutional Convention?", table: .dataModel),
                        correctAnswers: [
                            ESLocalizer.text("The Constitution was written", table: .dataModel),
                            ESLocalizer.text("The Founding Fathers wrote the Constitution", table: .dataModel)
                        ],
                        wrongAnswers: [
                            ESLocalizer.text("War of 1812", table: .dataModel),
                            ESLocalizer.text("The Bill of Rights was debated", table: .dataModel),
                            ESLocalizer.text("January", table: .dataModel),
                            ESLocalizer.text("The Declaration of Independence was signed", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "interchangeAnswer"
                            ) ?? .interchange,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "history-geo",
                        type: ESLocalizer.text("history-colonial", table: .dataModel),
                        question: ESLocalizer.text("When was the Constitution written?", table: .dataModel),
                        correctAnswers: ["1787"],
                        wrongAnswers: [
                            "1801",
                            "1776",
                            ESLocalizer.text("Pennsylvania", table: .dataModel),
                            "1791"
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "singleAnswer"
                            ) ?? .single,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "history-geo",
                        type: ESLocalizer.text("history-colonial", table: .dataModel),
                        question: ESLocalizer.text("The Federalist Papers supported the passage of the U.S. Constitution. Name one of the writers", table: .dataModel),
                        correctAnswers: [
                            ESLocalizer.text("Publius", table: .dataModel),
                            ESLocalizer.text("John Jay", table: .dataModel),
                            ESLocalizer.text("James Madison", table: .dataModel),
                            ESLocalizer.text("Alexander Hamilton", table: .dataModel)
                        ],
                        wrongAnswers: [
                            ESLocalizer.text("Only state lawmakers", table: .dataModel),
                            ESLocalizer.text("World War II", table: .dataModel),
                            ESLocalizer.text("Apache", table: .dataModel),
                            ESLocalizer.text("George Washington", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "interchangeAnswer"
                            ) ?? .interchange,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "history-geo",
                        type: ESLocalizer.text("history-colonial", table: .dataModel),
                        question: ESLocalizer.text("What is one thing Benjamin Franklin is famous for?", table: .dataModel),
                        correctAnswers: [
                            ESLocalizer.text("U.S. diplomat", table: .dataModel),
                            ESLocalizer.text("Oldest member of the Constitutional Convention", table: .dataModel),
                            ESLocalizer.text("First Postmaster General of the United States", table: .dataModel),
                            ESLocalizer.text("Started the first free libraries", table: .dataModel),
                            ESLocalizer.text("Writer of Poor Richard Almanac", table: .dataModel)
                        ],
                        wrongAnswers: [
                            ESLocalizer.text("Arctic Ocean", table: .dataModel),
                            ESLocalizer.text("Immigration", table: .dataModel),
                            ESLocalizer.text("The Secretary of State", table: .dataModel),
                            ESLocalizer.text("Signer of the Emancipation Proclamation", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "interchangeAnswer"
                            ) ?? .interchange,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "history-geo",
                        type: ESLocalizer.text("history-colonial", table: .dataModel),
                        question: ESLocalizer.text("Who is the Father of Our Country?", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("George Washington", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("Vote", table: .dataModel),
                            ESLocalizer.text("Donald J. Trump", table: .dataModel),
                            ESLocalizer.text("May 1", table: .dataModel),
                            ESLocalizer.text("Japan, Korea, and Vietnam", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "peopleAnswer"
                            ) ?? .peopleAnswer,
                        answerQuantity: nil,
                        answerKey: ESLocalizer.text("washington", table: .dataModel)
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "history-geo",
                        type: ESLocalizer.text("history-colonial", table: .dataModel),
                        question: ESLocalizer.text("Who was the first President?", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("George Washington", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("Fought for civil rights", table: .dataModel),
                            ESLocalizer.text("To conquer the British", table: .dataModel),
                            ESLocalizer.text("The United States", table: .dataModel),
                            ESLocalizer.text("The District Court", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "peopleAnswer"
                            ) ?? .peopleAnswer,
                        answerQuantity: nil,
                        answerKey: ESLocalizer.text("washington", table: .dataModel)
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "history-geo",
                        type: ESLocalizer.text("history-1800", table: .dataModel),
                        question: ESLocalizer.text("What territory did the United States buy from France in 1803?", table: .dataModel),
                        correctAnswers: [
                            ESLocalizer.text("Louisiana", table: .dataModel),
                            ESLocalizer.text("The Louisiana Territory", table: .dataModel)
                        ],
                        wrongAnswers: [
                            ESLocalizer.text("Independence Day", table: .dataModel),
                            ESLocalizer.text("Texas", table: .dataModel),
                            ESLocalizer.text("Florida", table: .dataModel),
                            ESLocalizer.text("Freed the slaves (Emancipation Proclamation)", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "interchangeAnswer"
                            ) ?? .interchange,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "history-geo",
                        type: ESLocalizer.text("history-1800", table: .dataModel),
                        question: ESLocalizer.text("Name one war fought by the United States in the 1800s", table: .dataModel),
                        correctAnswers: [
                            ESLocalizer.text("Civil War", table: .dataModel),
                            ESLocalizer.text("Mexican-American War", table: .dataModel),
                            ESLocalizer.text("War of 1812", table: .dataModel),
                            ESLocalizer.text("Spanish-American War", table: .dataModel)
                        ],
                        wrongAnswers: [
                            ESLocalizer.text("Japan, Korea, and Vietnam", table: .dataModel),
                            ESLocalizer.text("Independence Day", table: .dataModel),
                            ESLocalizer.text("World War I", table: .dataModel),
                            ESLocalizer.text("Nuclear power plants", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "interchangeAnswer"
                            ) ?? .interchange,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "history-geo",
                        type: ESLocalizer.text("history-1800", table: .dataModel),
                        question: ESLocalizer.text("Name the U.S. war between the North and the South.", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("The Civil War", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("The Revolutionary War", table: .dataModel),
                            ESLocalizer.text("The Vietnam War", table: .dataModel),
                            ESLocalizer.text("The Korean War", table: .dataModel),
                            ESLocalizer.text("Twenty-one (21)", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "singleAnswer"
                            ) ?? .single,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "history-geo",
                        type: ESLocalizer.text("history-1800", table: .dataModel),
                        question: ESLocalizer.text("Name one problem that led to the Civil War", table: .dataModel),
                        correctAnswers: [
                            ESLocalizer.text("economic reasons", table: .dataModel),
                            ESLocalizer.text("slavery", table: .dataModel),
                            ESLocalizer.text("states rights", table: .dataModel)
                        ],
                        wrongAnswers: [
                            ESLocalizer.text("Write to a newspaper", table: .dataModel),
                            ESLocalizer.text("taxation without representation", table: .dataModel),
                            ESLocalizer.text("A removal of a law", table: .dataModel),
                            ESLocalizer.text("Nuclear power plants", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "interchangeAnswer"
                            ) ?? .interchange,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "history-geo",
                        type: ESLocalizer.text("history-1800", table: .dataModel),
                        question: ESLocalizer.text("What was one important thing that Abraham Lincoln did?", table: .dataModel),
                        correctAnswers: [
                            ESLocalizer.text("Led the United States during the Civil War", table: .dataModel),
                            ESLocalizer.text("Saved (or preserved) the Union", table: .dataModel),
                            ESLocalizer.text("Freed the slaves (Emancipation Proclamation)", table: .dataModel)
                        ],
                        wrongAnswers: [
                            ESLocalizer.text("Pay extra taxes", table: .dataModel),
                            ESLocalizer.text("slavery", table: .dataModel),
                            ESLocalizer.text("Oldest member of the Constitutional Convention", table: .dataModel),
                            ESLocalizer.text("Declared war on Britain", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "interchangeAnswer"
                            ) ?? .interchange,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "history-geo",
                        type: ESLocalizer.text("history-1800", table: .dataModel),
                        question: ESLocalizer.text("What did the Emancipation Proclamation do?", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("Freed slaves in the Confederate states", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("Gave women the right to vote", table: .dataModel),
                            ESLocalizer.text("Ended the Civil War", table: .dataModel),
                            ESLocalizer.text("Established the U.S. Constitution", table: .dataModel),
                            ESLocalizer.text("Leaders must obey the law", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "singleAnswer"
                            ) ?? .single,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "history-geo",
                        type: ESLocalizer.text("history-1800", table: .dataModel),
                        question: ESLocalizer.text("What did Susan B. Anthony do?", table: .dataModel),
                        correctAnswers: [
                            ESLocalizer.text("fought for civil rights", table: .dataModel),
                            ESLocalizer.text("fought for women rights", table: .dataModel)
                        ],
                        wrongAnswers: [
                            ESLocalizer.text("wrote the Constitution", table: .dataModel),
                            ESLocalizer.text("led the Civil War", table: .dataModel),
                            ESLocalizer.text("Because of the state population", table: .dataModel),
                            ESLocalizer.text("Maryland", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "interchangeAnswer"
                            ) ?? .interchange,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "history-geo",
                        type: ESLocalizer.text("history-modern", table: .dataModel),
                        question: ESLocalizer.text("Name one war fought by the United States in the 1900s.", table: .dataModel),
                        correctAnswers: [
                            ESLocalizer.text("(Persian) Gulf War", table: .dataModel),
                            ESLocalizer.text("Vietnam War", table: .dataModel),
                            ESLocalizer.text("World War I", table: .dataModel),
                            ESLocalizer.text("World War II", table: .dataModel),
                            ESLocalizer.text("Korean War", table: .dataModel)
                        ],
                        wrongAnswers: [
                            ESLocalizer.text("The Chief Justice", table: .dataModel),
                            ESLocalizer.text("Revolutionary War", table: .dataModel),
                            ESLocalizer.text("September 17", table: .dataModel),
                            ESLocalizer.text("Because they didnt have self-government", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "interchangeAnswer"
                            ) ?? .interchange,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "history-geo",
                        type: ESLocalizer.text("history-modern", table: .dataModel),
                        question: ESLocalizer.text("Who was President during World War I?", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("Woodrow Wilson", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("Mohegan", table: .dataModel),
                            ESLocalizer.text("Congress", table: .dataModel),
                            ESLocalizer.text("Vermont", table: .dataModel),
                            ESLocalizer.text("Answers will vary", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "peopleAnswer"
                            ) ?? .peopleAnswer,
                        answerQuantity: nil,
                        answerKey: ESLocalizer.text("wilson", table: .dataModel)
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "history-geo",
                        type: ESLocalizer.text("history-modern", table: .dataModel),
                        question: ESLocalizer.text("Who was President during the Great Depression and World War II?", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("Franklin Roosevelt", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("Only if joining the military", table: .dataModel),
                            ESLocalizer.text("Thanksgiving", table: .dataModel),
                            ESLocalizer.text("Leaders must obey the law", table: .dataModel),
                            ESLocalizer.text("Approve zoning and land use", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "peopleAnswer"
                            ) ?? .peopleAnswer,
                        answerQuantity: nil,
                        answerKey: ESLocalizer.text("roosevelt", table: .dataModel)
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "history-geo",
                        type: ESLocalizer.text("history-modern", table: .dataModel),
                        question: ESLocalizer.text("Who did the United States fight in World War II?", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("Japan, Germany, and Italy", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("Russia, China, and Germany", table: .dataModel),
                            ESLocalizer.text("France, Germany, and Britain", table: .dataModel),
                            ESLocalizer.text("Japan, Korea, and Vietnam", table: .dataModel),
                            ESLocalizer.text("California", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "singleAnswer"
                            ) ?? .single,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "history-geo",
                        type: ESLocalizer.text("history-modern", table: .dataModel),
                        question: ESLocalizer.text("Before he was President, Eisenhower was a general. What war was he in?", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("World War II", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("Japan, Korea, and Vietnam", table: .dataModel),
                            ESLocalizer.text("Vietnam War", table: .dataModel),
                            ESLocalizer.text("World War I", table: .dataModel),
                            ESLocalizer.text("Korean War", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "singleAnswer"
                            ) ?? .single,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "history-geo",
                        type: ESLocalizer.text("history-modern", table: .dataModel),
                        question: ESLocalizer.text("During the Cold War, what was the main concern of the United States?", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("Communism", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("Gave women the right to vote", table: .dataModel),
                            ESLocalizer.text("Terrorism", table: .dataModel),
                            ESLocalizer.text("Immigration", table: .dataModel),
                            ESLocalizer.text("Nuclear power plants", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "singleAnswer"
                            ) ?? .single,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "history-geo",
                        type: ESLocalizer.text("history-modern", table: .dataModel),
                        question: ESLocalizer.text("What movement tried to end racial discrimination?", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("Civil rights (movement)", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("Only people who voted for them", table: .dataModel),
                            ESLocalizer.text("Green movement", table: .dataModel),
                            ESLocalizer.text("Labor movement", table: .dataModel),
                            ESLocalizer.text("Women suffrage", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "singleAnswer"
                            ) ?? .single,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "history-geo",
                        type: ESLocalizer.text("history-modern", table: .dataModel),
                        question: ESLocalizer.text("What did Martin Luther King, Jr. do?", table: .dataModel),
                        correctAnswers: [
                            ESLocalizer.text("Fought for civil rights", table: .dataModel),
                            ESLocalizer.text("Worked for equality for all Americans", table: .dataModel)
                        ],
                        wrongAnswers: [
                            ESLocalizer.text("Wrote the Declaration of Independence", table: .dataModel),
                            ESLocalizer.text("Was a U.S. President", table: .dataModel),
                            ESLocalizer.text("Freedom from taxation", table: .dataModel),
                            ESLocalizer.text("two (2)", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "interchangeAnswer"
                            ) ?? .interchange,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "history-geo",
                        type: ESLocalizer.text("history-modern", table: .dataModel),
                        question: ESLocalizer.text("What major event happened on September 11, 2001, in the United States?", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("Terrorists attacked the United States.", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("The Civil Rights Act was passed.", table: .dataModel),
                            ESLocalizer.text("The U.S. declared war on Iraq.", table: .dataModel),
                            ESLocalizer.text("led the Civil War", table: .dataModel),
                            ESLocalizer.text("The stock market crashed.", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "singleAnswer"
                            ) ?? .single,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "history-geo",
                        type: ESLocalizer.text("history-modern", table: .dataModel),
                        question: ESLocalizer.text("Name one American Indian tribe in the United States.", table: .dataModel),
                        correctAnswers: [
                            ESLocalizer.text("Choctaw", table: .dataModel),
                            ESLocalizer.text("Apache", table: .dataModel),
                            ESLocalizer.text("Seminole", table: .dataModel),
                            ESLocalizer.text("Pueblo", table: .dataModel),
                            ESLocalizer.text("Sioux", table: .dataModel),
                            ESLocalizer.text("Inuit", table: .dataModel),
                            ESLocalizer.text("Navajo", table: .dataModel),
                            ESLocalizer.text("Teton", table: .dataModel),
                            ESLocalizer.text("Oneida", table: .dataModel),
                            ESLocalizer.text("Creek", table: .dataModel),
                            ESLocalizer.text("Arawak", table: .dataModel),
                            ESLocalizer.text("Lakota", table: .dataModel),
                            ESLocalizer.text("Shawnee", table: .dataModel),
                            ESLocalizer.text("Blackfeet", table: .dataModel),
                            ESLocalizer.text("Cheyenne", table: .dataModel),
                            ESLocalizer.text("Huron", table: .dataModel),
                            ESLocalizer.text("Crow", table: .dataModel),
                            ESLocalizer.text("Cherokee", table: .dataModel),
                            ESLocalizer.text("Hopi", table: .dataModel),
                            ESLocalizer.text("Mohegan", table: .dataModel),
                            ESLocalizer.text("Chippewa", table: .dataModel),
                            ESLocalizer.text("Iroquois", table: .dataModel)
                        ],
                        wrongAnswers: [
                            ESLocalizer.text("Executive", table: .dataModel),
                            ESLocalizer.text("Established the U.S. Constitution", table: .dataModel),
                            ESLocalizer.text("led the Civil War", table: .dataModel),
                            ESLocalizer.text("Zuni", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "interchangeAnswer"
                            ) ?? .interchange,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "history-geo",
                        type: ESLocalizer.text("geography", table: .dataModel),
                        question: ESLocalizer.text("Name one of the two longest rivers in the United States", table: .dataModel),
                        correctAnswers: [
                            ESLocalizer.text("Mississippi River", table: .dataModel),
                            ESLocalizer.text("Missouri River", table: .dataModel)
                        ],
                        wrongAnswers: [
                            ESLocalizer.text("Mohegan", table: .dataModel),
                            ESLocalizer.text("Two hundred (200)", table: .dataModel),
                            ESLocalizer.text("Rio Grande", table: .dataModel),
                            ESLocalizer.text("Colorado River", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "interchangeAnswer"
                            ) ?? .interchange,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "history-geo",
                        type: ESLocalizer.text("geography", table: .dataModel),
                        question: ESLocalizer.text("What ocean is on the West Coast of the United States?", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("Pacific Ocean", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("Arctic Ocean", table: .dataModel),
                            ESLocalizer.text("Atlantic Ocean", table: .dataModel),
                            ESLocalizer.text("Labor Day", table: .dataModel),
                            ESLocalizer.text("Indian Ocean", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "singleAnswer"
                            ) ?? .single,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "history-geo",
                        type: ESLocalizer.text("geography", table: .dataModel),
                        question: ESLocalizer.text("What ocean is on the East Coast of the United States?", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("Atlantic Ocean", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("Southern Ocean", table: .dataModel),
                            ESLocalizer.text("Pacific Ocean", table: .dataModel),
                            ESLocalizer.text("Alaska", table: .dataModel),
                            ESLocalizer.text("Indian Ocean", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "singleAnswer"
                            ) ?? .single,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "history-geo",
                        type: ESLocalizer.text("geography", table: .dataModel),
                        question: ESLocalizer.text("Name one U.S. territory.", table: .dataModel),
                        correctAnswers: [
                            ESLocalizer.text("U.S. Virgin Islands", table: .dataModel),
                            ESLocalizer.text("Northern Mariana Islands", table: .dataModel),
                            ESLocalizer.text("Guam", table: .dataModel),
                            ESLocalizer.text("American Samoa", table: .dataModel),
                            ESLocalizer.text("Puerto Rico", table: .dataModel)
                        ],
                        wrongAnswers: [
                            ESLocalizer.text("Because they didnt have self-government", table: .dataModel),
                            ESLocalizer.text("eight (8)", table: .dataModel),
                            ESLocalizer.text("Serve (do important work for) the nation (if needed)", table: .dataModel),
                            ESLocalizer.text("Hawaii", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "interchangeAnswer"
                            ) ?? .interchange,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "history-geo",
                        type: ESLocalizer.text("geography", table: .dataModel),
                        question: ESLocalizer.text("Name one state that borders Canada.", table: .dataModel),
                        correctAnswers: [
                            ESLocalizer.text("Pennsylvania", table: .dataModel),
                            ESLocalizer.text("North Dakota", table: .dataModel),
                            ESLocalizer.text("Idaho", table: .dataModel),
                            ESLocalizer.text("Minnesota", table: .dataModel),
                            ESLocalizer.text("Montana", table: .dataModel),
                            ESLocalizer.text("Ohio", table: .dataModel),
                            ESLocalizer.text("Maine", table: .dataModel),
                            ESLocalizer.text("Alaska", table: .dataModel),
                            ESLocalizer.text("Michigan", table: .dataModel),
                            ESLocalizer.text("Vermont", table: .dataModel),
                            ESLocalizer.text("New Hampshire", table: .dataModel),
                            ESLocalizer.text("Washington", table: .dataModel),
                            ESLocalizer.text("New York", table: .dataModel)
                        ],
                        wrongAnswers: [
                            ESLocalizer.text("Independent", table: .dataModel),
                            ESLocalizer.text("Ended the Civil War", table: .dataModel),
                            ESLocalizer.text("Texas", table: .dataModel),
                            ESLocalizer.text("California", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "interchangeAnswer"
                            ) ?? .interchange,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "history-geo",
                        type: ESLocalizer.text("geography", table: .dataModel),
                        question: ESLocalizer.text("Name one state that borders Mexico.", table: .dataModel),
                        correctAnswers: [
                            ESLocalizer.text("New Mexico", table: .dataModel),
                            ESLocalizer.text("Texas", table: .dataModel),
                            ESLocalizer.text("Arizona", table: .dataModel),
                            ESLocalizer.text("California", table: .dataModel)
                        ],
                        wrongAnswers: [
                            ESLocalizer.text("Nevada", table: .dataModel),
                            ESLocalizer.text("To declare war", table: .dataModel),
                            ESLocalizer.text("Utah", table: .dataModel),
                            ESLocalizer.text("Secretary of the Treasury", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "interchangeAnswer"
                            ) ?? .interchange,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "history-geo",
                        type: ESLocalizer.text("geography", table: .dataModel),
                        question: ESLocalizer.text("What is the capital of the United States?", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("Washington, D.C.", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("Philadelphia", table: .dataModel),
                            ESLocalizer.text("New York City", table: .dataModel),
                            ESLocalizer.text("four (4)", table: .dataModel),
                            ESLocalizer.text("Los Angeles", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "singleAnswer"
                            ) ?? .single,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "history-geo",
                        type: ESLocalizer.text("geography", table: .dataModel),
                        question: ESLocalizer.text("Where is the Statue of Liberty?", table: .dataModel),
                        correctAnswers: [
                            ESLocalizer.text("Liberty Island", table: .dataModel),
                            ESLocalizer.text("New York (Harbor)", table: .dataModel)
                        ],
                        wrongAnswers: [
                            ESLocalizer.text("Ellis Island", table: .dataModel),
                            ESLocalizer.text("Benjamin Franklin", table: .dataModel),
                            ESLocalizer.text("Immigration", table: .dataModel),
                            ESLocalizer.text("Washington, D.C.", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "interchangeAnswer"
                            ) ?? .interchange,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "history-geo",
                        type: ESLocalizer.text("symbols", table: .dataModel),
                        question: ESLocalizer.text("Why does the flag have 13 stripes?", table: .dataModel),
                        correctAnswers: [
                            ESLocalizer.text("because there were 13 original colonies", table: .dataModel),
                            ESLocalizer.text("because the stripes represent the original colonies", table: .dataModel)
                        ],
                        wrongAnswers: [
                            ESLocalizer.text("because of 13 founding fathers", table: .dataModel),
                            ESLocalizer.text("because there were 13 amendments", table: .dataModel),
                            ESLocalizer.text("Choctaw", table: .dataModel),
                            ESLocalizer.text("Vermont", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "interchangeAnswer"
                            ) ?? .interchange,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "history-geo",
                        type: ESLocalizer.text("symbols", table: .dataModel),
                        question: ESLocalizer.text("Why does the flag have 50 stars?", table: .dataModel),
                        correctAnswers: [
                            ESLocalizer.text("because each star represents a state", table: .dataModel),
                            ESLocalizer.text("because there are 50 states", table: .dataModel),
                            ESLocalizer.text("because there is one star for each state", table: .dataModel)
                        ],
                        wrongAnswers: [
                            ESLocalizer.text("Connecticut", table: .dataModel),
                            ESLocalizer.text("because of the 50 founding fathers", table: .dataModel),
                            ESLocalizer.text("Give up loyalty to other countries", table: .dataModel),
                            ESLocalizer.text("Pay taxes", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "interchangeAnswer"
                            ) ?? .interchange,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "history-geo",
                        type: ESLocalizer.text("symbols", table: .dataModel),
                        question: ESLocalizer.text("What is the name of the national anthem?", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("The Star-Spangled Banner", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("My Country, 'Tis of Thee", table: .dataModel),
                            ESLocalizer.text("God Bless America", table: .dataModel),
                            ESLocalizer.text("America the Beautiful", table: .dataModel),
                            ESLocalizer.text("The United States", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "singleAnswer"
                            ) ?? .single,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "history-geo",
                        type: ESLocalizer.text("symbols", table: .dataModel),
                        question: ESLocalizer.text("When do we celebrate Independence Day?", table: .dataModel),
                        correctAnswers: [ESLocalizer.text("July 4", table: .dataModel)],
                        wrongAnswers: [
                            ESLocalizer.text("Philadelphia", table: .dataModel),
                            ESLocalizer.text("June 14", table: .dataModel),
                            ESLocalizer.text("September 17", table: .dataModel),
                            ESLocalizer.text("July 1", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "singleAnswer"
                            ) ?? .single,
                        answerQuantity: nil,
                        answerKey: nil
                    ),
                DataModel
                    .QuestionDecoded(
                        category: "history-geo",
                        type: ESLocalizer.text("symbols", table: .dataModel),
                        question: ESLocalizer.text("Name two national U.S. holidays.", table: .dataModel),
                        correctAnswers: [
                            ESLocalizer.text("Christmas", table: .dataModel),
                            ESLocalizer.text("Veterans Day", table: .dataModel),
                            ESLocalizer.text("Columbus Day", table: .dataModel),
                            ESLocalizer.text("Independence Day", table: .dataModel),
                            ESLocalizer.text("Thanksgiving", table: .dataModel),
                            ESLocalizer.text("Presidents Day", table: .dataModel),
                            ESLocalizer.text("Labor Day", table: .dataModel),
                            ESLocalizer.text("New Year Day", table: .dataModel),
                            ESLocalizer.text("Martin Luther King, Jr. Day", table: .dataModel),
                            ESLocalizer.text("Memorial Day", table: .dataModel)
                        ],
                        wrongAnswers: [
                            ESLocalizer.text("Cherokee", table: .dataModel),
                            ESLocalizer.text("Easter", table: .dataModel),
                            ESLocalizer.text("September 17", table: .dataModel),
                            ESLocalizer.text("Valentine Day", table: .dataModel)
                        ],
                        answerType: DataModel.QuestionDecoded
                            .AnswerType(
                                rawValue: "multipleAnswer"
                            ) ?? .multiple,
                        answerQuantity: 10,
                        answerKey: nil
                    )
            ]
        }
        .eraseToAnyPublisher()
    }
}

public extension UserDefaults {
    static let appLocaleKey = "AppLocale"
    
    @objc dynamic var appLocale: Locale {
        get {
            guard let locale = UserDefaults.standard.string(forKey: UserDefaults.appLocaleKey) else {
                return .current
            }
            return Locale(identifier: locale)
        }
        
        set {
            UserDefaults.standard.set(newValue.identifier, forKey: UserDefaults.appLocaleKey)
        }
    }
}
