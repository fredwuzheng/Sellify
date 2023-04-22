import SwiftUI

struct ContentView: View {
    @State private var showProfile = true
    @State private var showEditProfile = false
    @State private var showSetting = false

    
    var body: some View {
        if showProfile {
            ProfileView(showProfile: $showProfile, showEditProfile: $showEditProfile,showSetting: $showSetting)
        } else if showEditProfile {
            EditProfileView(showProfile: $showProfile, showEditProfile: $showEditProfile,showSetting: $showSetting)
        } else if showSetting{
            SettingsView(showProfile: $showProfile, showEditProfile: $showEditProfile,showSetting: $showSetting)
        }
    }
}

struct ProfileView: View {
    @Binding var showProfile: Bool
    @Binding var showEditProfile: Bool
    @Binding var showSetting: Bool
    
    var body: some View {
 
        
        ZStack{
            Color.blue.frame(minWidth: 200, maxWidth: .infinity, maxHeight: 300)
            VStack(  spacing: 100) {
                Spacer()
                
                VStack(spacing: 20){
                    HStack(spacing: 20){
                        Image("profile_picture")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
    //                        .shadow(radius: 7)
                         Text("Fred Wu Zheng")
                            .font(.title)
                    }
                    Spacer()
                        
                }
              
            }
 
            
        }
//        Text("Software Engineer")
//            .font(.subheadline)
//            .foregroundColor(.gray)
 
    
        
         VStack( alignment: .leading, spacing: 20) {
//            VStack(alignment: .leading, spacing: 20) {
                ProfileButton(imageName: "square.and.pencil", title: "Edit Profile", action: {
                    showEditProfile = true
                    showProfile = false
                })
                ProfileButton(imageName: "square.grid.2x2", title: "My Posts")
                ProfileButton(imageName: "clock", title: "Recently Viewed")
                ProfileButton(imageName: "folder", title: "Collections")
//            }
            
//            VStack(alignment: .leading, spacing: 20) {
                ProfileButton(imageName: "message", title: "Chat")
                ProfileButton(imageName: "gear", title: "Settings", action: {
                    showSetting = true
                    showProfile = false
                })
                ProfileButton(imageName: "person", title: "Sign In/Out")
                ProfileButton(imageName: "questionmark.circle", title: "Support")
//            }
            
            Spacer()
            
            HStack {
                Spacer()
                Text("Information")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.bottom, 10)
                Spacer()
            }
        }
        .padding()
    }
}

struct SettingsView: View {
    @Binding var showProfile: Bool
    @Binding var showEditProfile: Bool
    @Binding var showSetting: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Settings")
                .font(.largeTitle)
                .bold()
            
            Divider()
            
            Toggle(isOn: .constant(true), label: {
                Text("Push Notifications")
                    .font(.headline)
            })
            
            Divider()
            
            Toggle(isOn: .constant(true), label: {
                Text("Email Notifications")
                    .font(.headline)
            })
            
            Spacer()
            
            Button(action: {
                showEditProfile = false
                showProfile = true
            }, label: {
                Text("Back to Profile")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            })
        }
        .padding()
    }
}

struct ProfileButton: View {
    let imageName: String
    let title: String
    let action: (() -> Void)?
    
    init(imageName: String, title: String, action: (() -> Void)? = nil) {
        self.imageName = imageName
        self.title = title
        self.action = action
    }
    
    var body: some View {
        Button(action: {
            action?()
        }, label: {
            HStack {
                Image(systemName: imageName)
                    .font(.title)
                
                Text(title)
                    .font(.caption)
            }
        })
    }
}

struct EditProfileView: View {
    @Binding var showProfile: Bool
    @Binding var showEditProfile: Bool
    @Binding var showSetting: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Edit Profile")
                .font(.largeTitle)
                .bold()
            
            Divider()
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Name")
                    .font(.headline)
                TextField("John Doe", text: .constant(""))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Email")
                    .font(.headline)
                TextField("johndoe@example.com", text: .constant(""))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Bio")
                    .font(.headline)
                TextEditor(text: .constant("I'm a software engineer who loves SwiftUI!"))
                    .frame(height: 100)
                    .border(Color.gray, width: 1)
            }
            
            Spacer()
            
            Button(action: {
                showProfile = true
                showEditProfile = false
            }, label: {
                Text("Save Changes")
                    .font(.headline)
                    .foregroundColor(.white)
                .background(Color.blue)
                
                })
                   
        }

    }
}
