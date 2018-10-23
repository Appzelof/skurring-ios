//
//  Alerts.swift
//  Skurring
//
//  Created by Marius Fagerhol on 25/02/17.
//  Copyright © 2017 Appzelof. All rights reserved.
//

import UIKit

func HvisRadioenIkkeVilSpilleAv(VC: UIViewController, TittlenPåAlerten: String, BeksjedenPåAlerten: String, PrøvIgjenKnappTittel: String, ikkePrøvIgjenTittel: String, prøvIgjenFunksjon: @escaping () -> Void, DeGidderIkkeÅPrøveIgjenWhatsNextFunksjon: @escaping () -> Void) {
    let controller = UIAlertController.init(title: TittlenPåAlerten, message: BeksjedenPåAlerten, preferredStyle: UIAlertControllerStyle.alert)
    let PrøvIgjen = UIAlertAction.init(title: PrøvIgjenKnappTittel, style: UIAlertActionStyle.default) { (Action) in
        prøvIgjenFunksjon()
    }
    let IkkePrøvIgjen = UIAlertAction.init(title: ikkePrøvIgjenTittel, style: UIAlertActionStyle.default) { (Action) in
        DeGidderIkkeÅPrøveIgjenWhatsNextFunksjon()
    }
    
    controller.addAction(PrøvIgjen)
    controller.addAction(IkkePrøvIgjen)
    VC.present(controller, animated: true, completion: nil)
}

func noLocationFound(VC: UIViewController, okAction: @escaping () -> ()) {
    let controller = UIAlertController.init(title: "Beklager", message: "Ingen steder ble funnet, prøv igjen senere", preferredStyle: UIAlertControllerStyle.alert)
    let action = UIAlertAction.init(title: "Ok", style: UIAlertActionStyle.default) { (ACTION) in
        okAction()
    }
    controller.addAction(action)
    VC.present(controller, animated: true, completion: nil)
}

func callOptions(nødhjelpAction: @escaping () -> (), veihjelpActon: @escaping () -> ()) -> UIAlertController {
    let controller = UIAlertController.init(title: "Hva slags hjelp trenger du?", message: "", preferredStyle: UIAlertControllerStyle.actionSheet)
    let nødhjelp = UIAlertAction.init(title: "Nødhjelp", style: UIAlertActionStyle.default) { (ACTION) in
        nødhjelpAction()
    }
    let veiHjelp = UIAlertAction.init(title: "Veihjelp", style: UIAlertActionStyle.default) { (ACTION) in
        veihjelpActon()
    }
    let cancel = UIAlertAction.init(title: "Avbryt", style: UIAlertActionStyle.destructive, handler: nil)
    controller.addAction(nødhjelp)
    controller.addAction(veiHjelp)
    controller.addAction(cancel)
    return controller
}

func getToCarOptions(walk: @escaping () -> (), drive: @escaping () ->()) -> UIAlertController {
    let controller = UIAlertController.init(title: "Transport", message: "Hvordan ønsker du å komme deg til bilen?", preferredStyle: UIAlertControllerStyle.actionSheet)
    let walk = UIAlertAction.init(title: "Gå", style: UIAlertActionStyle.default) { (ACTION) in
        walk()
    }
    let drive = UIAlertAction.init(title: "Kjøre", style: UIAlertActionStyle.default) { (ACTION) in
        drive()
    }
    let cancel = UIAlertAction.init(title: "Avbryt", style: UIAlertActionStyle.destructive, handler: nil)
    controller.addAction(walk)
    controller.addAction(drive)
    controller.addAction(cancel)
    return controller
}

func tooManyTraficRequests() -> UIAlertController {
    let controller = UIAlertController.init(title: "Ops!", message: "Kunne dessverre ikke hente inn trafikkmeldinger, vennligst prøv igjen senere", preferredStyle: UIAlertControllerStyle.alert)
    let action = UIAlertAction.init(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
    controller.addAction(action)
    return controller
}

func presentAnnotationInformation(title: String, subTitle: String, deselectAnnotation: @escaping () -> ()) -> UIAlertController {
    let controller = UIAlertController.init(title: title, message: subTitle, preferredStyle: UIAlertControllerStyle.alert)
    let action = UIAlertAction.init(title: "Ok", style: .default) { (action) in
        deselectAnnotation()
    }
    controller.addAction(action)
    return controller
}
