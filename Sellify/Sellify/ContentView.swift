import SwiftUI
import Firebase


//var globalNewPost = [
//   Posting(
//       id: UUID(), description: "Bag", category: "Fashion", image: "bag", contacts: "123-456-7890", cost: 50),
//   Posting(
//       id: UUID(), description: "Das Leyboard MacTigr", category: "Electronics", image: "keyboard", contacts: "734-574-1245", cost: 219),
//   Posting(
//       id: UUID(), description: "Kids toy (never used!)", category: "Kids", image: "kidstoy", contacts: "123-461-7420", cost: 30),
//   Posting(
//       id: UUID(), description: "Office Chair", category: "Furniture", image: "chair", contacts: "321-456-4435", cost: 102),
//   Posting(
//       id: UUID(), description: "Cooking pot", category: "Kitchen", image: "pot", contacts: "133-479-0042", cost: 25),
//   Posting(
//       id: UUID(), description: "Color pencils", category: "Arts", image: "pencilsets", contacts: "754-456-1324", cost: 10),
//   Posting(
//       id: UUID(), description: "Moon Lamp Moon Night Light", category: "Home Decor", image: "mood bed light", contacts: "188-093-1296", cost: 42),
//   Posting(
//       id: UUID(), description: "2 leg pet dog clothes", category: "Pets", image: "dogclothes", contacts: "143-486-7891", cost: 20),
//   Posting(
//       id: UUID(), description: "8X10 black rug", category: "Home Decor", image: "carpet", contacts: "103-457-7832", cost: 50),
//
//]

struct Content: View {
    @State private var currentView: ActiveView = .home
    @State private var loggedIn = false
    @State private var fromProfile = false
//    @State private var showProfile = false
//    @State private var showEditProfile = false
//    @State private var showSetting = false
//    @State private var showLogin = false
//    @State private var showHome = true
//    @State private var showSupport = false
//    @State private var loggedIn = false
    
    var body: some View {
        ContentView(currentView: $currentView, loggedIn: $loggedIn, fromProfile: $fromProfile)
//        ContentView(showProfile: $showProfile, showEditProfile: $showEditProfile,showSetting: $showSetting, showLogin: $showLogin, showHome : $showHome, showSupport: $showSupport, fromProfile: $fromProfile, loggedIn: $loggedIn)
    }
}

enum ActiveView {
    case home, profile, editProfile, editSetting, login, support, main, createAcc
}

struct ContentView: View {
    @Binding var currentView: ActiveView
    @Binding var loggedIn: Bool
    @Binding var fromProfile: Bool
//    @Binding var showProfile: Bool
//    @Binding var showEditProfile: Bool
//    @Binding var showSetting: Bool
//    @Binding var showLogin: Bool
//    @Binding var showHome: Bool
//    @Binding var showSupport: Bool
//    @Binding var fromProfile: Bool
//    @Binding var loggedIn: Bool
//    init() {
//        FirebaseApp.configure()
//    }
    var body: some View {
        Group {
            switch currentView {
            case .home:
                HomePageView(currentView: $currentView)
            case .profile:
                ProfileView(currentView: $currentView, loggedIn: $loggedIn, fromProfile: $fromProfile)
            case .editProfile:
                EditProfileView(currentView: $currentView)
            case .editSetting:
                SettingsView(currentView: $currentView)
            case .login:
                loginView(currentView: $currentView, loggedIn: $loggedIn, fromProfile: $fromProfile)
            case .support:
                SupportView(currentView: $currentView)
            case .createAcc:
                CreateAccView(currentView: $currentView)
            case .main:
                MainView(currentView: $currentView, loggedIn: $loggedIn, fromProfile: $fromProfile)
            }
        }
//        if showProfile {
//            ProfileView(showProfile: $showProfile, showEditProfile: $showEditProfile,showSetting: $showSetting, showLogin: $showLogin, showHome : $showHome, showSupport: $showSupport, fromProfile: $fromProfile, loggedIn: $loggedIn)
//
//        } else if showEditProfile {
//            EditProfileView(showProfile: $showProfile, showEditProfile: $showEditProfile,showSetting: $showSetting, showLogin: $showLogin, showHome : $showHome)
//        } else if showSetting{
//            SettingsView(showProfile: $showProfile, showEditProfile: $showEditProfile,showSetting: $showSetting, showLogin: $showLogin, showHome : $showHome)
//        } else if showHome {
//            HomePageView(showProfile: $showProfile, showEditProfile: $showEditProfile,showSetting: $showSetting, showLogin: $showLogin, showHome : $showHome)
//        } else if showLogin {
//            loginView(showProfile: $showProfile, showEditProfile: $showEditProfile,showSetting: $showSetting, showLogin: $showLogin, showHome : $showHome, showSupport: $showSupport, loggedIn : $loggedIn, fromProfile: $fromProfile)
//        } else if showSupport {
//            SupportView(showProfile: $showProfile, showSupport: $showSupport)
//        }
//
//        if (loggedIn && !fromProfile) {
//            MainView(showProfile: $showProfile, showEditProfile: $showEditProfile,showSetting: $showSetting, showLogin: $showLogin, showHome : $showHome, showSupport: $showSupport, fromProfile: $fromProfile, loggedIn: $loggedIn)
//        } else if (loggedIn && fromProfile) {
//            ProfileView(showProfile: $showProfile, showEditProfile: $showEditProfile,showSetting: $showSetting, showLogin: $showLogin, showHome : $showHome, showSupport: $showSupport, fromProfile: $fromProfile, loggedIn: $loggedIn)
//        }
        
    }
}

