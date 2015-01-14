//
//  TutorialItemViewController.swift
//  
//
//  Created by Ben on 1/13/15.
//
//

import UIKit

class TutorialItemViewController: UIViewController {

  var itemIndex: Int = 0

  var imageName: String = "" {
    // this is called after imageName is set
    didSet {
      if let titleImage = titleImage {
        titleImage.image = UIImage(named: imageName)
      }
    }
  }
  
  var titleTextString: String = "" {
    didSet {
      titleText.text = titleTextString
    }
  }
  
  @IBOutlet weak var titleImage: UIImageView!
  @IBOutlet weak var titleText: UILabel!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        titleImage!.image = UIImage(named: imageName)
        titleText!.text = titleTextString

        // Do any additional setup after loading the view.
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
