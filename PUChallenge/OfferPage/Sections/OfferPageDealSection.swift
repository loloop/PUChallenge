//
//  OfferPageDealSection.swift
//  PUChallenge
//
//  Created by Mauricio Cardozo on 11/15/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import UIKit
import Common

final class OfferPageDealSection: Section {

    init(cells: [ProductCollectionViewCellViewModel]) {
        self.cells = cells
    }

    let cells: [ProductCollectionViewCellViewModel]

    func numberOfItemsInSection() -> Int {
        cells.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ProductCollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        cell.setupCell(viewModel: cells[indexPath.item])
        return cell
    }

    func register(_ collectionView: UICollectionView) {
        collectionView.register(ProductCollectionViewCell.self)
    }

}