struct MainView: View {
    @State private var selectedTab = 0
//    @Binding var showProfile: Bool
//    @Binding var showEditProfile: Bool
//    @Binding var showSetting: Bool
//    @Binding var showLogin: Bool
//    @Binding var showHome: Bool
//    @Binding var showSupport: Bool
    @Binding var currentView: ActiveView
    @Binding var loggedIn: Bool
    @Binding var fromProfile: Bool
    
    var body: some View {
        VStack {
            Spacer()
            if loggedIn {
                // Show the selected view
                switch selectedTab {
                case 0:
                    HomePostView()
                case 1:
                    CreatePostView(currentView: $currentView)
                case 2:
                    ShoppingPostsView()
                case 3:
                    SupportView(currentView: $currentView)
                case 4:
                    ProfileView(currentView: $currentView, loggedIn: $loggedIn, fromProfile: $fromProfile)
                default:
                    Text("No view available.")
                }
            } else {
                switch selectedTab {
                case 0:
                    HomePostView()
                case 1:
                    loginView(currentView: $currentView, loggedIn: $loggedIn, fromProfile: $fromProfile)
                case 2:
                    ShoppingPostsView()
                case 3:
                    SupportView(currentView: $currentView)
                case 4:
                    loginView(currentView: $currentView, loggedIn: $loggedIn, fromProfile: $fromProfile)
                default:
                    Text("No view available.")
                }
            }

            Spacer()
            
          

            // Custom tab bar
            HStack {
                Button(action: { selectedTab = 0 }) {
                    VStack {
                        Image(systemName: "house.fill").imageScale(.small)
                        Text("Home").font(.system(size: 8))
                    }
                }
                Spacer(minLength: 8)
                Button(action: { selectedTab = 1 }) {
                    VStack {
                        Image(systemName: "plus.square.fill").imageScale(.small)
                        Text("Create Post").font(.system(size: 8))
                    }
                }
                Spacer(minLength: 8)
                Button(action: { selectedTab = 2 }) {
                    VStack {
                        Image(systemName: "cart.fill").imageScale(.small)
                        Text("Shopping").font(.system(size: 8))
                    }
                }
                Spacer(minLength: 8)
                Button(action: { selectedTab = 3 }) {
                    VStack {
                        Image(systemName: "questionmark.circle.fill").imageScale(.small)
                        Text("Support").font(.system(size: 8))
                    }
                }
                Spacer(minLength: 8)
                Button(action: { selectedTab = 4 }) {
                    VStack {
                        Image(systemName: "person.crop.circle.fill").imageScale(.small)
                        Text("Profile").font(.system(size: 8))
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color(.systemGray4))
        }
        .edgesIgnoringSafeArea(.bottom)
//        TabView(selection: $selectedTab) {
//
//            HomePostView()
//                .tabItem {
//                    Image(systemName: "house.fill")
//                    Text("Home")
//                }
//                .tag(0)
//
//            CreatePostView()
//                .tabItem {
//                Image(systemName: "plus.square.fill")
//                Text("Create Post")
//                }
//                .tag(1)
//
//            ShoppingPostsView()
//                .tabItem {
//                    Image(systemName: "cart.fill")
//                    Text("Shopping")
//                }
//                .tag(2)
//
//            SupportView(showProfile: $showProfile, showSupport: $showSupport)
//                .tabItem {
//                    Image(systemName: "questionmark.circle.fill")
//                    Text("Support")
//                }
//                .tag(3)
//
//            ProfileView(showProfile: $showProfile, showEditProfile: $showEditProfile, showSetting: $showSetting, showLogin: $showLogin, showHome: $showHome, showSupport: $showSupport, fromProfile: $fromProfile)
//                .tabItem {
//                    Image(systemName: "person.crop.circle.fill")
//                    Text("Profile")
//                }
//                .tag(4)
//        }
    }
}

struct ProfileView: View {
    //    @Binding var showProfile: Bool
    //    @Binding var showEditProfile: Bool
    //    @Binding var showSetting: Bool
    //    @Binding var showLogin: Bool
    //    @Binding var showHome: Bool
    //    @Binding var showSupport: Bool
    @Binding var currentView: ActiveView
    @Binding var loggedIn: Bool
    @Binding var fromProfile: Bool
    
    
    
    
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
                        //                showEditProfile = true
                        //                showProfile = false
                        fromProfile = true
                        loggedIn = true
                        currentView = .editProfile
                        
                    })
                    ProfileButton(imageName: "square.grid.2x2", title: "My Posts")
                    ProfileButton(imageName: "clock", title: "Recently Viewed")
                    ProfileButton(imageName: "folder", title: "Collections")
                    //            }
                    
