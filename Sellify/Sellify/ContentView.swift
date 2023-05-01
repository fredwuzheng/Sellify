import SwiftUI
import Firebase

struct ContentView: View {
    @State private var showProfile = false
    @State private var showEditProfile = false
    @State private var showSetting = false
    @State private var showLogin = false
    @State private var showHome = true
    @State private var showSupport = false
    @State private var showCreateAcc = false
//    init() {
//        FirebaseApp.configure()
//    }
    var body: some View {
        if showProfile {
            ProfileView(showProfile: $showProfile, showEditProfile: $showEditProfile,showSetting: $showSetting, showLogin: $showLogin, showHome : $showHome, showSupport: $showSupport)
        } else if showEditProfile {
            EditProfileView(showProfile: $showProfile, showEditProfile: $showEditProfile,showSetting: $showSetting, showLogin: $showLogin, showHome : $showHome)
        } else if showSetting{
            SettingsView(showProfile: $showProfile, showEditProfile: $showEditProfile,showSetting: $showSetting, showLogin: $showLogin, showHome : $showHome)
        } else if showLogin {
            loginView(showProfile: $showProfile, showEditProfile: $showEditProfile,showSetting: $showSetting, showLogin: $showLogin, showHome : $showHome, showSupport: $showSupport, showCreateAcc: $showCreateAcc)
        } else if showHome {
            HomePageView(showProfile: $showProfile, showEditProfile: $showEditProfile,showSetting: $showSetting, showLogin: $showLogin, showHome : $showHome)
        } else if showCreateAcc{
            CreateAccView(showProfile: $showProfile, showEditProfile: $showEditProfile,showSetting: $showSetting, showLogin: $showLogin, showHome : $showHome, showCreateAcc: $showCreateAcc)
        } else if showSupport {
            SupportView(showProfile: $showProfile, showSupport: $showSupport)
        }
    }
}

struct ProfileView: View {
    @Binding var showProfile: Bool
    @Binding var showEditProfile: Bool
    @Binding var showSetting: Bool
    @Binding var showLogin: Bool
    @Binding var showHome: Bool
    @Binding var showSupport: Bool

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
//                ProfileButton(imageName: "message", title: "Chat")
                ProfileButton(imageName: "gear", title: "Settings", action: {
                     showEditProfile = false
                     showSetting = true
                     showLogin = false
                     showHome = false
                     showSupport = false
                     showProfile = false
                })
             ProfileButton(imageName: "person", title: "Sign In/Out", action: {
                 showEditProfile = false
                 showSetting = false
                 showLogin = true
                 showHome = false
                 showSupport = false
                 showProfile = false
             })
             ProfileButton(imageName: "questionmark.circle", title: "Support") {
                 showSupport = true
                 showEditProfile = false
                 showSetting = false
                 showLogin = false
                 showHome = false
                 showProfile = false
                          }
//                ProfileButton(imageName: "questionmark.circle", title: "Support")
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
                    .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))                    .background(Color.blue)
                    .cornerRadius(10)
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
                    .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))                    .background(Color.blue)
                                        .cornerRadius(10)
