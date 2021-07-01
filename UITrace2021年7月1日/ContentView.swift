//
//  ContentView.swift
//  UITrace2021年7月1日
//
//  Created by 吉田周平 on 2021/07/01.
//

import SwiftUI

struct ContentView: View {
    
    @State var showingLoginView = false
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 80)
            Image("icon")
                .resizable()
                .frame(width: 80, height: 80)
                .scaledToFit()
                .cornerRadius(12)
                .padding()
            Text("Sign up to spend more time with your fiends **IRL** and discover fun things to do together.")
                .padding(48)
                .multilineTextAlignment(.center)
            Button(action: {
            }, label: {
                HStack {
                    Image("icons8-google-256")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.white)
                        
                    Text("Continue with Google")
                        .foregroundColor(.white)
                }
                .frame(width: 280)
                .padding()
                .background(Color.blue)
                .cornerRadius(36)
            })
                .padding(.bottom, 12)
            Button(action: {
            }, label: {
                HStack {
                    Image(systemName: "envelope.fill")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(Color(.sRGB,
                                               red: 210/255,
                                               green: 209/255,
                                               blue: 216/255,
                                               opacity: 1.0))
                        
                    Text("Sign up with email or phone")
                        .foregroundColor(.secondary)
                }
                .frame(width: 280)
                .padding()
                .background(Color(.sRGB,
                                  red: 246/255,
                                  green: 247/255,
                                  blue: 247/255,
                                  opacity: 1.0))
                .cornerRadius(36)
            })
                .padding(.bottom, 12)
            HStack {
                Text("Already have an account?")
                    .foregroundColor(.secondary)
                Button(action: {
                    showingLoginView.toggle()
                }, label: {
                    Text("Log in")
                })
            }
            Spacer()
        }
        .fullScreenCover(isPresented: $showingLoginView) {
            LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
