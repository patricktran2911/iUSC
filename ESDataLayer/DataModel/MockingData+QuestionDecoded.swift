extension DataModel.QuestionDecoded {
    func mockData() -> [DataModel.QuestionDecoded] {
        [
            DataModel
                .QuestionDecoded(
                    category: "government",
                    type: "principles",
                    question: String(
                        localized: "Question_1"
                    ) ,
                    correctAnswers: ["The Constitution"],
                    wrongAnswers: [
                        "The Bill of Rights",
                        "The Declaration of Independence",
                        "The Emancipation Proclamation",
                        "Presidents Day"
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
                    type: "principles",
                    question: String(
                        localized: "Question_2"
                    ),
                    correctAnswers: [
                        "Defines the government",
                        "Sets up the government",
                        "Protects basic rights of Americans"
                    ],
                    wrongAnswers: [
                        "states rights",
                        "Green movement",
                        "Declares independence from Great Britain",
                        "Christmas"
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
                    type: "principles",
                    question: String(
                        localized: "Question_3"
                    ),
                    correctAnswers: ["We the People"],
                    wrongAnswers: [
                        "freedom of religion",
                        "In God We Trust",
                        "United We Stand",
                        "Life, Liberty, Happiness"
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
                    type: "principles",
                    question: String(
                        localized: "Question_4"
                    ),
                    correctAnswers: [
                        "An addition (to the Constitution)",
                        "A change (to the Constitution)"
                    ],
                    wrongAnswers: [
                        "Appoints federal judges",
                        "President",
                        "A removal of a law",
                        "A court ruling"
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
                    type: "principles",
                    question: String(
                        localized: "Question_5"
                    ),
                    correctAnswers: ["The Bill of Rights"],
                    wrongAnswers: [
                        "The Federalist Papers",
                        "To conquer the British",
                        "The Declaration of Independence",
                        "The Articles of Confederation"
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
                    type: "principles",
                    question: String(
                        localized: "Question_6"
                    ),
                    correctAnswers: [
                        "Speech",
                        "Petition the government",
                        "Assembly",
                        "Religion",
                        "Press"
                    ],
                    wrongAnswers: [
                        "Trial by jury",
                        "Cherokee",
                        "To declare war",
                        "Right to bear arms"
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
                    type: "principles",
                    question: String(
                        localized: "Question_7"
                    ),
                    correctAnswers: ["Twenty-seven (27)"],
                    wrongAnswers: [
                        "Twenty-one (21)",
                        "To set up schools",
                        "Thirty-three (33)",
                        "Ten (10)"
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
                    type: "principles",
                    question: String(
                        localized: "Question_8"
                    ),
                    correctAnswers: [
                        "Declared our independence (from Great Britain)",
                        "Said that the United States is free (from Great Britain)",
                        "Announced our independence (from Great Britain)"
                    ],
                    wrongAnswers: [
                        "eight (8)",
                        "Established the U.S. Constitution",
                        "Korean War",
                        "Decides if a law goes against the Constitution"
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
                    type: "principles",
                    question: String(
                        localized: "Question_9"
                    ),
                    correctAnswers: [
                        "Pursuit of happiness",
                        "Liberty",
                        "Life"
                    ],
                    wrongAnswers: [
                        "Mohegan",
                        "Freedom of speech",
                        "Freedom from taxation",
                        "Right to bear arms"
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
                    type: "principles",
                    question: String(
                        localized: "Question_10"
                    ),
                    correctAnswers: ["You can practice any religion, or not practice a religion."],
                    wrongAnswers: [
                        "Freedom of religion applies only in churches.",
                        "Only major religions are recognized.",
                        "Checks and balances",
                        "You must choose a religion by age 18."
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
                    type: "principles",
                    question: String(
                        localized: "Question_11"
                    ),
                    correctAnswers: [
                        "Capitalist economy",
                        "Market economy"
                    ],
                    wrongAnswers: [
                        "Socialist economy",
                        "Judicial review",
                        "April 15",
                        "Planned economy"
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
                    type: "principles",
                    question: String(
                        localized: "Question_12"
                    ),
                    correctAnswers: [
                        "Government must obey the law",
                        "No one is above the law",
                        "Leaders must obey the law",
                        "Everyone must follow the law"
                    ],
                    wrongAnswers: [
                        "Mike Pence",
                        "The president decides the law",
                        "Navajo",
                        "the right to bear arms"
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
                    type: "systems",
                    question: String(
                        localized: "Question_13"
                    ),
                    correctAnswers: [
                        "President",
                        "Congress",
                        "Judicial",
                        "The courts",
                        "Executive",
                        "Legislative"
                    ],
                    wrongAnswers: [
                        "Federal Reserve",
                        "because there were 13 original colonies",
                        "State governments",
                        "Two hundred (200)"
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
                    type: "systems",
                    question: String(
                        localized: "Question_14"
                    ),
                    correctAnswers: [
                        "Checks and balances",
                        "Separation of powers"
                    ],
                    wrongAnswers: [
                        "Publius",
                        "Judicial review",
                        "Executive orders",
                        "George Washington"
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
                    type: "systems",
                    question: String(
                        localized: "Question_15"
                    ),
                    correctAnswers: ["The President"],
                    wrongAnswers: [
                        "The Speaker of the House",
                        "The Vice President",
                        "The Chief Justice",
                        "Everyone must follow the law"
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
                    type: "systems",
                    question: String(
                        localized: "Question_16"
                    ),
                    correctAnswers: [
                        "The Congress",
                        "The Senate and the House (of Representatives)",
                        "The U.S. (national) legislature"
                    ],
                    wrongAnswers: [
                        "The Constitution was written",
                        "because the stripes represent the original colonies",
                        "The Supreme Court",
                        "The Vice President"
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
                    type: "systems",
                    question: String(
                        localized: "Question_17"
                    ),
                    correctAnswers: ["The Senate and House (of Representatives)"],
                    wrongAnswers: [
                        "The Cabinet and Congress",
                        "The President and Vice President",
                        "The Judicial and Executive branches",
                        "because there is one star for each state"
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
                    type: "systems",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: ["One hundred (100)"],
                    wrongAnswers: [
                        "Fifty (50)",
                        "Two hundred (200)",
                        "Vietnam War",
                        "Four hundred thirty-five (435)"
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
                    type: "systems",
                    question: String(
                        localized: "Question_18"
                    ),
                    correctAnswers: ["six (6)"],
                    wrongAnswers: [
                        "eight (8)",
                        "Freedom",
                        "four (4)",
                        "two (2)"
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
                    type: "systems",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: ["Answers will vary"],
                    wrongAnswers: [
                        "Russia, China, and Germany",
                        "American Samoa",
                        "Provide schooling and education",
                        "Petition the government"
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: "stateAnswer"
                        ) ?? .stateAnswer,
                    answerQuantity: nil,
                    answerKey: "senator"
                ),
            DataModel
                .QuestionDecoded(
                    category: "government",
                    type: "systems",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: ["Four hundred thirty-five (435)"],
                    wrongAnswers: [
                        "Two hundred (200)",
                        "Freedom from taxation",
                        "Three hundred (300)",
                        "One hundred (100)"
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
                    type: "systems",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: ["Two (2)"],
                    wrongAnswers: [
                        "Four (4)",
                        "Six (6)",
                        "One (1)",
                        "Nancy Pelosi"
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
                    type: "systems",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: ["Answers will vary"],
                    wrongAnswers: [
                        "Michigan",
                        "because each star represents a state",
                        "Massachusetts",
                        "Everyone must follow the law"
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: "stateAnswer"
                        ) ?? .stateAnswer,
                    answerQuantity: nil,
                    answerKey: "representative"
                ),
            DataModel
                .QuestionDecoded(
                    category: "government",
                    type: "systems",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: ["All people of the state"],
                    wrongAnswers: [
                        "Mike Pence",
                        "Only state lawmakers",
                        "Only people who voted for them",
                        "Only the people in their political party"
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
                    type: "systems",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: [
                        "Because some states have more people",
                        "Because of the state population",
                        "Because they have more people"
                    ],
                    wrongAnswers: [
                        "Give a driver license",
                        "Because they are larger in size",
                        "Leaders must obey the law",
                        "The Federal Court of Appeals"
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
                    type: "systems",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: ["Four (4)"],
                    wrongAnswers: [
                        "Two (2)",
                        "Six (6)",
                        "Delaware",
                        "Eight (8)"
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
                    type: "systems",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: ["November"],
                    wrongAnswers: [
                        "The Judicial and Executive branches",
                        "October",
                        "January",
                        "December"
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
                    type: "systems",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: ["Donald J. Trump"],
                    wrongAnswers: [
                        "Religious freedom",
                        "Socialist economy",
                        "South Carolina",
                        "Zuni"
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: "peopleAnswer"
                        ) ?? .peopleAnswer,
                    answerQuantity: nil,
                    answerKey: "president"
                ),
            DataModel
                .QuestionDecoded(
                    category: "government",
                    type: "systems",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: ["Mike Pence"],
                    wrongAnswers: [
                        "Publicly support or oppose an issue or policy",
                        "At age eighteen (18)",
                        "Secretary of Transportation",
                        "because there are 50 states"
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: "peopleAnswer"
                        ) ?? .peopleAnswer,
                    answerQuantity: nil,
                    answerKey: "vicePresident"
                ),
            DataModel
                .QuestionDecoded(
                    category: "government",
                    type: "systems",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: ["The Vice President"],
                    wrongAnswers: [
                        "You can practice any religion, or not practice a religion.",
                        "The Speaker of the House",
                        "The Secretary of State",
                        "The Chief Justice"
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
                    type: "systems",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: ["The Speaker of the House"],
                    wrongAnswers: [
                        "The Secretary of State",
                        "The Chief Justice",
                        "The President Pro Tempore of the Senate",
                        "Provide protection (police)"
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
                    type: "systems",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: ["The President"],
                    wrongAnswers: [
                        "The Secretary of Defense",
                        "The Vice President",
                        "The Chairman of the Joint Chiefs",
                        "Secretary of the Interior"
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
                    type: "systems",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: ["The President"],
                    wrongAnswers: [
                        "October",
                        "The Speaker of the House",
                        "The Vice President",
                        "The Chief Justice"
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
                    type: "systems",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: ["The President"],
                    wrongAnswers: [
                        "The Speaker of the House",
                        "Navajo",
                        "The Chief Justice",
                        "The Senate Majority Leader"
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
                    type: "systems",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: ["Advises the President"],
                    wrongAnswers: [
                        "Commands the military",
                        "1776",
                        "Writes federal regulations",
                        "Approves laws"
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
                    type: "systems",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: [
                        "Secretary of Commerce",
                        "Secretary of the Interior",
                        "Secretary of Veterans Affairs",
                        "Secretary of Homeland Security",
                        "Secretary of Health and Human Services",
                        "Attorney General",
                        "Secretary of Education",
                        "Secretary of State",
                        "Secretary of Labor",
                        "Secretary of the Treasury",
                        "Vice President",
                        "Secretary of Agriculture",
                        "Secretary of Transportation",
                        "Secretary of Housing and Urban Development",
                        "Secretary of Energy",
                        "Secretary of Defense"
                    ],
                    wrongAnswers: [
                        "Majority Leader",
                        "Speaker of the House",
                        "Blackfeet",
                        "Chief Justice"
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
                    type: "systems",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: [
                        "Reviews laws",
                        "Explains laws",
                        "Resolves disputes (disagreements)",
                        "Decides if a law goes against the Constitution"
                    ],
                    wrongAnswers: [
                        "Appoints federal judges",
                        "June 14",
                        "Enforces laws",
                        "Press"
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
                    type: "systems",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: ["The Supreme Court"],
                    wrongAnswers: [
                        "Only state lawmakers",
                        "The District Court",
                        "The Constitutional Court",
                        "The Federal Court of Appeals"
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
                    type: "systems",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: ["Nine (9)"],
                    wrongAnswers: [
                        "Twelve (12)",
                        "Seven (7)",
                        "Ten (10)",
                        "You must choose a religion by age 18."
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
                    type: "systems",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: ["John Roberts"],
                    wrongAnswers: [
                        "Vietnam War",
                        "California",
                        "Defend the Constitution and laws of the United States",
                        "Planned economy"
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: "peopleAnswer"
                        ) ?? .peopleAnswer,
                    answerQuantity: nil,
                    answerKey: "chiefJustice"
                ),
            DataModel
                .QuestionDecoded(
                    category: "government",
                    type: "systems",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: [
                        "To make treaties",
                        "To create an army",
                        "To print money",
                        "To declare war"
                    ],
                    wrongAnswers: [
                        "To issue driver licenses",
                        "To set up schools",
                        "Korean War",
                        "Sioux"
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
                    type: "systems",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: [
                        "Provide schooling and education",
                        "Give a driver license",
                        "Approve zoning and land use",
                        "Provide safety (fire departments)",
                        "Provide protection (police)"
                    ],
                    wrongAnswers: [
                        "Freedom",
                        "Delaware",
                        "The Bill of Rights was debated",
                        "Print money"
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
                    type: "systems",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: ["Answers will vary"],
                    wrongAnswers: [
                        "Oneida",
                        "Only if joining the military",
                        "John Roberts",
                        "No one is above the law"
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: "stateAnswer"
                        ) ?? .stateAnswer,
                    answerQuantity: nil,
                    answerKey: "governor"
                ),
            DataModel
                .QuestionDecoded(
                    category: "government",
                    type: "systems",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: ["Answers will vary"],
                    wrongAnswers: [
                        "Philadelphia",
                        "South Carolina",
                        "Massachusetts",
                        "Market economy"
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
                    type: "systems",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: ["Democratic and Republican"],
                    wrongAnswers: [
                        "Serve in the U.S. military (if needed)",
                        "Green and Libertarian",
                        "Federalist and Whig",
                        "Labor and Conservative"
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
                    type: "systems",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: ["Republican"],
                    wrongAnswers: [
                        "Independent",
                        "Secretary of Homeland Security",
                        "Libertarian",
                        "Democratic"
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
                    type: "systems",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: ["Nancy Pelosi"],
                    wrongAnswers: [
                        "Nine (9)",
                        "Attorney General",
                        "Federalist and Whig",
                        "Obey the laws of the United States"
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: "peopleAnswer"
                        ) ?? .peopleAnswer,
                    answerQuantity: nil,
                    answerKey: "speaker"
                ),
            DataModel
                .QuestionDecoded(
                    category: "government",
                    type: "rights",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: [
                        "Citizens eighteen (18) and older can vote",
                        "A male citizen of any race (can vote).",
                        "You dont have to pay (a poll tax) to vote",
                        "Any citizen can vote. (Women and men can vote)"
                    ],
                    wrongAnswers: [
                        "Only property owners can vote",
                        "Only taxpayers can vote",
                        "Trial by jury",
                        "Valentine Day"
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
                    type: "rights",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: [
                        "Vote in a federal election",
                        "Serve on a jury"
                    ],
                    wrongAnswers: [
                        "Give an elected official your opinion on an issue",
                        "Pay taxes",
                        "A court ruling",
                        "Obey the law"
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
                    type: "rights",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: [
                        "Run for federal office",
                        "Vote in a federal election"
                    ],
                    wrongAnswers: [
                        "The Congress",
                        "Freedom of religion",
                        "Freedom of speech",
                        "Declared our independence (from Great Britain)"
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
                    type: "rights",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: [
                        "freedom of religion",
                        "freedom of expression",
                        "the right to bear arms",
                        "freedom of assembly",
                        "freedom to petition the government",
                        "freedom of speech"
                    ],
                    wrongAnswers: [
                        "because there is one star for each state",
                        "free college education",
                        "Because they have more people",
                        "New York"
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
                    type: "rights",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: [
                        "The flag",
                        "The United States"
                    ],
                    wrongAnswers: [
                        "The military",
                        "The Constitution",
                        "Valentine Day",
                        "Secretary of Agriculture"
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
                    type: "rights",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: [
                        "Be loyal to the United States",
                        "Give up loyalty to other countries",
                        "Serve (do important work for) the nation (if needed)",
                        "Obey the laws of the United States",
                        "Defend the Constitution and laws of the United States",
                        "Serve in the U.S. military (if needed)"
                    ],
                    wrongAnswers: [
                        "Only taxpayers can vote",
                        "Pay no taxes",
                        "Only state lawmakers",
                        "Twenty-seven (27)"
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
                    type: "rights",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: ["Eighteen (18) and older"],
                    wrongAnswers: [
                        "Sixteen (16) and older",
                        "Any age with parental consent",
                        "freedom of expression",
                        "Twenty-one (21) and older"
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
                    type: "rights",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: [
                        "Write to a newspaper",
                        "Run for office",
                        "Join a community group",
                        "Join a civic group",
                        "Publicly support or oppose an issue or policy",
                        "Call Senators and Representatives",
                        "Give an elected official your opinion on an issue",
                        "Help with a campaign",
                        "Vote",
                        "Join a political party"
                    ],
                    wrongAnswers: [
                        "Pay extra taxes",
                        "Martin Luther King, Jr. Day",
                        "Join the military to vote",
                        "Atlantic Ocean"
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
                    type: "rights",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: ["April 15"],
                    wrongAnswers: [
                        "December 31",
                        "War of 1812",
                        "May 1",
                        "March 1"
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
                    type: "rights",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: [
                        "Between eighteen (18) and twenty-six (26)",
                        "At age eighteen (18)"
                    ],
                    wrongAnswers: [
                        "The Secretary of Defense",
                        "Only if joining the military",
                        "Choctaw",
                        "Before turning 16"
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
                    type: "history-colonial",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: [
                        "Economic opportunity",
                        "Practice their religion",
                        "Escape persecution",
                        "Religious freedom",
                        "Freedom",
                        "Political liberty"
                    ],
                    wrongAnswers: [
                        "Secretary of the Interior",
                        "To conquer the British",
                        "To avoid paying taxes",
                        "Maryland"
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
                    type: "history-colonial",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: ["Native Americans"],
                    wrongAnswers: [
                        "Declared our independence (from Great Britain)",
                        "Africans",
                        "Pilgrims",
                        "British settlers"
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
                    type: "history-colonial",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: [
                        "Africans",
                        "People from Africa"
                    ],
                    wrongAnswers: [
                        "Montana",
                        "Native Americans",
                        "Europeans",
                        "Presidents Day"
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
                    type: "history-colonial",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: [
                        "Because they didnt have self-government",
                        "Because the British army stayed in their houses (boarding, quartering)",
                        "Because of high taxes (taxation without representation)"
                    ],
                    wrongAnswers: [
                        "Huron",
                        "Because they disliked tea",
                        "New York City",
                        "Signer of the Emancipation Proclamation"
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
                    type: "history-colonial",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: ["Thomas Jefferson"],
                    wrongAnswers: [
                        "John Adams",
                        "Chief Justice",
                        "Benjamin Franklin",
                        "George Washington"
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
                    type: "history-colonial",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: ["July 4, 1776"],
                    wrongAnswers: [
                        "June 4, 1776",
                        "September 17, 1787",
                        "July 2, 1776",
                        "A removal of a law"
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
                    type: "history-colonial",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: [
                        "North Carolina",
                        "Pennsylvania",
                        "Maryland",
                        "New Jersey",
                        "Georgia",
                        "Delaware",
                        "Massachusetts",
                        "South Carolina",
                        "Connecticut",
                        "Virginia",
                        "New Hampshire",
                        "Rhode Island",
                        "New York"
                    ],
                    wrongAnswers: [
                        "To print money",
                        "Ohio",
                        "Vermont",
                        "Obey the law"
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
                    type: "history-colonial",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: [
                        "The Constitution was written",
                        "The Founding Fathers wrote the Constitution"
                    ],
                    wrongAnswers: [
                        "War of 1812",
                        "The Bill of Rights was debated",
                        "January",
                        "The Declaration of Independence was signed"
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
                    type: "history-colonial",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: ["1787"],
                    wrongAnswers: [
                        "1801",
                        "1776",
                        "Pennsylvania",
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
                    type: "history-colonial",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: [
                        "Publius",
                        "John Jay",
                        "James Madison",
                        "Alexander Hamilton"
                    ],
                    wrongAnswers: [
                        "Only state lawmakers",
                        "World War II",
                        "Apache",
                        "George Washington"
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
                    type: "history-colonial",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: [
                        "U.S. diplomat",
                        "Oldest member of the Constitutional Convention",
                        "First Postmaster General of the United States",
                        "Started the first free libraries",
                        "Writer of Poor Richard Almanac"
                    ],
                    wrongAnswers: [
                        "Arctic Ocean",
                        "Immigration",
                        "The Secretary of State",
                        "Signer of the Emancipation Proclamation"
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
                    type: "history-colonial",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: ["George Washington"],
                    wrongAnswers: [
                        "Vote",
                        "Donald J. Trump",
                        "May 1",
                        "Japan, Korea, and Vietnam"
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: "peopleAnswer"
                        ) ?? .peopleAnswer,
                    answerQuantity: nil,
                    answerKey: "washington"
                ),
            DataModel
                .QuestionDecoded(
                    category: "history-geo",
                    type: "history-colonial",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: ["George Washington"],
                    wrongAnswers: [
                        "Fought for civil rights",
                        "To conquer the British",
                        "The United States",
                        "The District Court"
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: "peopleAnswer"
                        ) ?? .peopleAnswer,
                    answerQuantity: nil,
                    answerKey: "washington"
                ),
            DataModel
                .QuestionDecoded(
                    category: "history-geo",
                    type: "history-1800",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: [
                        "Louisiana",
                        "The Louisiana Territory"
                    ],
                    wrongAnswers: [
                        "Independence Day",
                        "Texas",
                        "Florida",
                        "Freed the slaves (Emancipation Proclamation)"
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
                    type: "history-1800",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: [
                        "Civil War",
                        "Mexican-American War",
                        "War of 1812",
                        "Spanish-American War"
                    ],
                    wrongAnswers: [
                        "Japan, Korea, and Vietnam",
                        "Independence Day",
                        "World War I",
                        "Nuclear power plants"
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
                    type: "history-1800",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: ["The Civil War"],
                    wrongAnswers: [
                        "The Revolutionary War",
                        "The Vietnam War",
                        "The Korean War",
                        "Twenty-one (21)"
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
                    type: "history-1800",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: [
                        "economic reasons",
                        "slavery",
                        "states rights"
                    ],
                    wrongAnswers: [
                        "Write to a newspaper",
                        "taxation without representation",
                        "A removal of a law",
                        "Nuclear power plants"
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
                    type: "history-1800",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: [
                        "Led the United States during the Civil War",
                        "Saved (or preserved) the Union",
                        "Freed the slaves (Emancipation Proclamation)"
                    ],
                    wrongAnswers: [
                        "Pay extra taxes",
                        "slavery",
                        "Oldest member of the Constitutional Convention",
                        "Declared war on Britain"
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
                    type: "history-1800",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: ["Freed slaves in the Confederate states"],
                    wrongAnswers: [
                        "Gave women the right to vote",
                        "Ended the Civil War",
                        "Established the U.S. Constitution",
                        "Leaders must obey the law"
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
                    type: "history-1800",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: [
                        "fought for civil rights",
                        "fought for women rights"
                    ],
                    wrongAnswers: [
                        "wrote the Constitution",
                        "led the Civil War",
                        "Because of the state population",
                        "Maryland"
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
                    type: "history-modern",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: [
                        "(Persian) Gulf War",
                        "Vietnam War",
                        "World War I",
                        "World War II",
                        "Korean War"
                    ],
                    wrongAnswers: [
                        "The Chief Justice",
                        "Revolutionary War",
                        "September 17",
                        "Because they didnt have self-government"
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
                    type: "history-modern",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: ["Woodrow Wilson"],
                    wrongAnswers: [
                        "Mohegan",
                        "Congress",
                        "Vermont",
                        "Answers will vary"
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: "peopleAnswer"
                        ) ?? .peopleAnswer,
                    answerQuantity: nil,
                    answerKey: "wilson"
                ),
            DataModel
                .QuestionDecoded(
                    category: "history-geo",
                    type: "history-modern",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: ["Franklin Roosevelt"],
                    wrongAnswers: [
                        "Only if joining the military",
                        "Thanksgiving",
                        "Leaders must obey the law",
                        "Approve zoning and land use"
                    ],
                    answerType: DataModel.QuestionDecoded
                        .AnswerType(
                            rawValue: "peopleAnswer"
                        ) ?? .peopleAnswer,
                    answerQuantity: nil,
                    answerKey: "roosevelt"
                ),
            DataModel
                .QuestionDecoded(
                    category: "history-geo",
                    type: "history-modern",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: ["Japan, Germany, and Italy"],
                    wrongAnswers: [
                        "Russia, China, and Germany",
                        "France, Germany, and Britain",
                        "Japan, Korea, and Vietnam",
                        "California"
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
                    type: "history-modern",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: ["World War II"],
                    wrongAnswers: [
                        "Japan, Korea, and Vietnam",
                        "Vietnam War",
                        "World War I",
                        "Korean War"
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
                    type: "history-modern",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: ["Communism"],
                    wrongAnswers: [
                        "Gave women the right to vote",
                        "Terrorism",
                        "Immigration",
                        "Nuclear power plants"
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
                    type: "history-modern",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: ["Civil rights (movement)"],
                    wrongAnswers: [
                        "Only people who voted for them",
                        "Green movement",
                        "Labor movement",
                        "Women suffrage"
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
                    type: "history-modern",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: [
                        "Fought for civil rights",
                        "Worked for equality for all Americans"
                    ],
                    wrongAnswers: [
                        "Wrote the Declaration of Independence",
                        "Was a U.S. President",
                        "Freedom from taxation",
                        "two (2)"
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
                    type: "history-modern",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: ["Terrorists attacked the United States."],
                    wrongAnswers: [
                        "The Civil Rights Act was passed.",
                        "The U.S. declared war on Iraq.",
                        "led the Civil War",
                        "The stock market crashed."
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
                    type: "history-modern",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: [
                        "Choctaw",
                        "Apache",
                        "Seminole",
                        "Pueblo",
                        "Sioux",
                        "Inuit",
                        "Navajo",
                        "Teton",
                        "Oneida",
                        "Creek",
                        "Arawak",
                        "Lakota",
                        "Shawnee",
                        "Blackfeet",
                        "Cheyenne",
                        "Huron",
                        "Crow",
                        "Cherokee",
                        "Hopi",
                        "Mohegan",
                        "Chippewa",
                        "Iroquois"
                    ],
                    wrongAnswers: [
                        "Executive",
                        "Established the U.S. Constitution",
                        "led the Civil War",
                        "Zuni"
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
                    type: "geography",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: [
                        "Mississippi River",
                        "Missouri River"
                    ],
                    wrongAnswers: [
                        "Mohegan",
                        "Two hundred (200)",
                        "Rio Grande",
                        "Colorado River"
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
                    type: "geography",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: ["Pacific Ocean"],
                    wrongAnswers: [
                        "Arctic Ocean",
                        "Atlantic Ocean",
                        "Labor Day",
                        "Indian Ocean"
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
                    type: "geography",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: ["Atlantic Ocean"],
                    wrongAnswers: [
                        "Southern Ocean",
                        "Pacific Ocean",
                        "Alaska",
                        "Indian Ocean"
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
                    type: "geography",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: [
                        "U.S. Virgin Islands",
                        "Northern Mariana Islands",
                        "Guam",
                        "American Samoa",
                        "Puerto Rico"
                    ],
                    wrongAnswers: [
                        "Because they didnt have self-government",
                        "eight (8)",
                        "Serve (do important work for) the nation (if needed)",
                        "Hawaii"
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
                    type: "geography",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: [
                        "Pennsylvania",
                        "North Dakota",
                        "Idaho",
                        "Minnesota",
                        "Montana",
                        "Ohio",
                        "Maine",
                        "Alaska",
                        "Michigan",
                        "Vermont",
                        "New Hampshire",
                        "Washington",
                        "New York"
                    ],
                    wrongAnswers: [
                        "Independent",
                        "Ended the Civil War",
                        "Texas",
                        "California"
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
                    type: "geography",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: [
                        "New Mexico",
                        "Texas",
                        "Arizona",
                        "California"
                    ],
                    wrongAnswers: [
                        "Nevada",
                        "To declare war",
                        "Utah",
                        "Secretary of the Treasury"
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
                    type: "geography",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: ["Washington, D.C."],
                    wrongAnswers: [
                        "Philadelphia",
                        "New York City",
                        "four (4)",
                        "Los Angeles"
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
                    type: "geography",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: [
                        "Liberty Island",
                        "New York (Harbor)"
                    ],
                    wrongAnswers: [
                        "Ellis Island",
                        "Benjamin Franklin",
                        "Immigration",
                        "Washington, D.C."
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
                    type: "symbols",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: [
                        "because there were 13 original colonies",
                        "because the stripes represent the original colonies"
                    ],
                    wrongAnswers: [
                        "because of 13 founding fathers",
                        "because there were 13 amendments",
                        "Choctaw",
                        "Vermont"
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
                    type: "symbols",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: [
                        "because each star represents a state",
                        "because there are 50 states",
                        "because there is one star for each state"
                    ],
                    wrongAnswers: [
                        "Connecticut",
                        "because of the 50 founding fathers",
                        "Give up loyalty to other countries",
                        "Pay taxes"
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
                    type: "symbols",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: ["The Star-Spangled Banner"],
                    wrongAnswers: [
                        "My Country, 'Tis of Thee",
                        "God Bless America",
                        "America the Beautiful",
                        "The United States"
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
                    type: "symbols",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: ["July 4"],
                    wrongAnswers: [
                        "Philadelphia",
                        "June 14",
                        "September 17",
                        "July 1"
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
                    type: "symbols",
                    question: String(
                        localized: "Question_"
                    ),
                    correctAnswers: [
                        "Christmas",
                        "Veterans Day",
                        "Columbus Day",
                        "Independence Day",
                        "Thanksgiving",
                        "Presidents Day",
                        "Labor Day",
                        "New Year Day",
                        "Martin Luther King, Jr. Day",
                        "Memorial Day"
                    ],
                    wrongAnswers: [
                        "Cherokee",
                        "Easter",
                        "September 17",
                        "Valentine Day"
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
}