                    //            VStack(alignment: .leading, spacing: 20) {
                    //                ProfileButton(imageName: "message", title: "Chat")
                    ProfileButton(imageName: "gear", title: "Settings", action: {
                        //                showEditProfile = false
                        //                showSetting = true
                        //                showLogin = false
                        //                showHome = false
                        //                showSupport = false
                        //                showProfile = false
                        fromProfile = true
                        loggedIn = true
                        currentView = .editSetting
                        
                    })
                    ProfileButton(imageName: "person", title: "Sign In/Out", action: {
                        //                showEditProfile = false
                        //                showSetting = false
                        //                showLogin = true
                        //                showHome = false
                        //                showSupport = false
                        //                showProfile = false
                        fromProfile = true
                        loggedIn = false
                        currentView = .login
                        
                    })
                    //             ProfileButton(imageName: "questionmark.circle", title: "Support") {
                    //                 showSupport = true
                    //                 showEditProfile = false
                    //                 showSetting = false
                    //                 showLogin = false
                    //                 showHome = false
                    //                 showProfile = false
                    //                 fromProfile = true
                    //                          }
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
//    @Binding var showProfile: Bool
//    @Binding var showEditProfile: Bool
//    @Binding var showSetting: Bool
//    @Binding var showLogin: Bool
//    @Binding var showHome: Bool
    @Binding var currentView: ActiveView

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
//                showEditProfile = false
//                showProfile = true
                currentView = .main
            }, label: {
                Text("Back to home page")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 2, leading: 5, bottom: 2, trailing: 5))                    .background(Color.blue)
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
//    @Binding var showProfile: Bool
//    @Binding var showEditProfile: Bool
//    @Binding var showSetting: Bool
//    @Binding var showLogin: Bool
//    @Binding var showHome: Bool
    @Binding var currentView: ActiveView
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
//                showProfile = true
//                showEditProfile = false
                currentView = .main
            }, label: {
                Text("Save Changes")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 2, leading: 5, bottom: 2, trailing: 5))                    .background(Color.blue)
                                        .cornerRadius(10)
