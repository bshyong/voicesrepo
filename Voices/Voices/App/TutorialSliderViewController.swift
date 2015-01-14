//
//  TutorialSliderViewController.swift
//  Voices
//
//  Created by Ben on 1/13/15.
//  Copyright (c) 2015 Assembly. All rights reserved.
//

import UIKit

class TutorialSliderViewController: UIViewController, UIPageViewControllerDataSource {
  
  private var pageViewController: UIPageViewController?
  private let titleTexts = ["Welcome to Voices.", "Tap and hold to record your message", "Message three"]

    override func viewDidLoad() {
        super.viewDidLoad()
        createPageViewController()
        setupPageControl()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  private func createPageViewController() {
    let pageController = self.storyboard!.instantiateViewControllerWithIdentifier("TutorialSliderPageController") as UIPageViewController
    pageController.dataSource = self
    
    if titleTexts.count > 0 {
      let firstController = getItemController(0)!
      let startingViewControllers: NSArray = [firstController]
      pageController.setViewControllers(startingViewControllers, direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
    }
    
    pageViewController = pageController
    addChildViewController(pageViewController!)
    self.view.addSubview(pageViewController!.view)
    pageViewController!.didMoveToParentViewController(self)
  }
  
  private func setupPageControl() {
    let appearance = UIPageControl.appearance()
    appearance.pageIndicatorTintColor = UIColor.grayColor()
    appearance.currentPageIndicatorTintColor = UIColor.whiteColor()
    appearance.backgroundColor = UIColor.darkGrayColor()
  }
  
  func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
    let itemController = viewController as TutorialItemViewController
    
    if itemController.itemIndex > 0 {
      return getItemController(itemController.itemIndex - 1)
    }
    return nil
  }

  func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
    let itemController = viewController as TutorialItemViewController
    
    if itemController.itemIndex + 1 < titleTexts.count {
      return getItemController(itemController.itemIndex + 1)
    }
    return nil
  }
  
  private func getItemController(itemIndex: Int) -> TutorialItemViewController? {
    if itemIndex < titleTexts.count {
      let pageItemController = self.storyboard!.instantiateViewControllerWithIdentifier("TutorialSliderItem")
      pageItemController.itemIndex = itemIndex
      pageItemController.titleTextString = titleTexts[itemIndex]
      return pageItemController as TutorialItemViewController
    }
    return nil
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
