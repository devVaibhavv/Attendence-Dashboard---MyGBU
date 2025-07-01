//
//  FacultyViewModel.swift
//  Attendence Dashboard - MyGBU
//
//  Created by Vaibhav Singh on 01/07/25.
//


import Foundation
import SwiftUI

class FacultyViewModel: ObservableObject {
    @Published var faculty: Faculty = Faculty(id: "23477897", name: "Vatsalya", qualification: "PhD AI")
    @Published var selectedSubject: Subject? = nil
    @Published var students: [Student] = [
        Student(id: "245UCS229", name: "Vaibhav", course: "B.Tech", branch: "CSE"),
        Student(id: "245UCS230", name: "Riya", course: "B.Tech", branch: "CSE"),
        Student(id: "245UCS231", name: "Amit", course: "B.Tech", branch: "CSE")
    ]
    @Published var attendanceMarks: [String: Bool] = [:] // studentId : isPresent
    @Published var attendanceDate: Date = Date()

    func toggleAttendance(for studentId: String) {
        attendanceMarks[studentId] = !(attendanceMarks[studentId] ?? false)
    }

    func markAllPresent() {
        for student in students {
            attendanceMarks[student.id] = true
        }
    }

    func submitAttendance() {
        guard let subjectId = selectedSubject?.id else { return }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateStr = dateFormatter.string(from: attendanceDate)

        var records: [AttendanceRecord] = []
        for student in students {
            let isPresent = attendanceMarks[student.id] ?? false
            records.append(
                AttendanceRecord(studentId: student.id, subjectId: subjectId, date: dateStr, isPresent: isPresent)
            )
        }

        // TODO: Replace with FirebaseService call
        FirebaseService.markAttendance(subjectId: subjectId, date: dateStr, records: records)
    }
}