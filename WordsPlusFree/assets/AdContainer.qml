import bb.cascades 1.0
import bb.cascades.advertisement 1.0

Container {
//    background: Color.Transparent
    preferredWidth: 720
    preferredHeight: 100
//    Container {
//        layout: DockLayout {
//        }
//        background: Color.Transparent
//        horizontalAlignment: HorizontalAlignment.Center
//
//        Banner {
//            //zoneId: 117145 //test ID
//            zoneId: 155255
//            refreshRate: 60
//            preferredWidth: 720
//            preferredHeight: 100
//            transitionsEnabled: true
//            //placeHolderURL: "images/AdBanner.png"
//            horizontalAlignment: HorizontalAlignment.Center
//        }
//    }

    Banner {
        //zoneId: 117145 //test ID
        zoneId: 155255
        refreshRate: 60
        preferredWidth: 720
        preferredHeight: 100
        transitionsEnabled: true
        //placeHolderURL: "images/AdBanner.png"
        horizontalAlignment: HorizontalAlignment.Center
    }

}
