import SwiftUI

struct StudentDashboardView: View {
    @StateObject private var viewModel = StudentViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.subjects) { subject in
                let stats = viewModel.getAttendanceStats(for: subject.id)
                AttendanceCardView(subjectName: subject.name, attended: stats.attended, total: stats.total, percentage: stats.percentage)
            }
            .navigationTitle("My Attendance")
        }
    }
}