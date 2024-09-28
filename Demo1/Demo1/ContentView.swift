//
//  ContentView.swift
//  Demo1
//
//  Created by user on 28.09.2024.
//

import SwiftUI

struct ContentView: View {
    //     Стартовый экран приложения
    //     28.09.2024
    //     Юров Артем
    //     Кнопка перехода на экран Регистрации
    var body: some View {
        NavigationView {
            NavigationLink(destination: SignUpView()) {
                Text("Sign up")
                    .foregroundColor(.blue)
            }
        }
    }
}

struct SignUpView: View {
    //     Экран регистрации
    //     28.09.2024
    //     Юров Артем
    //     Кнопка перехода на экран Регистрации
    @StateObject var userViewModel = UserViewModel()
    @State var titleAlert: String=""
    @State var messageAlert: String=""
    @State var isAgreedToTerms: Bool=false
    @State var checkFullName: Bool=false
    @State var checkPhoneNumber: Bool=false
    @State var checkEmail: Bool=false
    @State var checkPass1: Bool=false
    @State var checkPass2: Bool=false
    @State var checkPass3: Bool=false
    @State var checkTerms: Bool=false
    @State var checkAllFields:Bool=false
    @State var alerts:Bool=false
    func checkAll(){
        if !userViewModel.user.name.isEmpty && !userViewModel.user.phone.isEmpty && !userViewModel.email.isEmpty && !userViewModel.password.isEmpty &&
            !userViewModel.confirmPassword.isEmpty && !isAgreedToTerms==false
        {
            checkAllFields=true
        }
        else {
            checkAllFields=false
        }
    }
    var body: some View {
        VStack {
            NavigationLink(destination: SignInView(), isActive: $userViewModel.isNavigate) {}
                CustomTitle(title: "Create an account", description: "Complete the sign up process to get started")
                VStack {
                    CustomTextField(
                        isSecureField: false,
                        titleField: "Full name",
                        placeholderField: "Ivanov Ivan",
                        text: $userViewModel.user.name
                    )
                    CustomTextField(
                        isSecureField: false,
                        titleField: "Phone number",
                        placeholderField: "+7(999)999-99-99",
                        text: $userViewModel.user.phone
                    )
                    CustomTextField(
                        isSecureField: false,
                        titleField: "Email address",
                        placeholderField: "*********@mail.com",
                        text: $userViewModel.email
                    )
                    CustomTextField(
                        isSecureField: true,
                        titleField: "Password",
                        placeholderField: "*********",
                        text: $userViewModel.password
                    )
                    CustomTextField(
                        isSecureField: true,
                        titleField: "Confirm Password",
                        placeholderField: "*********",
                        text: $userViewModel.confirmPassword
                    )
                }
            HStack {
                
                CheckBox(value: $isAgreedToTerms)
                    .padding(.leading,0)
                    .padding(.trailing,0)
                    .padding(.top,15)
                VStack{
                    HStack (spacing:0){
                        Text("By ticking this box, you agree to our ")// Allows the text to wrap onto multiple lines
                            .lineLimit(1)
                            .foregroundColor(.gray)
                            .fixedSize(horizontal: true,vertical:false)
                            .font(.custom("Roboto",size: 12))
                        Text("Terms and") // Allows the text to wrap onto multiple lines
                            .lineLimit(1)
                            .fixedSize(horizontal: true,vertical:false)
                        //.fixedSize(horizontal: false, vertical: false)
                            .font(.custom("Roboto",size: 12))
                        .foregroundColor(.yellow)}
                    .padding(.top,18)
                    .frame(alignment: .center)
                    
                    Text("conditions and privacy policy.") // Allows the text to wrap onto multiple lines
                        .lineLimit(1)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.trailing,18)
                        .padding(.top,0)
                    //.fixedSize(horizontal: false, vertical: false)
                        .font(.custom("Roboto",size: 12))
                    .foregroundColor(.yellow)}
            }
            
            
            // Sign Up Button
            Button(action: {
                checkAll()
                if userViewModel.user.name.isEmpty {
                    checkFullName = true
                    titleAlert = "Input Error"
                    messageAlert = "Please fill in 'Full name' field."
                    alerts = true
                    
                }
                else
                if userViewModel.user.phone.isEmpty {
                    checkPhoneNumber = true
                    titleAlert = "Input Error"
                    messageAlert = "Please fill in 'Phone number' field."
                    alerts = true
                }
                else
                if userViewModel.email.isEmpty {
                    checkEmail = true
                    titleAlert = "Input Error"
                    messageAlert = "Please fill in 'Email' field."
                    alerts = true
                }
                else
                if userViewModel.password.isEmpty {
                    checkPass1 = true
                    titleAlert = "Input Error"
                    messageAlert = "Please fill in 'Password' field."
                    alerts = true
                }
                else
                if userViewModel.confirmPassword.isEmpty {
                    checkPass2 = true
                    titleAlert = "Input Error"
                    messageAlert = "Please fill in 'Confirm password' field."
                    alerts = true
                }
                else
                if userViewModel.password != userViewModel.confirmPassword {
                    checkPass3 = true
                    titleAlert = "Input Error"
                    messageAlert = "Please check in 'Password' and 'Confirm password' field."
                    alerts = true
                }
                else
                if isAgreedToTerms==false {
                    checkTerms = true
                    titleAlert = "Input Error"
                    messageAlert = "Please fill in 'CheckBox' Terms."
                    alerts = true
                }
                else {
                    alerts = false
                    userViewModel.signUp()
                }
                NavigationLink(destination: SignInView(), isActive: $userViewModel.isNavigate) {}
              
                
            }, label: {
                Text("Sign Up")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)                    .padding()
            })
            .background(checkAllFields ? Color.blue : Color.gray)
            .cornerRadius(4)
            .padding(.top,15)
            .padding(.bottom,15)
            .font(.custom("Roboto",size: 16))
            