//                .background(Color.blue)

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
    @Binding var showSupport: Bool
    @Binding var showCreateAcc: Bool
    
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
            ProfileView(showProfile: $showProfile, showEditProfile: $showEditProfile,showSetting: $showSetting, showLogin: $showLogin, showHome : $showHome, showSupport: $showSupport)
        }

        Button(action: {
            showLogin = false
            showProfile = true
            
        }, label: {
            Text("Back to profile page")
                .font(.headline)
            })
        
        Button(action: {
            showLogin = false
            showCreateAcc = true
        }, label: {
            Text("Don't have an account yet?")
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

struct CreateAccView: View {
    @Binding var showProfile: Bool
    @Binding var showEditProfile: Bool
    @Binding var showSetting: Bool
    @Binding var showLogin: Bool
    @Binding var showHome: Bool
    @Binding var showCreateAcc: Bool
    @State private var showErrorAlert = false
    @State private var errorAlertMessage = ""
    @State private var email = ""
    @State private var password = ""
    @State private var showSuccessAlert = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Create Account")
                .font(.largeTitle)
                .bold()

            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button(action: createAccount, label: {
                Text("Create Account")
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            })
        }
        .padding()
        .alert(isPresented: $showErrorAlert) {
            Alert(title: Text("Error"), message: Text(errorAlertMessage), dismissButton: .default(Text("OK")))
            
        }
        .alert(isPresented: $showSuccessAlert) {
                    Alert(title: Text("Success"), message: Text(successAlertMessage), dismissButton: .default(Text("OK")))
                }
        Button(action: {
            showCreateAcc = false
            showLogin = true
            
        }, label: {
            Text("Back to login page")
                .font(.headline)
            })
    }
    
    func createAccount() {
        if password.isEmpty {
            errorAlertMessage = "Password cannot be empty"
            showErrorAlert = true
            return
        }

        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                errorAlertMessage = error.localizedDescription
                showErrorAlert = true
                return
            }  else {
                successAlertMessage = "Account created successfully"
                showSuccessAlert = true
            }
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

struct SupportView: View {
    @Binding var showProfile: Bool
    @Binding var showSupport: Bool
    @State private var showFAQ = false

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Spacer()
                VStack(alignment: .center, spacing: 5) {
                Text("Support")
                    .font(.largeTitle)
                    .bold()
                Text("How can we help you today?")
                }
                Spacer()
            }
            Divider()
            Spacer(minLength: 30)

            HStack {
                Spacer()
                Button(action: {
                    showFAQ = true
                }, label: {
                    Text("Frequently Asked Questions")
                        .font(.headline)
                })
                Spacer()
            }
            HStack {
                Spacer()
                Text("See what people have in common")
                    .font(.system(size: 13))
                Spacer()
            }


            Spacer(minLength: 15)

            VStack(alignment: .leading, spacing: 10) {
                Text("Need more help?")
                    .font(.headline)
                    .font(.system(size: 13))
                Text("Contact Us")
                    .font(.headline)
                    .font(.system(size: 12))
                Text("Email: support@sellify.com")
                    .font(.system(size: 12))
                Text("Phone: +1)123-456-7890")
                    .font(.system(size: 12))
            }
            Spacer(minLength: 10)


            Button(action: {
                showProfile = true
                showSupport = false
            }, label: {
                Text("Back to Profile")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))                    .background(Color.blue)
                    .cornerRadius(10)
            })
        }
        .padding()
        .sheet(isPresented: $showFAQ) {
            FrequentlyAskedQuestionsView()
        }
    }
}

struct FrequentlyAskedQuestionsView: View {
    @Environment(\.presentationMode) var presentationMode

    @State private var showAnswer: [Bool] = [false, false, false, false]

    var questionsAndAnswers = [
        ("How do I reset my password?", "To reset your password, go to the sign-in screen and click on 'Forgot Password'. Follow the instructions provided."),
        ("How can I change my email address?", "To change your email address, go to the Edit Profile screen and update the email field."),
        ("How can I change my Name?", "To change your name, go to the Edit Profile screen and update the name field."),
        ("How do I delete my account?", "To delete your account, please contact our support team at support@sellify.com.")
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Frequently Asked Questions")
                .font(.largeTitle)
                .bold()

            Divider()

            List {
                ForEach(0..<questionsAndAnswers.count, id: \.self) { index in
                        VStack(alignment: .leading, spacing: 10) {
                            Button(action: {
                                showAnswer[index].toggle()
                            }, label: {
                                Text(questionsAndAnswers[index].0)
                                    .font(.headline)
                            })

                            if showAnswer[index] {
                                Text(questionsAndAnswers[index].1)
                            }
                        }
                    }
                }

                Spacer()

                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Back")
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
