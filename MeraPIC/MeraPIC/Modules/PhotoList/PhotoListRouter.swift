//
//  PhotoListRouter.swift
//  MeraPIC
//
//  Created by NhatMinh on 23/12/24.
//

import SwiftUI

enum PhotoListRouter {
    static func makePhotoDetailsView(photo: PhotoModel) -> some View {
        let viewModel = PhotoDetailsViewModel(photosFetcher: PhotosAPI(), photo: photo)
        let view = PhotoDetailsView(viewModel: viewModel)
        return view
    }
}
