//
//  ViewController.swift
//  Zar Atma Oyunu
//
//  Created by Furkan Sabaz on 25.09.2018.
//  Copyright © 2018 Furkan Sabaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblOyuncu1Skor: UILabel!
    @IBOutlet weak var lblOyuncu2Skor: UILabel!
    @IBOutlet weak var lblOyuncu2Puan: UILabel!
    @IBOutlet weak var lblOyuncu1Puan: UILabel!
    @IBOutlet weak var imgOyuncu1Durum: UIImageView!
    @IBOutlet weak var imgOyuncu2Durum: UIImageView!
    @IBOutlet weak var imgZar1: UIImageView!
    @IBOutlet weak var imgZar2: UIImageView!
    @IBOutlet weak var lblSetSonucu: UILabel!
    
    
    
    var oyuncuPuanlari = (birinciOyuncuPuani : 0 , ikinciOyuncuPuani : 0)
    var oyuncuSkorlari = (birinciOyuncuSkoru : 0, ikinciOyuncuSkoru : 0)
    var oyuncuSira : Int = 1
    
    
    
    var maxSetSayisi  : Int = 5
    var suankiSet : Int = 1
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
       
        
        
        
        
        
        
        if let arkaPlan = UIImage(named: "arkaPlan") {
            self.view.backgroundColor = UIColor(patternImage: arkaPlan)
        }
        
        
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
    
        
        if suankiSet > maxSetSayisi {
            
            return
        }
        
        
        zarDegerleriniUret()
        
    }
    
    func setSonucu(zar1 : Int, zar2 : Int) {
        
        if oyuncuSira == 1 {
            // yeni set başlamıştır
            oyuncuPuanlari.birinciOyuncuPuani = zar1 + zar2
            lblOyuncu1Puan.text = String(oyuncuPuanlari.birinciOyuncuPuani)
            imgOyuncu1Durum.image = UIImage(named: "bekle")
            imgOyuncu2Durum.image = UIImage(named: "onay")
            lblSetSonucu.text = "Sıra 2. Oyuncuda"
            oyuncuSira = 2
            lblOyuncu2Puan.text = "0"
            
        } else {
            
            
            oyuncuPuanlari.ikinciOyuncuPuani = zar1 + zar2
            lblOyuncu2Puan.text = String(oyuncuPuanlari.ikinciOyuncuPuani)
            imgOyuncu1Durum.image = UIImage(named: "onay")
            imgOyuncu2Durum.image = UIImage(named: "bekle")
            oyuncuSira = 1
            //seti bitirme işlemleri
            
            
            
            if oyuncuPuanlari.birinciOyuncuPuani > oyuncuPuanlari.ikinciOyuncuPuani {
                
                //1. oyuncu oyunu kazandı

                oyuncuSkorlari.birinciOyuncuSkoru += 1
                lblSetSonucu.text = "\(suankiSet). Seti 1. Oyuncu Kazandı"
                
                suankiSet += 1
                lblOyuncu1Skor.text = String(oyuncuSkorlari.birinciOyuncuSkoru)
            } else if oyuncuPuanlari.ikinciOyuncuPuani > oyuncuPuanlari.birinciOyuncuPuani {
                
                
                oyuncuSkorlari.ikinciOyuncuSkoru += 1
                lblSetSonucu.text = "\(suankiSet). Seti 2. Oyuncu Kazandı"
                suankiSet += 1
                lblOyuncu2Skor.text = String(oyuncuSkorlari.ikinciOyuncuSkoru)
            } else {
                
                //oyun berabere kaldı
                //set sayısını değiştirilmemeli
                
                lblSetSonucu.text = "\(suankiSet). Set Berabere Sona Erdi."
            }
            
            oyuncuPuanlari.birinciOyuncuPuani = 0
            oyuncuPuanlari.ikinciOyuncuPuani = 0
            
            
        }
        
        
        
        
    }
    func zarDegerleriniUret() {
        
       print("Kod1")
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            let zar1 = arc4random_uniform(6) + 1
            let zar2 = arc4random_uniform(6) + 1
            
            self.imgZar1.image = UIImage(named: String(zar1))
            self.imgZar2.image = UIImage(named: String(zar2))
            
            self.setSonucu(zar1: Int(zar1), zar2: Int(zar2))
            
            
            if self.suankiSet > self.maxSetSayisi {
                
                if self.oyuncuSkorlari.birinciOyuncuSkoru > self.oyuncuSkorlari.ikinciOyuncuSkoru {
                    
                    self.lblSetSonucu.text = "Oyunun Galibi 1. Oyuncu"
                } else {
                    self.lblSetSonucu.text = "Oyunun Galibi 2. Oyuncu"
                }
                
            }
            
            
            
        }
         print("Kod2")
        lblSetSonucu.text = "\(oyuncuSira). Oyuncusu Zar Atıyor"
        imgZar1.image = UIImage(named: "bilinmeyenZar")
        imgZar2.image = UIImage(named: "bilinmeyenZar")
        
        
        
        
        
        
        
        
    }

}

