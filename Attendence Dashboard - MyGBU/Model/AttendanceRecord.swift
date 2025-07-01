import Foundation

struct AttendanceRecord: Identifiable, Codable {
    let id = UUID()
    let studentId: String
    let subjectId: String
    let date: String // e.g., "2025-07-01"
    var isPresent: Bool
}
