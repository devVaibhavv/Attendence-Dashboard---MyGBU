import SwiftUI

struct FacultyAttendanceView: View {
    @StateObject private var viewModel = FacultyViewModel()

    var body: some View {
        NavigationView {
            VStack {
                Picker("Select Subject", selection: $viewModel.selectedSubject) {
                    Text("Select a Subject").tag(Subject?.none)
                    ForEach(viewModel.students.prefix(1).flatMap { _ in // simulate subjects
                        [Subject(id: "CS101", name: "Mathematics"),
                         Subject(id: "CS102", name: "Physics")]
                    }) { subject in
                        Text(subject.name).tag(Optional(subject))
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding()

                if let _ = viewModel.selectedSubject {
                    List(viewModel.students) { student in
                        StudentRowView(student: student, isPresent: viewModel.attendanceMarks[student.id] ?? false) {
                            viewModel.toggleAttendance(for: student.id)
                        }
                    }

                    Button(action: {
                        viewModel.submitAttendance()
                    }) {
                        Text("Submit Attendance")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                            .padding()
                    }
                } else {
                    Spacer()
                    Text("Please select a subject to begin marking attendance.")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding()
                    Spacer()
                }
            }
            .navigationTitle("Mark Attendance")
        }
    }
}
