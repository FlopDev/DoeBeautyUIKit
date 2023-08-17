//
//  ContactMeViewController.swift
//  DoeBeauty
//
//  Created by Florian Peyrony on 16/08/2023.
//

import UIKit
import MessageUI

class ContactMeViewController: UIViewController, MFMailComposeViewControllerDelegate {


        @IBAction func openInstagramPage(_ sender: UIButton) {
            if let instagramURL = URL(string: "https://www.instagram.com/doe_bty") {
                if UIApplication.shared.canOpenURL(instagramURL) {
                    UIApplication.shared.open(instagramURL, options: [:], completionHandler: nil)
                } else {
                    // Gérer le cas où l'ouverture de l'URL n'est pas possible
                }
            }
        }
        
    @IBAction func openMailCompose(_ sender: Any) {
        if MFMailComposeViewController.canSendMail() {
                    let mailComposeVC = MFMailComposeViewController()
                    mailComposeVC.mailComposeDelegate = self
                    mailComposeVC.setToRecipients(["doebeauty.pro@gmail.com"])
                    mailComposeVC.setSubject("")
                    mailComposeVC.setMessageBody("", isHTML: false)
                    
                    present(mailComposeVC, animated: true, completion: nil)
            print("works well")
                } else {
                    // Gérer le cas où l'envoi de courrier électronique n'est pas possible
                    print("error with mails")
                }
    }
    
    // MARK: MFMailComposeViewControllerDelegate
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
