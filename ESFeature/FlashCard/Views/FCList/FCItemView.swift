import SwiftUI
import ESDataStructure
import ESLiveData

public struct FCItemView: HashIdentifiable {
    let questionTextChanged: ValueChangedEffect<String>
    let answerTextChanged: ValueChangedEffect<String>
    let resetAction: ActionEffect
    let confirmAction: ActionEffect
    let editAction: ActionEffect
    let isEditing: Bool
    
    let isFlipped: ValueChangedEffect<Bool>
    let deleteAction: ActionEffect
}

extension FCItemView: View {
    public var body: some View {
        ZStack {
            VStack {
                if isEditing {
                    Text("Prepare your card:")
                        .font(.title)
                    
                    textField(title: "Question: ", value: questionTextChanged.binding, placeholder: "Enter question")
                    
                    textField(title: "Answer: ", value: answerTextChanged.binding, placeholder: "Enter answer")
                    
                    HStack(alignment: .center) {
                        Button {
                            resetAction.occurs()
                        } label: {
                            Text("Reset")
                                .foregroundStyle(Color.white)
                                .fontWeight(.bold)
                                .font(.headline)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 30)
                        }
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.red)
                        }
                        
                        Spacer()
                        
                        Button {
                            confirmAction.occurs()
                        } label: {
                            Text("Confirm")
                                .foregroundStyle(Color.white)
                                .fontWeight(.bold)
                                .font(.headline)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 30)
                        }
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.blue)
                        }
                        .padding(.top, 8)
                    }
                } else {
                    HStack {
                        Text("Question")
                            .fontWeight(.bold)
                            .font(.title)
                        Spacer()
                        
                        Button {
                            editAction.occurs()
                        } label: {
                            Image(systemName: "square.and.pencil")
                                .foregroundStyle(esColor: .black)
                        }
                    }
                    
                    Spacer()
                    Text(questionTextChanged.currentValue)
                    Spacer()
                }
            }
            .rotation3DEffect(.radians(isFlipped.currentValue ? .pi : 0), axis: (x: 0, y: 1, z: 0))
            .opacity(isFlipped.currentValue ? 0 : 1)
            
            VStack {
                Text(answerTextChanged.currentValue)
                    .font(.headline)
                    .foregroundStyle(esColor: .ESText.primary.color)
            }
            .rotation3DEffect(.radians(isFlipped.currentValue ? 0 : .pi), axis: (x: 0, y: 1, z: 0))
            .opacity(isFlipped.currentValue ? 1 : 0)
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 16)
        .frame(width: UIScreen.main.bounds.width - 32)
        .frame(height: 300)
        .background {
            RoundedRectangle(cornerSize: .init(width: 20, height: 20))
                .stroke(style: .init(lineWidth: 2))
                .rotation3DEffect(.radians(isFlipped.currentValue ? .pi : 0), axis: (x: 0, y: 1, z: 0))
                .shadow(radius: 8, x: 3, y: 5)
        }
        .onTapGesture {
            withAnimation(.linear(duration: 0.6)) {
                if !isEditing {
                    isFlipped.update(!isFlipped.currentValue)
                }
            }
        }
    }
    
    private func textField(title: String, value: Binding<String>, placeholder: String) -> some View {
        TextField(title, text: value, prompt: Text(placeholder))
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(lineWidth: 1)
            }
    }
}

#if targetEnvironment(simulator)
#Preview(".editting") {
    FCItemView.previewItemView(isEditting: true)
}

#Preview(".not editting") {
    FCItemView.previewItemView(isEditting: false)
}

public extension FCItemView {
    static func previewItemView(isEditting: Bool) -> Self {
        .init(questionTextChanged: .noEffect("question"),
              answerTextChanged: .noEffect("answer"),
              resetAction: .noEffect(),
              confirmAction: .noEffect(),
              editAction: .noEffect(),
              isEditing: isEditting,
              isFlipped: .noEffect(false),
              deleteAction: .noEffect()
        )
    }
}
#endif
