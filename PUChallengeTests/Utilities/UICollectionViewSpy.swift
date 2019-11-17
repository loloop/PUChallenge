//
//  FakeCollectionView.swift
//  PUChallengeTests
//
//  Created by Mauricio Cardozo on 11/16/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import UIKit

final class UICollectionViewSpy: UICollectionView {

    init() {
        super.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private(set) var didRegisterCell: Bool = false
    private(set) var registeredCellIdentifier: String = ""

    override func register(_ cellClass: AnyClass?, forCellWithReuseIdentifier identifier: String) {
        didRegisterCell = true
        registeredCellIdentifier = identifier
        super.register(cellClass, forCellWithReuseIdentifier: identifier)
    }

    private(set) var didDequeueCell: Bool = false

    override func dequeueReusableCell(withReuseIdentifier identifier: String, for indexPath: IndexPath) -> UICollectionViewCell {
        didDequeueCell = true
        return super.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
    }
}
