import SwiftUI
import Firebase

struct ContentView: View {
    @State private var showProfile = false
    @State private var showEditProfile = false
    @State private var showSetting = false
    @State private var showLogin = false
    @State private var showHome = true
//    init() {
//        FirebaseApp.configure()
//    }
    var body: some View {
        if showProfile {
            ProfileView(showProfile: $showProfile, showEditProfile: $showEditProfile,showSetting: $showSetting, showLogin: $showLogin, showHome : $showHome)
        } else if showEditProfile {
            EditProfileView(showProfile: $showProfile, showEditProfile: $showEditProfile,showSetting: $showSetting, showLogin: $showLogin, showHome : $showHome)
        } else if showSetting{
            SettingsView(showProfile: $showProfile, showEditProfile: $showEditProfile,showSetting: $showSetting, showLogin: $showLogin, showHome : $showHome)
        } else if showLogin {
            loginView(showProfile: $showProfile, showEditProfile: $showEditProfile,showSetting: $showSetting, showLogin: $showLogin, showHome : $showHome)
        } else if showHome {
            HomePageView(showProfile: $showProfile, showEditProfile: $showEditProfile,showSetting: $showSetting, showLogin: $showLogin, showHome : $showHome)
        }
    }
}

struct ProfileView: View {
    @Binding var showProfile: Bool
    @Binding var showEditProfile: Bool
    @Binding var showSetting: Bool
    @Binding var showLogin: Bool
    @Binding var showHome: Bool

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
             ProfileButton(imageName: "person", title: "Sign In/Out", action: {
                 showLogin = true
                 showProfile = false
             })
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
    @Binding var showLogin: Bool
    @Binding var showHome: Bool

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
    @Binding var showLogin: Bool
    @Binding var showHome: Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Edit Profile")
                .font(.largeTitle)
                .bold()

            Divider()

            VStack(alignment: .leading, spacing: 10) {
                Text("Name")
                    .font(.headline)
                TextField("Fred", text: .constant(""))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }

            VStack(alignment: .leading, spacing: 10) {
                Text("Email")
                    .font(.headline)
                TextField("fred@gmail.com", text: .constant(""))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }

            VStack(alignment: .leading, spacing: 10) {
                Text("Bio")
                    .font(.headline)
                TextEditor(text: .constant("Hello!"))
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



struct loginView: View {

    @Binding var showProfile: Bool
    @Binding var showEditProfile: Bool
    @Binding var showSetting: Bool
    @Binding var showLogin: Bool
    @Binding var showHome: Bool

    @State var email  = ""
    @State var password = ""

    @State var loggedIn = false


    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                loggedIn = false
                print(error?.localizedDescription ?? "")
            } else {
                loggedIn = true
                print("success")
            }
        }
    }

    var body: some View {

        if (loggedIn == false) {
            Text("Log In To Your Account")
            TextField("Email", text: $email).textFieldStyle(.roundedBorder).multilineTextAlignment(.center)
                TextField("Password", text: $password).textFieldStyle(.roundedBorder).multilineTextAlignment(.center)

                Button(action: { login() }){
                         Text("Sign in")
                }.buttonStyle(. bordered).tint(.mint).padding(50)
        } else {
            ProfileView(showProfile: $showProfile, showEditProfile: $showEditProfile,showSetting: $showSetting, showLogin: $showLogin, showHome : $showHome)
        }

        Button(action: {
            showLogin = false
            showProfile = true
            
        }, label: {
            Text("Back to profile page")
                .font(.headline)




            })




        }

}



struct HomePageView: View {
    @Binding var showProfile: Bool
    @Binding var showEditProfile: Bool
    @Binding var showSetting: Bool
    @Binding var showLogin: Bool
    @Binding var showHome: Bool
    var body: some View {
        VStack {
            Text("Welcome to Sellify")
                .font(.largeTitle)
                .foregroundColor(.blue)
            
            Button(action: {
                showLogin = true
                showHome = false
            }, label: {
                Text("Login")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            })
        }
    }
}


// Post

struct Post: Identifiable {
    var id = UUID()
    var text: String
}

class PostsViewModel: ObservableObject {
    @Published var posts: [Post] = []
    
    func addPost(text: String) {
        let post = Post(text: text)
        posts.append(post)
    }
}

struct CreatePostView: View {
    @State private var text: String = ""
    @EnvironmentObject var viewModel: PostsViewModel
    
    var body: some View {
        VStack {
            TextField("Enter your post", text: $text)
                .padding()
            Button(action: {
                // Post the text
                self.post()
            }, label: {
                Text("Post")
            })
        }
    }
    
    private func post() {
        // Add the post to the view model
        viewModel.addPost(text: text)
        // Reset the view
        text = ""
    }
}

struct PostsView: View {
    @EnvironmentObject var viewModel: PostsViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.posts) { post in
                VStack(alignment: .leading) {
                    Text(post.text)
                        .padding()
                }
            }
            .navigationTitle("Posts")
        }
    }
}

struct userPostView: View {
    @StateObject private var viewModel = PostsViewModel()
    
    var body: some View {
        TabView {
            CreatePostView()
                .tabItem {
                    Label("Create Post", systemImage: "pencil.circle.fill")
                }
            PostsView()
                .tabItem {
                    Label("Posts", systemImage: "list.bullet")
                }
        }
        .environmentObject(viewModel)
    }
}
