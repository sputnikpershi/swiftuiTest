//
//  ContentView.swift
//  SwiftUIProject
//
//  Created by Kiryl Rakk on 21/1/23.
//

import SwiftUI

struct Universe: Identifiable {
    var id : String {name}
    var name : String
}


struct LessonView: View {
    @State var isToggled = false
    @State var value = 50.0
    @State var universe : Universe?
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Title text")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Form {
                    Text("Создайте новый проект в Xcode. Перепишите в свой проект код, который был на демо в вебинаре по этой теме. Это нужно для того, чтобы вы посмотрели на SwiftUI изнутри и поняли отличия от UIKit.")
                    
                    Toggle(isOn: $isToggled,  label: {
                        Text("Some functions")
                    })
                    
                    Slider(value: $value, in: 0...100) { isSOme in
                        self.isToggled = isSOme
                    }
                    
                    Text("\(Int(value.rounded()))")
                        .foregroundColor(value >= 51 ? .red : .blue)
                    
                    Button(action: {
                        universe = .init(name: "marvel")
                    }, label: {
                        Text("Marvel")
                    })
                    
                    Button {
                        universe = .init(name: "dc")
                    } label: {
                        Text("DC")
                    }
                }
                .alert(item: $universe) { universe  in
                    Alert(title: Text("U choose \(universe.name)"), dismissButton: .default(Text("ok")))
                }
            }
            .navigationTitle("Lesson")
            .foregroundColor(.black)
        }
        
    }
    
}


struct LogInView: View {
    @State var login : String = ""
    @State var pswd : String = ""
    @State private var showingAlert = false
    
    var body: some View {
        
        
        VStack {
            Spacer()
            
            Image("logo")
                .resizable()
                .frame(width: 100, height: 100)
            
            Spacer()
            
            VStack(spacing: 16) {
                TextField("Login", text: $login)
                    .autocorrectionDisabled()
                
                SecureField("Password", text: $pswd)
                    .autocorrectionDisabled()
                
                Button(action: {
                    if login == pswd {
                        showingAlert = true
                    }
                }) {
                    Text("Log in")
                        .padding()
                        .foregroundColor(.blue)
                        .frame(width: 350,height: 50)
                        .background(
                            RoundedRectangle (cornerRadius: 20, style: .continuous)
                                .stroke(.blue, lineWidth: 2)
                        )
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Success"), dismissButton: .default(Text("ok")))
                }
            }
            Spacer()
        }
        .padding(25)
    }
}



struct ListViewMoview: View {
    var body: some View {
        NavigationView {
            
            List(movies) { movie in
                NavigationLink (destination: DetailView(movie: movie) ) {
                    MoviewRow(movie: movie)
                }
            }
            .navigationTitle("Movies")
            .navigationBarTitleDisplayMode(.inline)
        }
       
    }}

struct DetailView: View {
    let movie : Movies
    var body: some View {
        VStack {
            Image(movie.image)
                .resizable()
        
        }
        .navigationTitle(movie.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}



struct ContentView: View {
    var body: some View {
        TabView {
            LessonView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("lesson")
                }
            LogInView()                .tabItem {
                Image(systemName: "rectangle.portrait.and.arrow.right")
                Text("log in")
            }
            ListViewMoview()
                .tabItem {
                    Image(systemName: "play.tv.fill")
                    Text("moview")
                }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
