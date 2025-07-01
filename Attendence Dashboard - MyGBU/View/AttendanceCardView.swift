import SwiftUI

struct AttendanceCardView: View {
    let subjectName: String
    let attended: Int
    let total: Int
    let percentage: Double

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(subjectName)
                    .font(.headline)
                Spacer()
                Text(String(format: "%.1f%%", percentage))
                    .foregroundColor(percentage >= 75 ? .green : (percentage >= 60 ? .orange : .red))
            }
            ProgressView(value: percentage / 100)
                .progressViewStyle(LinearProgressViewStyle(tint: percentage >= 75 ? .green : .red))
            Text("\(attended) / \(total) classes attended")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
        .padding(.vertical, 4)
    }
}
