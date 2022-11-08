//
//  RootViewController.swift
//  Silk Road Locker Exchange
//
//  Created by Alex Agarkov on 22.06.2022.
//

import UIKit
import Combine

class RootViewController: UIViewController, Storyboarded, LoadProtocol {
    
    let child = LoadViewController()
    
    
    func startActyvity() {

        // add the spinner view controller
        addChild(child)
        child.view.frame = view.frame
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    func stopActyvity() {
        DispatchQueue.main.async {
            self.child.willMove(toParent: nil)
            self.child.view.removeFromSuperview()
            self.child.removeFromParent()
        }
    }
    
    func error(_ error: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error!", message: error, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func alertOK(_ message: String, handler: ((UIAlertAction) -> Void)? = nil) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Success!", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: handler))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    var anyCancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dismissKeyboard()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
         self.addKeyboardObserver()
     }

     override func viewWillDisappear(_ animated: Bool) {
         self.removeKeyboardObserver()
     }
    
    func setBackButton() {
        let yourBackImage = UIImage(named: "back")
        self.navigationController?.navigationBar.backIndicatorImage = yourBackImage
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.5450000167, green: 0.7450000048, blue: 0.1059999987, alpha: 1)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UITextField {
    func getText() -> String {
        return self.text ?? ""
    }
}

extension UIViewController {
func dismissKeyboard() {
       let tap: UITapGestureRecognizer = UITapGestureRecognizer( target:     self, action:    #selector(UIViewController.dismissKeyboardTouchOutside))
       tap.cancelsTouchesInView = false
       view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboardTouchOutside() {
       view.endEditing(true)
    }
}

class LoadViewController: UIViewController {
    var spinner = UIActivityIndicatorView(style:.large)

    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.3)

        spinner.color = UIColor.green
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        view.addSubview(spinner)

        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

extension UIViewController {
    func addKeyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardNotifications(notification:)),
                                               name: UIResponder.keyboardWillChangeFrameNotification,
                                               object: nil)
    }

    func removeKeyboardObserver(){
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }

    // This method will notify when keyboard appears/ dissapears
    @objc func keyboardNotifications(notification: NSNotification) {

        var txtFieldY : CGFloat = 0.0  //Using this we will calculate the selected textFields Y Position
        let spaceBetweenTxtFieldAndKeyboard : CGFloat = 5.0 //Specify the space between textfield and keyboard


        var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        if let activeTextField = UIResponder.currentFirst() as? UITextField ?? UIResponder.currentFirst() as? UITextView {
            // Here we will get accurate frame of textField which is selected if there are multiple textfields
            frame = self.view.convert(activeTextField.frame, from:activeTextField.superview)
            txtFieldY = frame.origin.y + frame.size.height
        }

        if let userInfo = notification.userInfo {
            // here we will get frame of keyBoard (i.e. x, y, width, height)
            let keyBoardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
            let keyBoardFrameY = keyBoardFrame!.origin.y
            let keyBoardFrameHeight = keyBoardFrame!.size.height

            var viewOriginY: CGFloat = 0.0
            //Check keyboards Y position and according to that move view up and down
            if keyBoardFrameY >= UIScreen.main.bounds.size.height {
                viewOriginY = 0.0
            } else {
                // if textfields y is greater than keyboards y then only move View to up
                if txtFieldY >= keyBoardFrameY {

                    viewOriginY = (txtFieldY - keyBoardFrameY) + spaceBetweenTxtFieldAndKeyboard

                    //This condition is just to check viewOriginY should not be greator than keyboard height
                    // if its more than keyboard height then there will be black space on the top of keyboard.
                    if viewOriginY > keyBoardFrameHeight { viewOriginY = keyBoardFrameHeight }
                }
            }

            //set the Y position of view
            self.view.frame.origin.y = -viewOriginY
        }
    }
}

extension UIResponder {

    static weak var responder: UIResponder?

    static func currentFirst() -> UIResponder? {
        responder = nil
        UIApplication.shared.sendAction(#selector(trap), to: nil, from: nil, for: nil)
        return responder
    }

    @objc private func trap() {
        UIResponder.responder = self
    }
}
