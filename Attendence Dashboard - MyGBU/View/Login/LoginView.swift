import SwiftUI

struct LoginView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        VStack(spacing: 40) {
            Text("Attendance System")
                .font(.largeTitle)
                .bold()

            Button(action: {
                // Fake student login
                let student = Student(id: "245UCS229", name: "Vaibhav", course: "B.Tech", branch: "CSE")
                appState.userRole = .student(student)
            }) {
                Text("Login as Student")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            Button(action: {
                // Fake faculty login
                let faculty = Faculty(id: "23477897", name: "Vatsalya", qualification: "PhD AI")
                appState.userRole = .faculty(faculty)
            }) {
                Text("Login as Faculty")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}
