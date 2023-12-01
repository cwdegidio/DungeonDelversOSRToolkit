//
//  SplashScreen.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/30/23.
//

import SwiftUI

struct SplashScreen: View {
  @Environment(\.verticalSizeClass)
  var vSizeClass: UserInterfaceSizeClass?
  @Environment(\.horizontalSizeClass)
  var hSizeClass: UserInterfaceSizeClass?
  @Binding var isPresented: Bool
  @State private var offset = 0.0
  @State private var opacity = 0.0

  var body: some View {
    let portrait = OrientationHelper.isPortrait(hClass: hSizeClass, vClass: vSizeClass)

    ZStack {
      VStack {
        Spacer()
        ZStack {
          if portrait {
            Image("logoBody")
              .resizable()
              .aspectRatio(contentMode: .fit)
          } else {
            Image("logoBody")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .clipShape(Circle())
          }
          Image("logoFace")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .offset(x: 0.0, y: offset)
            .onAppear {
              withAnimation(
                .easeInOut(duration: 1.5)
                .repeatForever(autoreverses: true)
              ) { self.offset = 4.0 }
            }
        }
      }
      .ignoresSafeArea()
      VStack {
        VStack {
          Text("Dungeon Delver's")
            .font(Font.custom("JollyLodger", size: 50.0))
            .fontWeight(.black)
            .foregroundStyle(.white)
            .opacity(opacity)
            .onAppear {
              withAnimation(
                .easeIn(duration: 1.5)
              ) { self.opacity = 1.0 }
            }
          Text("Software Laboratory")
            .font(.title2)
            .fontWeight(.black)
            .foregroundStyle(.white)
            .opacity(opacity)
            .onAppear {
              withAnimation(
                .easeIn(duration: 1.5)
              ) { self.opacity = 1.0 }
            }
        }
        .padding()
        .background(.black.opacity(0.45))
        .padding(.top, portrait ? 100 : 200)
        Spacer()
      }
    }
    .frame(maxWidth: .infinity)
    .background(Color.black)
    .ignoresSafeArea()
    .onAppear {
      DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
        withAnimation(.easeIn(duration: 0.2)) {
          isPresented.toggle()
        }
      }
    }
  }
}

#Preview {
  SplashScreen(isPresented: .constant(true))
}
