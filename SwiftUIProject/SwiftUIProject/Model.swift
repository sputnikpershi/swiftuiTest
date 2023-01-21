//
//  Model.swift
//  SwiftUIProject
//
//  Created by Kiryl Rakk on 21/1/23.
//

import SwiftUI

struct Movies: Identifiable {
    var id =  UUID()
    var name: String
    var image: String
}

struct MoviewRow: View {
    var movie : Movies
    var body: some View {
        HStack{
            Text("\(movie.name)")
                .foregroundColor(Color.black)
                .font(.system(size: 18))
                .fontWeight(.bold)

            Spacer()
            Image("\(movie.image)")
                .resizable()
                .frame(width: 75, height: 100)
        }}
}

let movies = [Movies(name: "Чербурашка", image: "1"),
              Movies(name: "Мира", image: "2"),
              Movies(name: "На краю", image: "3"),
              Movies(name: "Турбозавры", image: "4"),
              Movies(name: "13 изгнaний дьявола", image: "5"),
              Movies(name: "Гримм", image: "6"),
              Movies(name: "Казнь", image: "7"),
              Movies(name: "Уолл-Стрит", image: "8"),
              Movies(name: "Шиттс Крик", image: "9"),
              Movies(name: "Дом из песка и тумана", image: "10"),
              Movies(name: "Изгой", image: "11"),
              Movies(name: "О чем говорят мужчины", image: "12"),
             ]
