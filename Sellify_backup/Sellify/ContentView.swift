import SwiftUI
import Firebase

struct ContentView: View {
<<<<<<< HEAD
    
=======
>>>>>>> refs/remotes/origin/master
    @State private var showProfile = false
    @State private var showEditProfile = false
    @State private var showSetting = false
    @State private var showLogin = false
    @State private var showHome = true
<<<<<<< HEAD
    @State private var showSupport = false
    @State private var loggedIn = false
    @State private var fromProfile = false
    
    
=======
>>>>>>> refs/remotes/origin/master
//    init() {
//        FirebaseApp.configure()
//    }
    var body: some View {
        if showProfile {
<<<<<<< HEAD
            ProfileView(showProfile: $showProfile, showEditProfile: $showEditProfile,showSetting: $showSetting, showLogin: $showLogin, showHome : $showHome, showSupport: $showSupport, fromProfile: $fromProfile)
=======
            ProfileView(showProfile: $showProfile, showEditProfile: $showEditProfile,showSetting: $showSetting, showLogin: $showLogin, showHome : $showHome)
>>>>>>> refs/remotes/origin/master
        } else if showEditProfile {
            EditProfileView(showProfile: $showProfile, showEditProfile: $showEditProfile,showSetting: $showSetting, showLogin: $showLogin, showHome : $showHome)
        } else if showSetting{
            SettingsView(showProfile: $showProfile, showEditProfile: $showEditProfile,showSetting: $showSetting, showLogin: $showLogin, showHome : $showHome)
        } else if showLogin {
<<<<<<< HEAD
            loginView(showProfile: $showProfile, showEditProfile: $showEditProfile,showSetting: $showSetting, showLogin: $showLogin, showHome : $showHome, showSupport: $showSupport, loggedIn : $loggedIn, fromProfile: $fromProfile)
            if (loggedIn) {
                MainView()
            }
        } else if showHome {
            HomePageView(showProfile: $showProfile, showEditProfile: $showEditProfile,showSetting: $showSetting, showLogin: $showLogin, showHome : $showHome)
        }
        else if showSupport {
            SupportView(showProfile: $showProfile, showSupport: $showSupport, fromProfile: $fromProfile)
        }
        
    }
}

struct MainView: View {
    @State private var selectedTab = 0
    @State private var showProfile = false
    @State private var showEditProfile = false
    @State private var showSetting = false
    @State private var showLogin = false
    @State private var showHome = false
    @State private var showSupport = false
    @State private var fromProfile = false
    var body: some View {
        TabView(selection: $selectedTab) {
            
            HomePostView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)
            
            CreatePostView()
                .tabItem {
                Image(systemName: "plus.square.fill")
                Text("Create Post")
                }
                .tag(1)
            
            ShoppingPostsView()
                .tabItem {
                    Image(systemName: "cart.fill")
                    Text("Shopping")
                }
                .tag(2)
            
            SupportView(showProfile: $showProfile, showSupport: $showSupport, fromProfile: $fromProfile)
                .tabItem {
                    Image(systemName: "questionmark.circle.fill")
                    Text("Support")
                }
                .tag(3)
            
            ProfileView(showProfile: $showProfile, showEditProfile: $showEditProfile, showSetting: $showSetting, showLogin: $showLogin, showHome: $showHome, showSupport: $showSupport, fromProfile: $fromProfile)
                .tabItem {
                    Image(systemName: "person.crop.circle.fill")
                    Text("Profile")
                }
                .tag(4)
        }
=======
            loginView(showProfile: $showProfile, showEditProfile: $showEditProfile,showSetting: $showSetting, showLogin: $showLogin, showHome : $showHome)
        } else if showHome {
            HomePageView(showProfile: $showProfile, showEditProfile: $showEditProfile,showSetting: $showSetting, showLogin: $showLogin, showHome : $showHome)
        }
>>>>>>> refs/remotes/origin/master
    }
}

struct ProfileView: View {
    @Binding var showProfile: Bool
    @Binding var showEditProfile: Bool
    @Binding var showSetting: Bool
    @Binding var showLogin: Bool
    @Binding var showHome: Bool
<<<<<<< HEAD
    @Binding var showSupport: Bool
    @Binding var fromProfile: Bool
=======
>>>>>>> refs/remotes/origin/master

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
<<<<<<< HEAD
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
                 fromProfile = true
             })
             ProfileButton(imageName: "questionmark.circle", title: "Support") {
                 showSupport = true
                 showEditProfile = false
                 showSetting = false
                 showLogin = false
                 showHome = false
                 showProfile = false
                 fromProfile = true
                          }
//                ProfileButton(imageName: "questionmark.circle", title: "Support")
=======
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
>>>>>>> refs/remotes/origin/master
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
<<<<<<< HEAD
                    .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))                    .background(Color.blue)
                    .cornerRadius(10)
=======
                    .padding()
>>>>>>> refs/remotes/origin/master
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
<<<<<<< HEAD
                    .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))                    .background(Color.blue)
                                        .cornerRadius(10)
//                .background(Color.blue)
=======
                .background(Color.blue)
>>>>>>> refs/remotes/origin/master

                })

        }

    }
}



struct loginView: View {
<<<<<<< HEAD
    
=======

>>>>>>> refs/remotes/origin/master
    @Binding var showProfile: Bool
    @Binding var showEditProfile: Bool
    @Binding var showSetting: Bool
    @Binding var showLogin: Bool
    @Binding var showHome: Bool
<<<<<<< HEAD
    @Binding var showSupport: Bool
    @Binding var loggedIn: Bool
    @Binding var fromProfile: Bool
    
    @State var email  = ""
    @State var password = ""
    
    
    
    
=======

    @State var email  = ""
    @State var password = ""

    @State var loggedIn = false


>>>>>>> refs/remotes/origin/master
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
<<<<<<< HEAD
    
    var body: some View {
        
        if (loggedIn == false) {
            Text("Log In To Your Account")
            TextField("Email", text: $email).textFieldStyle(.roundedBorder).multilineTextAlignment(.center)
            TextField("Password", text: $password).textFieldStyle(.roundedBorder).multilineTextAlignment(.center)
            
            Button(action: { login() }){
                Text("Sign in")
            }.buttonStyle(. bordered).tint(.mint).padding(50)
        } else {
            
            //            ProfileView(showProfile: $showProfile, showEditProfile: $showEditProfile,showSetting: $showSetting, showLogin: $showLogin, showHome : $showHome, showSupport: $showSupport)
        }
        
        if (fromProfile) {
            
            Button(action: {
                showLogin = false
                showProfile = true
                fromProfile = false
                
            }, label: {
                Text("Back to profile page")
                    .font(.headline)
                
            })
            
        }
        
    }
=======

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

>>>>>>> refs/remotes/origin/master
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
    
<<<<<<< HEAD
    
=======
>>>>>>> refs/remotes/origin/master
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
<<<<<<< HEAD

struct ShoppingPostsView: View {
    var body: some View {
        VStack {
            Text("Shopping searh bar and buttons")
        }
    }
}

struct HomePostView: View {
    var body: some View {
        HomePosts()
    }
}


struct SupportView: View {
    @Binding var showProfile: Bool
    @Binding var showSupport: Bool
    @State private var showFAQ = false
    @Binding var fromProfile: Bool

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
            
            if (fromProfile) {
                Button(action: {
                    showProfile = true
                    showSupport = false
                    fromProfile = false
                }, label: {
                    Text("Back to Profile")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))                    .background(Color.blue)
                        .cornerRadius(10)
                })
            }
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
=======
>>>>>>> refs/remotes/origin/master
