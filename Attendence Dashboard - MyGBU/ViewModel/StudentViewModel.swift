import Foundation
import SwiftUI

class StudentViewModel: ObservableObject {
    @Published var student: Student = Student(id: "245UCS229", name: "Vaibhav", course: "B.Tech", branch: "CSE")
    @Published var attendanceRecords: [AttendanceRecord] = []
    @Published var subjects: [Subject] = [
        Subject(id: "CS101", name: "Mathematics"),
        Subject(id: "CS102", name: "Physics")
    ]

    init() {
        fetchAttendance()
    }

    func fetchAttendance() {
        // Placeholder for backend integration
        // TODO: Replace with Firestore fetch later
        attendanceRecords = [
            AttendanceRecord(studentId: student.id, subjectId: "CS101", date: "2025-07-01", isPresent: true),
            AttendanceRecord(studentId: student.id, subjectId: "CS101", date: "2025-07-02", isPresent: false),
            AttendanceRecord(studentId: student.id, subjectId: "CS102", date: "2025-07-01", isPresent: true)
        ]
    }

    func getAttendanceStats(for subjectId: String) -> (attended: Int, total: Int, percentage: Double) {
        let records = attendanceRecords.filter { $0.subjectId == subjectId }
        let total = records.count
        let attended = records.filter { $0.isPresent }.count
        let percentage = total == 0 ? 0.0 : (Double(attended) / Double(total)) * 100.0
        return (attended, total, percentage)
    }
}