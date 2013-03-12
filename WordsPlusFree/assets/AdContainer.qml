import bb.cascades 1.0
import bb.cascades.advertisement 1.0

Container {
    background: Color.create("#fafafa")
    preferredWidth: 768
    preferredHeight: 100
    Container {
        layout: DockLayout {
        }
        background: Color.Transparent
        horizontalAlignment: HorizontalAlignment.Center

        ImageView {
            imageSource: "images/AdBanner.png"
        }
        Banner {
            //zoneId: 117145 //test ID
            zoneId: 155255
            refreshRate: 60
            preferredWidth: 720
            preferredHeight: 100
            transitionsEnabled: true
            placeHolderURL: "images/wordsPlus_AdBanner.jpg"
            //backgroudColor: Color.Transparent
            //backgroundColor: Color.Green
            //borderColor: Color.Blue
            //borderWidth: 2
            horizontalAlignment: HorizontalAlignment.Center
            touchPropagationMode: TouchPropagationMode.Full
        }
    }


}
