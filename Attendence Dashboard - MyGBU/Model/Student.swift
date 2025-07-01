//
//  Student.swift
//  Attendence Dashboard - MyGBU
//
//  Created by Vaibhav Singh on 01/07/25.
//


import Foundation

struct Student: Identifiable, Codable {
    let id: String // roll number
    let name: String
    let course: String
    let branch: String
}
