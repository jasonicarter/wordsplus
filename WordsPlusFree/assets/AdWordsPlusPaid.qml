import bb.cascades 1.0

Container {
    background: Color.create("#fafafa")
    preferredWidth: 768
    preferredHeight: 100
    ImageView {
        imageSource: "images/AdBanner.png"
        onTouch: {
            if (event.isUp()) {
                invokeReview.trigger("bb.action.OPEN");
            }
        }
        attachedObjects: [
            Invocation {
                id: invokeReview
                query: InvokeQuery {
                    invokeTargetId: "sys.appworld"
                    uri: "appworld://content/21931881"
                }
            }
        ]
    }

}
