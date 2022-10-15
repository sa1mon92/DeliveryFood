//
//  MenuViewController.swift
//  DeliveryFood
//
//  Created by Дмитрий Садырев on 15.10.2022.
//

import UIKit

protocol MenuViewProtocol: AnyObject {
    func reloadData()
    func showFailure(error: Error)
}

class MenuViewController: UIViewController {
    
    @IBOutlet weak var cityButton: UIButton!
    @IBOutlet weak var topSalesCollectionView: UICollectionView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var mealsTableView: UITableView!
    
    @IBOutlet weak var topSalesCollectionViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var topSalesCollectionViewHeightConstraint: NSLayoutConstraint!
    
    var presenter: MenuViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.getData()
        setupCityButton()
        setupTopSalesCollectionView()
        setupCategoryCollectionView()
        setupMealsTableView()
    }
    
    private func setupCityButton() {
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: "chevron.down")
        config.imagePadding = 8
        config.imagePlacement = .trailing
        config.baseForegroundColor = UIColor.black
        config.preferredSymbolConfigurationForImage
          = UIImage.SymbolConfiguration(scale: .medium)
        config.title = presenter.currentCity
        config.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
          var outgoing = incoming
            outgoing.font = UIFont.systemFont(ofSize: 17)
          return outgoing
        }
        cityButton.configuration = config
    }
    
    private func setupTopSalesCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 16
        topSalesCollectionView.collectionViewLayout = layout
        topSalesCollectionView.register(UINib(nibName: "TopSaleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TopSaleCollectionViewCell")
    }
    
    private func setupCategoryCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 8
        categoryCollectionView.collectionViewLayout = layout
        categoryCollectionView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionViewCell")
    }
    
    private func setupMealsTableView() {
        mealsTableView.clipsToBounds = true
        mealsTableView.layer.cornerRadius = 20
        mealsTableView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        mealsTableView.register(UINib(nibName: "MealsTableViewCell", bundle: nil), forCellReuseIdentifier: "MealsTableViewCell")
    }
    
    @IBAction func tapCityButton(_ sender: UIButton) {
        presenter.tapOnTheCityButton()
    }

}

// MARK: - UICollectionViewDataSource
extension MenuViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == topSalesCollectionView {
            return presenter.model?.topSales.count ?? 0
        } else if collectionView == categoryCollectionView {
            return Constants.categories.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == topSalesCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopSaleCollectionViewCell", for: indexPath) as! TopSaleCollectionViewCell
            if let model = presenter.model?.topSales[indexPath.row] {
                cell.setup(model: model)
                let realCenter = collectionView.convert(cell.center, to: collectionView.superview)
                cell.setOpacity(xPosition: realCenter.x, cellWidth: Constants.topSaleCellSize.width)
            }
            return cell
        } else if collectionView == categoryCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
            let categoryName = Constants.categories[indexPath.row]
            cell.setLabel(categoryName)
            if presenter.currentCategoryIndex == indexPath.row {
                cell.setSelectedStyle(isSelected: true)
            } else {
                cell.setSelectedStyle(isSelected: false)
            }
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
}

// MARK: - UICollectionViewDelegate
extension MenuViewController: UICollectionViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == topSalesCollectionView {
            topSalesCollectionView.reloadData()
        } else if scrollView == mealsTableView {
            let alpha = (100.0 - min(100.0, scrollView.contentOffset.y)) / 100.0
            topSalesCollectionView.alpha = (100.0 - min(100.0, scrollView.contentOffset.y)) / 100.0
            mealsTableView.layer.cornerRadius = 20 * alpha
            topSalesCollectionViewTopConstraint.constant = 24 * alpha
            topSalesCollectionViewHeightConstraint.constant = 112 * alpha
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            presenter.categoryDidSelected(index: indexPath.row)
        } else if collectionView == topSalesCollectionView {
            if let model = presenter.model?.topSales[indexPath.row] {
                presenter.topSaleDidSelected(model: model)
            }
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension MenuViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == topSalesCollectionView {
            return Constants.topSaleCellSize
        } else if collectionView == categoryCollectionView {
            return Constants.categoryCellSize
        } else {
            return CGSize.zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
    }
}

// MARK: - UITableViewDelegate
extension MenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 172
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let model = presenter.model?.meals[indexPath.row] {
            presenter.mealDidSelected(model: model)
        }
    }
}

// MARK: - UITableViewDataSource
extension MenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.meals?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealsTableViewCell", for: indexPath) as! MealsTableViewCell
        if let model = presenter.meals?[indexPath.row] {
            cell.setup(model: model)
        }
        return cell
    }
}

extension MenuViewController: MenuViewProtocol {
    func reloadData() {
        topSalesCollectionView.reloadData()
        categoryCollectionView.reloadData()
        mealsTableView.reloadData()
    }
    
    func showFailure(error: Error) {
        //
    }
}
