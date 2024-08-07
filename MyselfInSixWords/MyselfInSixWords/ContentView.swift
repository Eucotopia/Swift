import SwiftUI

struct ContentView: View {
    let array: [String: Color] = [
        "Monday": .yellow,
        "Tuesday": .blue,
        "Wednesday": .orange,
        "Thursday": .red,
        "Friday": .green,
        "Saturday": .purple,
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(Array(array.keys.sorted().chunked(into: 2)), id: \.self) { pair in
                HStack(spacing: 20) {
                    ForEach(pair, id: \.self) { key in
                        if let color = array[key] {
                            ExtractedView(name: key, color: color)
                        }
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

struct ExtractedView: View {
    var name: String
    var color: Color
    var body: some View {
        HStack {
            Text(name)
                .font(.title3)
                .padding()
                .frame(width: 150)
                .background(color, in: RoundedRectangle(cornerRadius: 8))
        }
    }
}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        // stride 进行分段
        stride(from: 0, to: count, by: size).map {
            // 说白了，就是取 size 个数的分段
            Array(self[$0..<Swift.min($0 + size, count)])
        }
    }
}
