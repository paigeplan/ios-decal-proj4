//
//  AddFolderViewController.swift
//  Created by Paige Plander on 4/21/16.
//  Copyright (c) 2016 Paige Plander. All rights reserved.
//

import UIKit

class AddFolderViewController: UIViewController {
    
    var folders: [String] = NSUserDefaults.standardUserDefaults().arrayForKey("folders") as? [String] ?? ["General"]
    
    @IBOutlet weak var folderTextField: UITextField!
    
    
    @IBAction func addFolder(sender: UIButton) {
        if let text = folderTextField.text {
            folders += [text]
            NSUserDefaults.standardUserDefaults().setObject(folders, forKey: "folders")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillLayoutSubviews()
        let size = CGSize(width: 450, height: folderTextField.frame.height + 70)
        self.preferredContentSize = size
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
