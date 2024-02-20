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

// pseudocode
/*
 Type location name and rate on the TextField.
 Tap a complete button
 Look at the TextField.
 If TextField is empty
    Field color change to red
 Else
    Navigate to ListView
 
 
 */
import SwiftUI

struct ContentView: View {
    @State var locationName: String = ""
    @State var rate: String = "" // rate arrangement is 0 to 5
    @State private var star = 0
    @State private var isEditing = false
    
    var body: some View {
        // NavigationStack 사용해보기
        NavigationStack {
            TextField(
                "locationName",
                text: $locationName
            )
            
           // rate를 표시할 수 있는 TextField 추가함.
            TextField(
                "0 to 5",
                text: $rate
            )
            
            NavigationLink(destination: ListView()) {
                Text("complete")
            }
            // TextField의 조건을 만족하지 않았을 때 실행될 함수 넣는 곳
            
        }
    }
}
    
struct ListView: View {
    var body: some View {
            Text("This is ListView")
        
        NavigationStack {
            // ForEach 이용해서 List 표현하는 방식으로 바꿨음.
            ForEach(0..<10) { num in
                List() {
                    NavigationLink(destination: DetailView()) {
                        Text("location_\(num)")
                    }
                }
                
            }
        }
    }
}

// DetailView 어떻게 구성할 지 생각해야 함.
struct DetailView: View {
    var body: some View {
        Text("This is DetailView")
        Text("locationName")
        Text("locationRate")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
