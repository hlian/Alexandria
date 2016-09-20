//
//  NSObject+Customizable.swift
//
//  Created by Jonathan Landon on 1/19/16.
//
// The MIT License (MIT)
//
// Copyright (c) 2014-2016 Oven Bits, LLC
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import Foundation

/**
 Describes a protocol to enable objects to be customized, typically chained at initialization time.
 
 Inspired by: https://github.com/devxoul/Then
 */
public protocol Customizable {}

extension Customizable {
    
    /**
     Set properties on `self` with a closure.
     
     Example:
     ```
     let label = UILabel(frame: .zero).customize {
        $0.text = "Text goes here..."
        $0.textColor = .black
        $0.sizeToFit()
        $0.center = view.center
        $0.add(toSuperview: $0)
     }
     ```

     - parameter customize: A closure, performing the customization.
     
     - returns: `self`
     */
    @discardableResult
    public func customize(_ customize: (Self) -> Void) -> Self {
        customize(self)
        return self
    }
}

extension NSObject: Customizable {}