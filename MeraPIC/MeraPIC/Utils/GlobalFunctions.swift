//
//  GlobalFunctions.swift
//  MeraPIC
//
//  Created by NhatMinh on 17/12/24.
//

import Foundation

func mainThread(function: @escaping ()-> Void) {
    DispatchQueue.main.async(execute: function)
}

func mainThreadAfter(seconds: Double, function: @escaping ()-> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: function)
}