//                .background(Color.blue)

                })

        }

    }
}



struct loginView: View {
//    @Binding var showProfile: Bool
//    @Binding var showEditProfile: Bool
//    @Binding var showSetting: Bool
//    @Binding var showLogin: Bool
//    @Binding var showHome: Bool
//    @Binding var showSupport: Bool
    @Binding var currentView: ActiveView
    @Binding var loggedIn: Bool
    @Binding var fromProfile: Bool
    
    @State var email  = ""
    @State var password = ""
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                loggedIn = false
                print(error?.localizedDescription ?? "")
            } else {
                loggedIn = true
                print("success")
                DispatchQueue.main.async {
                    currentView = .main
                }
            }
        }
    }
    
    var body: some View {
        
        if (loggedIn == false) {
            Text("Log In To Your Account")
            TextField("Email", text: $email).textFieldStyle(.roundedBorder).multilineTextAlignment(.center).autocapitalization(.none)
            TextField("Password", text: $password).textFieldStyle(.roundedBorder).multilineTextAlignment(.center).autocapitalization(.none)
            
            Button(action: { login() }){
                Text("Sign in")
            }.buttonStyle(. bordered).tint(.mint).padding(50)
        } else {
            
            //            ProfileView(showProfile: $showProfile, showEditProfile: $showEditProfile,showSetting: $showSetting, showLogin: $showLogin, showHome : $showHome, showSupport: $showSupport)
        }
        
        if (fromProfile) {
            
            Button(action: {
//                showLogin = false
//                showProfile = true
                fromProfile = false
                currentView = .main
                
            }, label: {
                Text("Continue without an account")
                    .font(.headline)
                
            })
            
        }
        
        Button(action: {
            currentView = .createAcc
            
        }, label: {
            Text("Create an account")
                .font(.headline)
            })
        
    }
}

struct CreateAccView: View {
    @Binding var currentView: ActiveView
    @State private var showErrorAlert = false
    @State private var errorAlertMessage = ""
    @State private var email = ""
    @State private var password = ""
    @State private var showSuccessAlert = false
    @State private var successAlertMessage = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Create Account")
                .font(.largeTitle)
                .bold()

            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
                .autocapitalization(.none)

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)

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
            currentView = .login
            
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

extension Color {
    static let lightblue = Color(red: 0.0, green: 0.5, blue: 1.0)
}

struct HomePageView: View {
//    @Binding var showProfile: Bool
//    @Binding var showEditProfile: Bool
//    @Binding var showSetting: Bool
//    @Binding var showLogin: Bool
//    @Binding var showHome: Boo
    @Binding var currentView: ActiveView
    var body: some View {
        ZStack {
            Color.lightblue.edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer(minLength: 7)
                Image("store").resizable().frame(width: 150, height: 150)
                
                Text("Sellify")
                    .font(.custom("HelveticaNeue-Bold", size: 40))
                    .foregroundColor(.black)
                
                
                Button(action: {
                    //                showLogin = true
                    //                showHome = false
                    currentView = .login
                }, label: {
                    Text("Begin")
                        .font(.headline)
                        .foregroundColor(Color.black)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                })
                
                Spacer(minLength: 5)
            }
        }
        

    }
}



struct ShoppingPostsView: View {
    var body: some View {
        Shop()
    }
}

struct HomePostView: View {
    var body: some View {
        HomePosts()
    }
}


struct SupportView: View {
//    @Binding var showProfile: Bool
//    @Binding var showSupport: Bool
    @State private var showFAQ = false
    @Binding var currentView: ActiveView
//    @Binding var fromProfile: Bool

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
            
//            if (fromProfile) {
//                Button(action: {
//                    showProfile = true
//                    showSupport = false
//                    fromProfile = false
//                }, label: {
//                    Text("Back to Profile")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))                    .background(Color.blue)
//                        .cornerRadius(10)
//                })
//            }
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
                        .padding(EdgeInsets(top: 2, leading: 5, bottom: 2, trailing: 5))                    .background(Color.blue)
                                            .cornerRadius(10)
                })
            }
            .padding()
        }
    }