            .alert(isPresented: $alerts) {
                Alert(title: Text(titleAlert),
                      message: Text(messageAlert),
                      dismissButton: .default(Text("OK")))
            }
            HStack{
                Text("Already have an account?")
                    .foregroundColor(.gray)
                    .font(.custom("Roboto",size: 14))
                    .padding(.top,0)
                NavigationLink(
                    destination: SignInView(),
                    label: {
                        Text("Sign In")
                    }).foregroundColor(.blue)
                        .font(.custom("Roboto",size: 14))
                }
            Text("or sign in using")
                .foregroundColor(.gray)
                .font(.custom("Roboto",size: 14))
                .padding(.top,18)
            Image("google")
                .resizable()
                .frame(width: 30, height: 30)
                .padding(10)

            .navigationBarHidden(true)
                    .padding(.top,0)
            }.padding(.leading,23)
            .padding(.trailing,23)
        }
    }
        
    
struct SignInView: View {
    @StateObject var userViewModel = UserViewModel()
    @State var email_address: String=""
    @State var password: String=""
    @State var isRememberPassword: Bool=false
    @State var checkEmail: Bool=false
    @State var checkPass1: Bool=false
    @State var checkAllFields: Bool=false
    @State var titleAlert: String=""
    @State var messageAlert: String=""
    @State var alerts:Bool=false
    func checkAll(){
        if  !userViewModel.email.isEmpty && !userViewModel.password.isEmpty 
        {
            checkAllFields=true
        }
        else {
            checkAllFields=false
        }
    }
    var body: some View{
        NavigationLink(destination: HomeView(), isActive: $userViewModel.isNavigate) {}
        VStack{
            CustomTitle(title: "Welcome Back", description: "Fill in your email and password to continue")
                Group {
                    CustomTextField(
                        isSecureField: false,
                        titleField: "Email address",
                        placeholderField: "*********@mail.com",
                        text: $userViewModel.email
                    )
                    CustomTextField(
                        isSecureField: true,
                        titleField: "Password",
                        placeholderField: "*********",
                        text: $userViewModel.password
                    )
                    HStack {
                        CheckBox(value: $isRememberPassword).padding(0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("Remember password")
                            .font(.custom("Roboto",size: 12))
                            .foregroundColor(.gray)
                            .padding(.top, 0)
                        NavigationLink(
                            destination: ForgotPasswordView(),
                            label: {
                                Text("Forgot Password?")
                            }).foregroundColor(.blue)
                                .font(.custom("Roboto",size: 12))
                                .padding(.leading, 100)
                    }.padding(.top, 15)
                        .fixedSize(horizontal: true,vertical:false)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                // Sign In Button

                Button(action: {
                    if userViewModel.email.isEmpty {
                        checkEmail = true
                        titleAlert = "Input Error"
                        messageAlert = "Please fill in 'Email' field."
                        alerts = true
                    }
                    else if userViewModel.password.isEmpty {
                        checkPass1 = true
                        titleAlert = "Input Error"
                        messageAlert = "Please fill in 'Password' field."
                        alerts = true
                    }
                    else {
                        checkAll()
                        userViewModel.signIn()
                    }
                    
                }, label: {
                    Text("Log In")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                })
                .background(checkAllFields ? Color.blue : Color.gray)
                .cornerRadius(4)
                .padding(.top,15)
                .padding(.bottom,15)
                .font(.custom("Roboto",size: 16))
            
                .alert(isPresented: $alerts) {
                    Alert(title: Text(titleAlert),
                          message: Text(messageAlert),
                          dismissButton: .default(Text("OK")))
                }
            
            HStack{
                Text("Already have an account?")
                    .font(.custom("Roboto",size: 14))
                    .foregroundColor(.gray)
                NavigationLink(destination: SignUpView()) {
                    Text("Sign Up") // You can customize the label
                        .font(.custom("Roboto",size: 14))
                        .foregroundColor(.blue)
                }
                      }
            Text("or sign in using")
                .foregroundColor(.gray)
                .font(.custom("Roboto",size: 14))
                .padding(.top,18)
            Image("google")
                .resizable()
                .frame(width: 30, height: 30)
                .padding(10)

            
        }.navigationBarHidden(true)
            .padding(.leading, 24)
            .padding(.trailing, 24)
    }
}
struct ForgotPasswordView: View {
    @StateObject var userViewModel = UserViewModel()
    @State var email_address: String=""
    @State var checkEmail: Bool=false
    @State var checkPassword: Bool=false
    @State public var showOTPView: Bool = false
    @State var checkAllFields: Bool = false
    @State var titleAlert: String=""
    @State var messageAlert: String=""
    @State var alerts:Bool=false
    func checkAll(){
        if  !userViewModel.email.isEmpty
        {
            checkAllFields=true
        }
        else {
            checkAllFields=false
        }
    }
    var body: some View{
        VStack{
            VStack {
                CustomTitle(title: "Forgot Password", description: "Enter your email address")
                CustomTextField(
                    isSecureField: false,
                    titleField: "Email address",
                    placeholderField: "*********@mail.com",
                    text: $userViewModel.email
                    )
                // Forgot Password Button
                Button(action: {
                    if userViewModel.email.isEmpty {
                        titleAlert = "Input Error"
                        messageAlert = "Please fill in 'Email' field."
                        alerts = true
                    } else {
                        checkAll()
                        alerts = false
                        showOTPView = true
                        }
                }, label: {
                    Text("Send OTP")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                })
                .background(checkAllFields ? Color.blue : Color.gray)
                .cornerRadius(4)
                .padding(0)
            }.padding(.leading, 23)
            .padding(.trailing, 23)
            .alert(isPresented: $alerts) {
                Alert(title: Text(titleAlert),
                      message: Text(messageAlert),
                      dismissButton: .default(Text("OK")))
            }
            NavigationLink(destination: OTPView(), isActive: $showOTPView) {
                EmptyView() // Use EmptyView for navigation
            }
            
            HStack{
                Text("Remember password? Back to")
                    .padding(.top , 20)
                    .font(.custom("Roboto",size: 14))
                    .foregroundColor(.gray)
                NavigationLink(destination: SignInView()) {
                    Text("Sign in") // You can customize the label
                        .foregroundColor(.blue)
                        .padding(.top , 20)
                        .font(.custom("Roboto",size: 14))
                }
            }
    }.navigationBarHidden(true)
    }
}

struct OTPView: View {
    @StateObject var userViewModel = UserViewModel()
    @State var email_address: String=""
    @State var checkNumb: Bool=false
    @State private var showOTPView: Bool = false
    //@State variable for navigation
    @State var checkAllFields: Bool = false
    @State var titleAlert: String=""
    @State var messageAlert: String=""
    @State var alerts:Bool=false
    @State var var1:String=""
    @State var var2:String=""
    @State var var3:String=""
    @State var var4:String=""
    @State var var5:String=""
    @State var var6:String=""
    func checkAll(){
        if  !var1.isEmpty && !var2.isEmpty && !var3.isEmpty && !var4.isEmpty && !var5.isEmpty && !var6.isEmpty
        {
            checkAllFields=true
        }
        else {
            checkAllFields=false
        }
    }
    var body: some View{
        VStack{
            VStack {
                CustomTitle(title: "OTP Verification", description: "Enter the 6 digit numbers sent to your email").padding(.leading, 24)
                Group {
                        HStack{
                            CustomTextField(
                                isSecureField: false,
                                titleField: "",
                                placeholderField: "",
                                text: $var1
                            ).frame(width: 40, height: 32, alignment: .center)
                                .padding(.leading, 6)
                                .padding(.trailing, 6)
                            CustomTextField(
                                isSecureField: false,
                                titleField: "",
                                placeholderField: "",
                                text: $var2
                            ).frame(width: 40, height: 32, alignment: .center)
                                .padding(.leading, 6)
                                .padding(.trailing, 6)
                            CustomTextField(
                                isSecureField: false,
                                titleField: "",
                                placeholderField: "",
                                text: $var3
                            ).frame(width: 40, height: 32, alignment: .center)
                                .padding(.leading, 6)
                                .padding(.trailing, 6)
                            CustomTextField(
                                isSecureField: false,
                                titleField: "",
                                placeholderField: "",
                                text: $var4
                            ).frame(width: 40, height: 32, alignment: .center)
                                .padding(.leading, 6)
                                .padding(.trailing, 6)
                            CustomTextField(
                                isSecureField: false,
                                titleField: "",
                                placeholderField: "",
                                text: $var5
                            ).frame(width: 40, height: 32, alignment: .center)
                                .padding(.leading, 6)
                                .padding(.trailing, 6)
                            CustomTextField(
                                isSecureField: false,
                                titleField: "",
                                placeholderField: "",
                                text: $var6
                            ).frame(width: 40, height: 32, alignment: .center)
                                .padding(.leading, 6)
                                .padding(.trailing, 6)
                        }.padding(.leading, 20)
                        .padding(.trailing, 20)
                    
                }.padding(1)
                // Forgot Password Button
                Button(action: {
                    if var1.isEmpty {
                        titleAlert = "Input Error"
                        messageAlert = "Please fill in 'Square №1' field."
                        alerts = true
                    }
                    else if var2.isEmpty {
                        titleAlert = "Input Error"
                        messageAlert = "Please fill in 'Square №2' field."
                        alerts = true
                    }
                    else if var3.isEmpty {
                        titleAlert = "Input Error"
                        messageAlert = "Please fill in 'Square №3' field."
                        alerts = true
                    }
                    else if var4.isEmpty {
                        titleAlert = "Input Error"
                        messageAlert = "Please fill in 'Square №4' field."
                        alerts = true
                    }
                    else if var5.isEmpty {
                        titleAlert = "Input Error"
                        messageAlert = "Please fill in 'Square №5' field."
                        alerts = true
                    }
                    else if var6.isEmpty {
                        titleAlert = "Input Error"
                    messageAlert = "Please fill in 'Square №6' field."
                        alerts = true
                    }
                    else {
                        checkAll()
                        alerts = false
                        showOTPView=true
                    }
                }, label: {
                    Text("Set New Password")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                })
                .background(checkAllFields ? Color.blue : Color.gray)
                .cornerRadius(4)
                .padding(.leading, 10)
                .padding(.trailing, 10)
                
                .padding()
            }.frame(maxWidth: .infinity, alignment: .leading)
            
            NavigationLink(destination: NewPasswordView(), isActive: $showOTPView) {
                EmptyView() // Use EmptyView for navigation
            }
            
            .alert(isPresented: $alerts) {
                Alert(title: Text(titleAlert),
                      message: Text(messageAlert),
                      dismissButton: .default(Text("OK")))
            }
        }.navigationBarHidden(true)
    }
}

struct NewPasswordView: View {
    @StateObject var userViewModel = UserViewModel()
    @State public var showSignInView: Bool = false
    @State var checkAllFields: Bool = false
    @State var titleAlert: String=""
    @State var messageAlert: String=""
    @State var alerts:Bool=false
    func checkAll(){
        if  userViewModel.password.isEmpty
        {
            checkAllFields=false
        }
        else if userViewModel.confirmPassword.isEmpty {
            checkAllFields=false
        }
        else {
            checkAllFields=true
        }
    }
    var body: some View{
        VStack{
            VStack {
                CustomTitle(title: "New Password", description: "Enter your email address")
                CustomTextField(
                    isSecureField: false,
                    titleField: "Password",
                    placeholderField: "*********",
                    text: $userViewModel.password
                    )
                CustomTextField(
                    isSecureField: false,
                    titleField: "Confirm Password",
                    placeholderField: "*********",
                    text: $userViewModel.confirmPassword
                    )
                // Forgot Password Button
                Button(action: {
                    if userViewModel.password.isEmpty {
                        titleAlert = "Input Error"
                        messageAlert = "Please fill in 'Password' field."
                        alerts = true
                    }
                    else if userViewModel.confirmPassword.isEmpty {
                        titleAlert = "Input Error"
                        messageAlert = "Please fill in 'Confirm Password' field."
                        alerts = true
                    }
                    else {
                        checkAll()
                        alerts = false
                        showSignInView = true
                        }
                }, label: {
                    Text("Log In")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                })
                .background(checkAllFields ? Color.blue : Color.gray)
                .cornerRadius(4)
                .padding(0)
            }.padding(.leading, 23)
            .padding(.trailing, 23)
            .alert(isPresented: $alerts) {
                Alert(title: Text(titleAlert),
                      message: Text(messageAlert),
                      dismissButton: .default(Text("OK")))
            }
            NavigationLink(destination: SignInView(), isActive: $showSignInView) {
                EmptyView() // Use EmptyView for navigation
            }

    }.navigationBarHidden(true)
    }
}


struct HomeView: View {
    var body: some View{
        VStack{
            VStack {
                Text("Home")
                    .font(.custom("Roboto", size: 24))
            }
        }.navigationBarHidden(true)
    }
}
#Preview {
    ContentView()
}
