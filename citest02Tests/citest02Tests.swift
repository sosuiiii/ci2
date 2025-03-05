//
//  citest02Tests.swift
//  citest02Tests
//
//  Created by 田中 颯志 on 2/26/25.
//

import Testing
import XCTest
import SwiftUI
import SnapshotTesting
@testable import citest02

struct citest02Tests {

    @MainActor
    @Test func example() async throws {
        assertSnapshot(
            of: Text("テストa").referenceFrame(),
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
            record: false,  // CI環境で既存のスナップショットと比較する場合はfalse
            file: SnapshotFilePath.path
        )
    }
    @MainActor
    @Test func example2() async throws {
        assertSnapshot(
            of: Text("テスト").referenceFrame(),
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
            record: false,  // CI環境で既存のスナップショットと比較する場合はfalse
            file: SnapshotFilePath.path
        )
    }
}
extension SwiftUI.View {
    fileprivate func referenceFrame() -> some View {
        self.frame(width: 375, height: 667)
    }
}
