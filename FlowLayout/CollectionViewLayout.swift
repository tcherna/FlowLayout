//
//  CollectionViewLayout.swift
//  FlowLayout
//
//  Created by Tim Cherna on 8/14/23.
//

import UIKit

class CollectionViewLayout: UICollectionViewFlowLayout {

	
	let largeSize = 85.0
	let spacing = 13.0
	
	override func prepare() {
		let inset = spacing/2.0

		super.prepare()
		self.itemSize = CGSize(width: largeSize, height: largeSize)
		self.minimumLineSpacing = spacing
		self.sectionInset = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
		self.minimumInteritemSpacing = spacing
		self.sectionInsetReference = .fromContentInset
	}
	
	override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
		let superAttributes = super.layoutAttributesForElements(in: rect) ?? []
		
		var layoutAttributes : [UICollectionViewLayoutAttributes] = []

		for superAttribute in superAttributes {
			
			let attribute : UICollectionViewLayoutAttributes = superAttribute.copy() as! UICollectionViewLayoutAttributes
			
			let smallHeight = 33.0
			let delta = largeSize - smallHeight
			
			if (attribute.indexPath.section == 0) {
				
				attribute.bounds.size.height = smallHeight
				attribute.center.y = attribute.center.y - (delta)*0.5
			
			} else if (attribute.indexPath.section == 1) {
				attribute.center.y = attribute.center.y - (delta)
			} else if (attribute.indexPath.section == 2) {
				attribute.bounds.size.height = smallHeight
				attribute.center.y = attribute.center.y - (delta)*1.5

			} else {
				attribute.center.y = attribute.center.y - (delta)*2.0
			}
			
			layoutAttributes.append(attribute)
		}
		
		return layoutAttributes
	}
	
}
