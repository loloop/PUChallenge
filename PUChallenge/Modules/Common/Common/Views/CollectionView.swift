//
//  CollectionView.swift
//  Common
//
//  Created by Mauricio Cardozo on 11/15/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import UIKit

public final class CollectionView: UICollectionView {

    private let _dataSource: CollectionViewDataSource

    public init(sections: [Section], layout: UICollectionViewLayout) {
        _dataSource = CollectionViewDataSource(sections: sections)
        super.init(frame: .zero, collectionViewLayout: layout)
        self.dataSource = _dataSource
        sections.forEach { $0.register(self) }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
