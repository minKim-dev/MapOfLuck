//
//  ContentView.swift
//  MapOfLuck
//
//  Created by 김민성 on 2024/02/06.
//
// 앱의 컨셉
/*
화면에 내가 가는 장소를 텍스트로 입력하고 완료 버튼을 누르면, 리스트 형식으로 추가가 되는 형태로 말이다.
이 리스트는 아이콘을 탭하면 전환 할 수 있게한다.
완료 버튼을 누르면 추가되었습니다. 라는 알림이 뜨고 리스트 아이콘을 탭하면 내가 만든 리스트를 볼 수 있게!
 */
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
