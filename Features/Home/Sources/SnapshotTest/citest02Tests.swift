//
//  citest02Tests.swift
//  citest02Tests
//
//  Created by 田中 颯志 on 2/26/25.
//

import Testing
import SwiftUI
import SnapshotTesting
@testable import citest02

struct citest02Tests {

    @MainActor
    @Test func example() async throws {
        setenv(SnapshotFailurePath.environmentKey, SnapshotFailurePath.path(file: #file), 1)
        withSnapshotTesting(diffTool: .ksdiff) {
            assertSnapshot(
                of: Text("テスト\nテスト\nテスト").referenceFrame(),
                as: .wait(
                    for: 0,  // スクショまでの時間
                    on: .image(
                        precision: 0.9999,  // 一致率
                        layout: .fixed(
                            width: 375,
                            height: 667
                        )
                    )
                ),
                record: false  // 既存のスナップショットと比較する場合はfalse
            )
        }
    }
}
extension SwiftUI.View {
    func referenceFrame() -> some View {
        self.frame(width: 375, height: 667)
    }
}
//$(SOURCE_ROOT)/Snapshots/__Snapshots__/Failure
enum SnapshotFailurePath {
    // schemeのenvironmentVariablesに設定してもテスト実行時に反映されないため、ここで設定する
    static let environmentKey = "SNAPSHOT_ARTIFACTS"
    static func path(file: String = #file) -> String {
        let fileURL = URL(fileURLWithPath: file)
        let pathComponents = fileURL.pathComponents
        // "Features" が存在し、その直下に子ディレクトリがあることを確認
        guard let targetIndex = pathComponents.lastIndex(of: "Features"),
            targetIndex < pathComponents.count - 1
        else {
            return ""
        }
        let baseComponents = Array(pathComponents[0...targetIndex - 1])
        let basePath = NSString.path(withComponents: baseComponents)
        let baseURL = URL(fileURLWithPath: basePath)
        let snapshotURL = baseURL
//            .appendingPathComponent("Sources")
//            .appendingPathComponent("Snapshots")
            .appendingPathComponent("FailureSnapshots")
        print("🥕snapshotURL:\(snapshotURL)")
        return snapshotURL.path
    }
}
