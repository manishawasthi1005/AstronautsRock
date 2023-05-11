//
//  LockView.swift
//  AstronautsRock
//
//  Created by manish.m.awasthi on 11.05.23.
//

import SwiftUI

struct LockView: View {
    var body: some View {
        NavigationView{
            
            LockHome()
        }
    }
}

struct LockView_Previews: PreviewProvider {
    static var previews: some View {
        LockView()
    }
}
struct LockHome : View {
    
    @State var unLocked = false
    
    var body: some View{
        
        ZStack{
            
            // Lockscreen...
            
            if unLocked{
                
                AstronautHomeView()
            }
            else{
                
                LockScreen(unLocked: $unLocked)
            }
        }
        .preferredColorScheme(unLocked ? .light : .dark)
    }
}

struct LockScreen : View {
    
    @State var lockCode = ""
    @State var key = "1234"
    @Binding var unLocked : Bool
    @State var wrongCode = false
    let height = UIScreen.main.bounds.width
    
    var body: some View{
        
        VStack{
            Spacer(minLength: 0)
            Text("Enter Pin to Unlock")
                .font(.title2)
                .fontWeight(.heavy)
                .padding(.top,20)
            
            HStack(spacing: 22){
                
                // LockCode Circle View...
                
                ForEach(0..<4,id: \.self){index in
                    
                    LockCodeView(index: index, lockCode: $lockCode)
                }
            }
            // for smaller size iphones...
            .padding(.top,height < 750 ? 20 : 30)
            
            // KeyPad....
            
            Spacer(minLength: 0)
            
            Text(wrongCode ? "Incorrect Pin" : "")
                .foregroundColor(.red)
                .fontWeight(.heavy)
            
            Spacer(minLength: 0)
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3),spacing: height < 750 ? 5 : 15){
                
                // LockCode Button ....
                
                ForEach(1...9,id: \.self){value in
                    
                    LockCodeButton(value: "\(value)",lockCode: $lockCode, key: $key, unlocked: $unLocked, wrongCode: $wrongCode)
                }
                
                LockCodeButton(value: "delete.fill",lockCode: $lockCode, key: $key, unlocked: $unLocked, wrongCode: $wrongCode)
                
                LockCodeButton(value: "0", lockCode: $lockCode, key: $key, unlocked: $unLocked, wrongCode: $wrongCode)
            }
            .padding(.bottom)

        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct LockCodeView : View {
    
    var index : Int
    @Binding var lockCode : String
    
    var body: some View{
        
        ZStack{
            
            Circle()
                .stroke(Color.white,lineWidth: 2)
                .frame(width: 30, height: 30)
            
            // checking whether it is typed...
            
            if lockCode.count > index{
                
                Circle()
                    .fill(Color.white)
                    .frame(width: 30, height: 30)
            }
        }
    }
}

struct LockCodeButton : View {
    
    var value : String
    @Binding var lockCode : String
    @Binding var key : String
    @Binding var unlocked : Bool
    @Binding var wrongCode : Bool
    
    var body: some View{
        
        Button(action: setLockCode, label: {
            
            VStack{
                
                if value.count > 1{
                    
                    // Image...
                    
                    Image(systemName: "delete.left")
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                }
                else{
                    
                    Text(value)
                        .font(.title)
                        .foregroundColor(.white)
                }
            }
            .padding()

        })
    }
    
    func setLockCode(){
        
        // checking if backspace pressed...
        
        withAnimation{
            
            if value.count > 1{
                
                if lockCode.count != 0{
                    
                    lockCode.removeLast()
                }
            }
            else{
                
                if lockCode.count != 4{
                    
                    lockCode.append(value)
                    
                    // Delay Animation...
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        
                        withAnimation{
                            
                            if lockCode.count == 4{
                                
                                if lockCode == key{
                                    
                                    unlocked = true
                                }
                                else{
                                    
                                    wrongCode = true
                                    lockCode.removeAll()
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
