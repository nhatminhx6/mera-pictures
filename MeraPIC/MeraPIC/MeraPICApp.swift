//
//  MeraPICApp.swift
//  MeraPIC
//
//  Created by NhatMinh on 16/12/24.
//

import SwiftUI

@main
struct MeraPICApp: App {
    let viewModel = PhotoListViewModel(photosFetcher: PhotosAPI())
    var body: some Scene {
        WindowGroup {
            //ContentView()
            PhotoListView(viewModel: viewModel)
        }
    }
}
