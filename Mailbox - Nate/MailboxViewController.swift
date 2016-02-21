//
//  MailboxViewController.swift
//  Mailbox - Nate
//
//  Created by Nathaniel Hajian on 2/18/16.
//  Copyright © 2016 Nathaniel Hajian. All rights reserved.
//

import UIKit

class MailboxViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var archiveIcon: UIImageView!
    @IBOutlet weak var deleteIcon: UIImageView!
    @IBOutlet weak var laterIcon: UIImageView!
    @IBOutlet weak var listIcon: UIImageView!
    @IBOutlet weak var messageImageView: UIImageView!
    @IBOutlet weak var rescheduleImageView: UIImageView!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var listImageView: UIImageView!
    @IBOutlet weak var searchView: UIImageView!
    
    var messageOriginalCenter: CGPoint!
    //var fixedLeftPosition: CGFloat!

    
    var grayColor = UIColor(red: 229/255.0, green: 230/255.0, blue: 232/255.0, alpha:1.0)
    var yellowColor = UIColor(red: 247/255.0, green: 204/255.0, blue: 39/255.0, alpha:1.0)
    var brownColor = UIColor(red: 206/255.0, green: 150/255.0, blue: 98/255.0, alpha:1.0)
    var redColor = UIColor(red: 228/255.0, green: 61/255.0, blue: 38/255.0, alpha:1.0)
    var greenColor = UIColor(red: 98/255.0, green: 214/255.0, blue: 79/255.0, alpha:1.0)
    var messageViewOriginal: CGPoint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageViewOriginal = feedImageView.center

        scrollView.contentSize = CGSize(width: 320, height: 1200)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPan(sender: UIPanGestureRecognizer) {
        
        
        
        
        let translation = sender.translationInView(view)
        
        print(translation.x)
        
        //began
        if sender.state == UIGestureRecognizerState.Began {
            
            messageOriginalCenter = messageImageView.center
    
          //changed
        } else if sender.state == UIGestureRecognizerState.Changed {
            messageImageView.center = CGPoint(x: messageOriginalCenter.x + translation.x, y: messageOriginalCenter.y)
            
            
            if translation.x >= 0 && translation.x < 60 {
                containerView.backgroundColor = grayColor
                laterIcon.alpha = 0
                listIcon.alpha = 0
                deleteIcon.alpha = 0
                archiveIcon.alpha = 1
            }
                
                
            else if translation.x >= 60 && translation.x < 260 {
                containerView.backgroundColor = greenColor
                laterIcon.alpha = 0
                listIcon.alpha = 0
                deleteIcon.alpha = 0
                archiveIcon.alpha = 1
                
                archiveIcon.center.x = messageImageView.center.x - 190
            }
                
                
            else if translation.x >= 260  {
                containerView.backgroundColor = redColor
                laterIcon.alpha = 0
                listIcon.alpha = 0
                deleteIcon.alpha = 1
                archiveIcon.alpha = 0
                
                deleteIcon.center.x = messageImageView.center.x - 190
            }
                
                
            else if translation.x <= 0 && translation.x > -60 {
                containerView.backgroundColor = grayColor
                laterIcon.alpha = 1
                listIcon.alpha = 0
                deleteIcon.alpha = 0
                archiveIcon.alpha = 0
            }
                
                
            else if translation.x <= -60 && translation.x > -260 {
                containerView.backgroundColor = yellowColor
                laterIcon.alpha = 1
                listIcon.alpha = 0
                deleteIcon.alpha = 0
                archiveIcon.alpha = 0
                
                laterIcon.center.x = messageImageView.center.x + 190
            }
                
                
            else if translation.x <= -260 {
                containerView.backgroundColor = brownColor
                laterIcon.alpha = 0
                listIcon.alpha = 1
                deleteIcon.alpha = 0
                archiveIcon.alpha = 0
                
                listIcon.center.x = messageImageView.center.x + 190
            }
            
            
            //ended
        }else if sender.state == UIGestureRecognizerState.Ended {
            
            
            if translation.x < 60 && translation.x > -60 {
                //self.messageImageView.center.x = self.fixedLeftPosition
                UIView.animateWithDuration(0.2, animations: {self.messageImageView.center.x = self.messageOriginalCenter.x})
              
                //archiveIcon.alpha = 0
                laterIcon.alpha = 1
            }
                
                
            else if translation.x >= 60 && translation.x < 260 {
                //self.messageImageView.center.x = self.offscreenRightPosition
                //self.offscreenRightPosition = self.messageImageView.center.x
                UIView.animateWithDuration(0.2, animations: {self.messageImageView.center.x = 600}, completion: { (Bool) -> Void in
                    self.hideMessageView()
                })
                archiveIcon.alpha = 0
                //hideMessageView()
            }
                
                            else if translation.x >= 260  {
                //self.messageImageView.center.x = self.offscreenRightPosition
                UIView.animateWithDuration(0.2, animations: {self.messageImageView.center.x = 600}, completion: { (Bool) -> Void in
                    self.hideMessageView()
                })
                archiveIcon.alpha = 0
                deleteIcon.alpha = 0
                //hideMessageView()
            }
                
                
            else if translation.x <= -60 && translation.x > -260{
                //self.messageImageView.center.x = self.offscreenLeftPosition
                UIView.animateWithDuration(0.2, animations: {self.messageImageView.center.x = -600}, completion: nil
                    //self.hideMessageView()
                )
                archiveIcon.alpha = 0
                laterIcon.alpha = 0
                rescheduleImageView.alpha = 1
            }
                
                
            else if translation.x <= 0 && translation.x > -60 {
                //self.messageImageView.center.x = self.fixedLeftPosition
                archiveIcon.alpha = 0
            }
                
                
            else if translation.x <= -260 {
                //self.messageImageView.center.x = self.offscreenLeftPosition
                UIView.animateWithDuration(0.2, animations: {self.messageImageView.center.x = -600}, completion: nil
                    //self.hideMessageView()
                )
                archiveIcon.alpha = 0
                listIcon.alpha = 0
                listImageView.alpha = 1
            }
            
            
            
            
        }
        
        
        
    }
    

    @IBAction func didTapRescheduleImage(sender: UITapGestureRecognizer) {
        
        rescheduleImageView.alpha = 0
        hideMessageView()
        
        
    }
    
    @IBAction func didTapListImage(sender: UITapGestureRecognizer) {
        
        listImageView.alpha = 0
        hideMessageView()
        
    }
    
    
    func hideMessageView() {
        UIView.animateWithDuration(0.4, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.containerView.alpha = 0
            }, completion: nil)
        UIView.animateWithDuration(0.4, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.feedImageView.center.y = self.feedImageView.center.y - 86
            }, completion: nil)
        
        
    }
    
    
    
    
    
    @IBAction func didTapToReloadImage(sender: UITapGestureRecognizer) {
        
        self.containerView.alpha = 1
        self.messageImageView.center = self.messageOriginalCenter
        
        UIView.animateWithDuration(0.6, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.feedImageView.center.y = self.feedImageView.center.y + 86
            }, completion: nil)
        
        
        
        
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