// post

struct CreatePostView: View {
    @State private var newPosting = Posting(id: UUID(), description: "", category:"", image:"", contacts: "", cost: 0.0)
    @Binding var currentView: ActiveView
    @State var showHome = false
    @State var touch = false
    var body: some View {
       
        NavigationView {
            Form {
                Section(header: Text("Item Details")) {
                    TextField("Description", text: $newPosting.description)
                    TextField("Category", text: $newPosting.category)
                    TextField("Image", text: $newPosting.image)
                    TextField("Contact", text: $newPosting.contacts)
                    TextField("Cost", value: $newPosting.cost, formatter: NumberFormatter())
                }

                Section {
                    Button(action: {
                        
                         
//                        globalNewPost.append(newPosting)
                    } , label: {
                        Text("Post")
                    })
                    
                        
                        NavigationLink(destination: newPostView(thePost: newPosting) , isActive: $showHome) {
                                      
                                   }
                    
                   
                }
            }
            .navigationBarTitle(Text("New Post"))
            
        }
    }

}



struct newPostView: View {
    var thePost : Posting
    var body: some View {
        
        let newPost = [
            Posting(
                id: UUID(), description: "Bag", category: "Fashion", image: "bag", contacts: "123-456-7890", cost: 50),
            Posting(
                id: UUID(), description: "Das Leyboard MacTigr", category: "Electronics", image: "keyboard", contacts: "734-574-1245", cost: 219),
            Posting(
                id: UUID(), description: "Kids toy (never used!)", category: "Kids", image: "kidstoy", contacts: "123-461-7420", cost: 30),
            Posting(
                id: UUID(), description: "Office Chair", category: "Furniture", image: "chair", contacts: "321-456-4435", cost: 102),
            Posting(
                id: UUID(), description: "Cooking pot", category: "Kitchen", image: "pot", contacts: "133-479-0042", cost: 25),
            Posting(
                id: UUID(), description: "Color pencils", category: "Arts", image: "pencilsets", contacts: "754-456-1324", cost: 10),
            Posting(
                id: UUID(), description: "Moon Lamp Moon Night Light", category: "Home Decor", image: "mood bed light", contacts: "188-093-1296", cost: 42),
            Posting(
                id: UUID(), description: "2 leg pet dog clothes", category: "Pets", image: "dogclothes", contacts: "143-486-7891", cost: 20),
            Posting(
                id: UUID(), description: "8X10 black rug", category: "Home Decor", image: "carpet", contacts: "103-457-7832", cost: 50),
            thePost
        ]
        
        
        
        
        
        
        let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            
        ]
        
        
        //let my_name = Person(name: "", grade: "", img: "", age: , hometown: "")
        
        
        
        
        ScrollView {
            //PersonView(person: my_name)
            Spacer(minLength: 40)
            
            Text("Recent Posts").fontWeight(.heavy)
            Spacer(minLength: 10)
            
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(newPost) { item in
                    
                    PostingView(newPost: item)
                }
            }
            .padding(.horizontal)
        }
        
    }
}




//
//struct newHomePosts: View {
//    var newPost: [Posting]
//    var body: some View {
//
//        let list = newPost
//
//
//
//
//
//
//        let columns = [
//            GridItem(.flexible()),
//            GridItem(.flexible()),
//
//        ]
//
//
//        //let my_name = Person(name: "", grade: "", img: "", age: , hometown: "")
//
//
//
//
//        ScrollView {
//            //PersonView(person: my_name)
//            Spacer(minLength: 40)
//
//            Text("Recent Posts").fontWeight(.heavy)
//            Spacer(minLength: 10)
//
//            LazyVGrid(columns: columns, spacing: 20) {
//                ForEach(newPost) { item in
//
//                    PostingView(newPost: item)
//                }
//            }
//            .padding(.horizontal)
//        }
//
//    }
//}
