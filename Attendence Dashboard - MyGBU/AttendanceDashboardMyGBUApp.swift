//
//  AttendanceDashboardMyGBUApp 2.swift
//  Attendence Dashboard - MyGBU
//
//  Created by Vaibhav Singh on 01/07/25.
//


@main
struct AttendanceDashboardMyGBUApp: App {
    @StateObject private var appState = AppState()

    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            contentView()
                .environmentObject(appState)
        }
    }

    // This view handles routing based on login state
    @ViewBuilder
    private func contentView() -> some View {
        if let role = appState.userRole {
            switch role {
            case .student(let student):
                StudentDashboardView(student: student)
            case .faculty(let faculty):
                FacultyAttendanceView(faculty: faculty)
            }
        } else {
            LoginView()
        }
    }
}
