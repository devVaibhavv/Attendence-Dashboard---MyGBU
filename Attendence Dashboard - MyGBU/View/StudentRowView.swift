import SwiftUI

struct StudentRowView: View {
    let student: Student
    var isPresent: Bool
    var toggleAction: () -> Void

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(student.name)
                    .font(.headline)
                Text("Roll No: \(student.id)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            Button(action: toggleAction) {
                Text(isPresent ? "Present" : "Absent")
                    .foregroundColor(.white)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(isPresent ? Color.green : Color.red)
                    .cornerRadius(10)
            }
        }
        .padding(.vertical, 4)
    }
}