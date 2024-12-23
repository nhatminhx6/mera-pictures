//
//  PhotoDetailsView.swift
//  MeraPIC
//
//  Created by NhatMinh on 23/12/24.
//

import SwiftUI

struct PhotoDetailsView<Model>: View where Model: PhotoDetailsViewModelInterface {
    @ObservedObject private var viewModel: Model
    init(viewModel: Model) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: HorizontalAlignment.center, spacing: 10.0) {
            ScrollView {
                Image(uiImage: (UIImage(data: (viewModel.imageData ?? Data())!) ?? UIImage(named:"img_photo_placeholder"))!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            Text((viewModel.photoModel.user?.first_name ?? "") + (viewModel.photoModel.user?.last_name ?? ""))
                .h1TitleStyle()
                .shouldHide(viewModel.photoModel.user == nil)
            Text(viewModel.photoModel.user?.bio ?? "")
        }
        .padding()
        .navigationBarTitle(AppConstants.PageTitle.PhotoDetailView)
        .onAppear {
            viewModel.downloadPhoto()
        }
    }
}


