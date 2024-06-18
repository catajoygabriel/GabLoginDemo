//
//  ContentView.swift
//  GabLoginDemo
//
//  Created by Eldar Iusupov on 2024-06-18.
//

import SwiftUI

struct LoginView: View {
    @State var username = ""
    @State var password = ""
    @State var isPasswordVisible: Bool = false
    @State var isLoading: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                
                Image(.loginBg)
                    .resizable()
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    ZStack {
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                            .fill(Color.white)
                            .shadow(radius: 4)
                            .opacity(0.8)
                            .frame(maxWidth: .infinity)
                            .frame(height: 400)
                            .padding(.horizontal, 16)
                        VStack(spacing: 16) {
                            Image(.oscologo)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 160)
                            VStack {
                                Text("Username")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding([.leading, .trailing], 32)
                                TextField("", text: $username)
                                    .frame(height: 38)
                                    .border(Color.gray)
                                    .padding([.leading, .trailing], 32)
                                    .textFieldStyle(.roundedBorder)
                            }
                            VStack {
                                Text("Password")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding([.leading, .trailing], 32)
                                ZStack(alignment: .trailing) {
                                    SecureField("", text: $password)
                                        .padding(.trailing, 32)
                                    Button(action: {
                                        isPasswordVisible.toggle()
                                    }) {
                                        Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                                            .accentColor(.gray)
                                            .padding(.trailing, 8)
                                    }
                                }
                                .frame(height: 38)
                                .border(Color.gray)
                                .textFieldStyle(.roundedBorder)
                                .padding([.leading, .trailing], 32)
                                
                            }
                            Button(action: {
                                //demo load for 5 seconds
                                isLoading.toggle()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                                    isLoading.toggle()
                                }
                            }, label: {
                                Text("Log In with Credentials")
                                    .frame(maxWidth: .infinity)
                                    .padding(10)
                                    .foregroundStyle(.white)
                            })
                            .background(.brandBlue)
                            .clipShape(.rect(cornerRadius: 2))
                            .padding([.leading, .trailing], 32)
                            .padding(.top)
                            Text("Version 0.12345")
                                .foregroundStyle(Color.gray)
                    
                        }
                    }
                }
                .padding(.bottom, 16)
                if isLoading {
                    Color.black.opacity(0.2)
                        .edgesIgnoringSafeArea(.all)
                    LoadingView()
                }
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
    }
}

#Preview {
    LoginView()
}
