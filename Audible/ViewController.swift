//
//  ViewController.swift
//  Audible
//
//  Created by Mikheil Gotiashvili on 9/23/16.
//  Copyright © 2016 mrGott. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    fileprivate let cellId = "cellId"
    fileprivate let loginCell = "loginCell"
    
    lazy var  collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.dataSource = self
        cv.delegate = self
        cv.isPagingEnabled = true
        cv.backgroundColor = .white
        
        return cv
    }()
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = UIColor.rgb(red: 247, green: 154, blue: 27, alpha: 1)
        pageControl.numberOfPages = self.pages.count + 1
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        
        return pageControl
    }()
    
    lazy var skipButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Skip", for: .normal)
        button.setTitleColor(UIColor.rgb(red: 247, green: 154, blue: 27, alpha: 1), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(skipPages), for: .touchUpInside)
        
        return button
    }()
    
    lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.setTitleColor(UIColor.rgb(red: 247, green: 154, blue: 27, alpha: 1), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        
        return button
    }()
    
    let pages: [PageCellModel] = {
        let pageOne = PageCellModel(imageName: "page1", title: "Share a Great Listen", message: "This is a very awesome application where you can listen to the selected music")
        let pageTwo = PageCellModel(imageName: "page2", title: "Choose your music", message: "Tap the More menu next to any book. Choose \"Send this Book\"")
        let pageThree = PageCellModel(imageName: "page3", title: "Send from the player ", message: "It's free to send your books to the people in your life. Every recipient's first book is on us.")
        
        return [pageOne, pageTwo, pageThree]
    }()
    
    var pageControlBottomAnchor: NSLayoutConstraint?
    var skipButtonTopAnchor: NSLayoutConstraint?
    var nextButtonTopAnchor: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(LoginCell.self, forCellWithReuseIdentifier: loginCell)
        
        view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        view.addSubview(pageControl)
        pageControlBottomAnchor = pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
        pageControlBottomAnchor?.isActive = true
        pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        view.addSubview(skipButton)
        skipButtonTopAnchor = skipButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 16)
        skipButtonTopAnchor?.isActive = true
        skipButton.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        skipButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        skipButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(nextButton)
        nextButtonTopAnchor = nextButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 16)
        nextButtonTopAnchor?.isActive = true
        nextButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        observeKeyboardNotification()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == pages.count {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: loginCell, for: indexPath) as! LoginCell
            
            return cell
        }
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PageCell
        
        let page = pages[indexPath.item]
        cell.page = page
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let currentPage = Int(targetContentOffset.pointee.x / view.frame.width)
        pageControl.currentPage = currentPage
        
        if currentPage == pages.count {
            removeNavigationItemsFromScreen()
        } else {
            pageControlBottomAnchor?.constant = -10
            skipButtonTopAnchor?.constant = 16
            nextButtonTopAnchor?.constant = 16
        }
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: { 
            self.view.layoutIfNeeded()
            }, completion: nil)
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
    
    fileprivate func observeKeyboardNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShown), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide), name: .UIKeyboardWillHide, object: nil)
    }
    
    func keyboardShown(){
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.frame = CGRect(x: 0, y: -40, width: self.view.frame.width, height: self.view.frame.height)
            }, completion: nil)
    }
    
    func keyboardHide(){
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: { 
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
            }, completion: nil)
        
    }
    
    func nextPage(){
        if pageControl.currentPage == pages.count {
            return
        }
        
        if pageControl.currentPage == pages.count - 1 {
            removeNavigationItemsFromScreen()
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.view.layoutIfNeeded()
                }, completion: nil)
        }
        
        let indexPath = IndexPath(item: pageControl.currentPage + 1, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        pageControl.currentPage += 1
    }
    
    func skipPages(){
        pageControl.currentPage = pages.count - 1
        nextPage()
    }
    
    fileprivate func removeNavigationItemsFromScreen(){
        pageControlBottomAnchor?.constant = 40
        skipButtonTopAnchor?.constant = -65
        nextButtonTopAnchor?.constant = -65
    }

}

