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
    struct MapItem: Identifiable {
        var id = UUID()
        var name: String
        var rate: Double
    }
    
    @State var MapListData: [MapItem] = [
        MapItem(name: "Example1", rate: 3.0),
        MapItem(name: "Example2", rate: 5.0)
    ]
    
    // 변수 이름 수정 및 필요없는 변수 삭제
    @State private var newLocationName: String = ""
    @State private var newLocationRate: Double = 0.0 // rate arrangement is 0 to 5
    @State private var color: Color  = .black
    
    
    
    var body: some View {
        
        // NavigationStack 사용해보기
        NavigationStack {
            
            Text("MAP of Luck")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 100)
            
            VStack {
                TextField(
                    "locationName",
                    text: $newLocationName
                )
                .foregroundColor(color)
                .padding()
                
                // rate를 표시할 수 있는 TextField 추가함 -> Slider로 변경(2024.02.22)
                Text("Slider Value: \(Int(newLocationRate))")
                
                Slider(value: $newLocationRate, in: 0...5, step: 1)
                    .padding()
                    .accentColor(.blue)
                
                Button("Save") {
                    addLocation()
                }
                .padding()
                
                NavigationLink(destination: ListView(MapListData: $MapListData)) {
                    Text("Add location")
                }
                
                // the place for errorDetect() func
                // 텍스트 필드 색깔을 받아서 변경하는 것으로
            }
            .padding(.bottom, 100)
        }
    }
    
    private func addLocation() {
        let newLocation = MapItem(name: newLocationName, rate: newLocationRate)
        MapListData.append(newLocation)
        
        // modal that alarms user saving the location is complete
        
        // clear TextField
        newLocationName = ""
        newLocationRate = 0.0
    }
    
    /*
    // Error handling
    private func errorDetect() {
        // first case: locationName and rate are empty.
        // Second case: the type typed at rate TextField is wrong; not number type because String is stored on rate TextField.
        
        // if statement -> return value according to error case number.
        if locationName == "\0" && rate == "\0" {
            errorNumber = 1
        }
        // switch statement -> error handling based on return value.
        
    }
     */
}
    
struct ListView: View {
    @Binding var MapListData: [ContentView.MapItem]
    
    var body: some View {
            Text("This is ListView")
        
        NavigationStack {
            // ForEach 이용해서 List 표현하는 방식으로 바꿨음. -> 이러면 뷰가 2개 생겨서 상단과 하단에 똑같은 뷰가 생겨버림.
            // ForEach를 없애고 배열을 사용해서 리스트를 구현함.
            List(MapListData) { item in
                NavigationLink(destination: DetailView()) {
                    Text("\(item.name)")
                    Text("rate: \(Int(item.rate))") // 이모지로 변경 예정
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
