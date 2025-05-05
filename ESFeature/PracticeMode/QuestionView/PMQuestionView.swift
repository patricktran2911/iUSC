import SwiftUI
import ESDataStructure
import ESLiveData

enum PMQuestionView: HashIdentifiable {
    case noQuestion
    case single(
        question: String,
        options: [String],
        selectedIndexOption: ValueChangedEffect<Int?>,
        submitAction: ActionEffect
    )
    case multiple(
        question: String,
        options: [String],
        selectedIndexOption: ValueChangedEffect<[Int]?>,
        submitAction: ActionEffect
    )
    case checkOnline(
        question: String,
        answerInput: String,
        submitAction: ActionEffect
    )
}

extension PMQuestionView: View {
    var body: some View {
        switch self {
        case .noQuestion:
            VStack {
                Spacer()
                Text("No Question Available")
                    .font(.title2)
                    .foregroundColor(.gray)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.systemGroupedBackground))

        case let .single(question, options, selectedIndexOption, submitAction):
            VStack(alignment: .leading) {
                Text(question)
                    .font(.headline)
                    .padding(.bottom, 16)

                ForEach(options, id: \.self) { option in
                    Button(action: {
                        guard let index = options.firstIndex(of: option) else { return }
                        selectedIndexOption.update(index)
                    }) {
                        HStack {
                            Text(option)
                                .font(.body)
                                .foregroundColor(.primary)
                                .padding(.vertical, 12)
                            Spacer()
                            if let index = selectedIndexOption.currentValue,
                               options[index] == option {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                            }
                        }
                        .padding(.horizontal, 16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background {
                            if let index = selectedIndexOption.currentValue,
                               options[index] == option {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.green.opacity(0.2))
                            } else {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.clear)
                            }
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding(.bottom, 8)
                }

                Spacer()

                Button(action: {
                    submitAction.occurs()
                }) {
                    Text("Submit")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, minHeight: 44)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding(.top, 16)
            }
            .padding()

        case let .multiple(question, options, selectedIndexOption, submitAction):
            VStack(alignment: .leading) {
                    Text(question)
                        .font(.headline)
                        .padding(.bottom, 16)

                    ForEach(options, id: \.self) { option in
                        Button(action: {
                            guard let currentSelection = selectedIndexOption.currentValue else {
                                selectedIndexOption.update([options.firstIndex(of: option)!])
                                return
                            }
                            if let index = options.firstIndex(of: option) {
                                if currentSelection.contains(index) {
                                    selectedIndexOption.update(currentSelection.filter { $0 != index })
                                } else {
                                    selectedIndexOption.update(currentSelection + [index])
                                }
                            }
                        }) {
                            HStack {
                                Text(option)
                                    .font(.body)
                                    .foregroundColor(.primary)
                                    .padding(.vertical, 12)

                                Spacer()

                                if let currentSelection = selectedIndexOption.currentValue,
                                   let index = options.firstIndex(of: option),
                                   currentSelection.contains(index) {
                                    Image(systemName: "checkmark.square.fill")
                                        .foregroundColor(.blue)
                                }
                            }
                            .padding(.horizontal, 16)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background {
                                if let currentSelection = selectedIndexOption.currentValue,
                                   let index = options.firstIndex(of: option),
                                   currentSelection.contains(index) {
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color.blue.opacity(0.2))
                                } else {
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color.clear)
                                }
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.bottom, 8)
                    }

                    Spacer()

                    Button(action: {
                        submitAction.occurs()
                    }) {
                        Text("Submit")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 44)
                            .background(Color.green)
                            .cornerRadius(8)
                    }
                    .padding(.top, 16)
                }
                .padding()

        case let .checkOnline(question, answerInput, submitAction):
            VStack(alignment: .leading) {
                Text(question)
                    .font(.headline)
                    .padding(.bottom, 16)

                TextField("Enter your answer", text: .constant(answerInput))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 16)

                Spacer()

                Button(action: {
                    submitAction.occurs()
                }) {
                    Text("Submit")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, minHeight: 44)
                        .background(Color.orange)
                        .cornerRadius(8)
                }
                .padding(.top, 16)
            }
            .padding()
        }
    }
}

#if targetEnvironment(simulator)
#Preview {
    PMQuestionView.preview()
}

extension PMQuestionView {
    static func preview() -> Self {
        .multiple(
            question: "What does the Constitution do?",
            options: [
                "Sets up the government",
                "Defines the government",
                "Protects basic rights of Americans",
                "Establishes laws"
            ],
            selectedIndexOption: .noEffect([]),
            submitAction: .noEffect()
        )
    }
}
#endif
