//
//  Section.swift
//  Common
//
//  Created by Mauricio Cardozo on 11/13/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import UIKit

public protocol Section {
    func numberOfItemsInSection() -> Int
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    func register(_ collectionView: UICollectionView)
}
