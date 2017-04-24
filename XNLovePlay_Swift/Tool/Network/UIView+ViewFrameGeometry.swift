//
//  UIView+ViewFrameGeometry.swift
//  DYTV_Swift
//
//  Created by zhiquan.xu on 16/11/23.
//  Copyright © 2016年 Gemall. All rights reserved.
//

import Foundation
import UIKit

extension UIView{

    public var origin:CGPoint{
        set{
            var newFrame = self.frame
            newFrame.origin = newValue
            self.frame = newFrame
        }
        get{
            return self.frame.origin
        }
    }
    
    public var size:CGSize{
        set{
            var newFrame = self.frame
            newFrame.size = newValue
            self.frame = newFrame
        }
        get{
            return self.frame.size
        }
    }
    
    public var bottomLeft:CGPoint{
        get{
            let x = self.frame.origin.x
            let y = self.frame.origin.y + self.frame.size.height
            return CGPoint.init(x: x, y: y)
        }
    }
    
    public var bottomRight:CGPoint{
        get{
            let x = self.frame.origin.x + self.frame.size.width
            let y = self.frame.origin.y + self.frame.size.height
            return CGPoint.init(x: x, y: y)
        }
    }
    
    public var topRight:CGPoint{
        get{
            let x = self.frame.origin.x + self.frame.size.width
            let y = self.frame.origin.y
            return CGPoint.init(x: x, y: y)
        }
    }
    
    public var height:CGFloat{
        get{
            return self.frame.size.height
        }
        set{
            var newframe = self.frame
            newframe.size.height = newValue
            self.frame = newframe
        }
    }
    
    public var width:CGFloat{
        get{
            return self.frame.size.width
        }
        set{
            var newframe = self.frame
            newframe.size.width = newValue
            self.frame = newframe
        }
    }
    
    public var top:CGFloat{
        get{
            return self.frame.origin.y
        }
        set{
            var newframe = self.frame
            newframe.origin.y = newValue
            self.frame = newframe
        }
    }
    
    public var left:CGFloat{
        get{
            return self.frame.origin.x
        }
        set{
            var newframe = self.frame
            newframe.origin.x = newValue
            self.frame = newframe
        }
    }
    
    public var bottom:CGFloat{
        get{
            return self.frame.origin.y + self.frame.size.height
        }
        set{
            var newframe = self.frame
            newframe.origin.y = newValue - self.frame.size.height
            self.frame = newframe
        }
    }
    
    public var right:CGFloat{
        get{
            return self.frame.origin.x + self.frame.size.width
        }
        set{
            let delta = newValue - (self.frame.origin.x + self.frame.size.width)
            var newframe = self.frame
            newframe.origin.x += delta
            self.frame = newframe
        }
    }
    
}
