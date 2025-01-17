//
//  PhotoCard.swift
//  MeraPIC
//
//  Created by NhatMinh on 23/12/24.
//

import Foundation
import SwiftUI

struct PhotoCard<Model>: View where Model: PhotosListViewModelInterface {
    private var title: String
    private var imageURL: String
    @ObservedObject private var viewModel: Model
    
    init(title: String, imageURL: String, viewModel: Model) {
        self.title = title
        self.imageURL = imageURL
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            Spacer()
            Image(uiImage: (UIImage(data: (viewModel.imageList[imageURL] ?? Data())!) ?? UIImage(named:"img_photo_placeholder"))!)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(title)
                .photoHeaderStyle()
        }.onAppear {
            if viewModel.imageList[imageURL] == nil {
                viewModel.downloadPhoto(imageURL)
            }
        }
    }
}

//struct PhotoCard_Previews: PreviewProvider {
//    static var previews: some View {
//        PhotoCard(title: "Photo Title", imageURL: "https://", viewModel: MockPhotoListViewModel(photosFetcher: PhotosAPI()))
//    }
//}
//
