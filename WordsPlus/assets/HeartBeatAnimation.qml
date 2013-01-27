import bb.cascades 1.0

SequentialAnimation {
    ScaleTransition {
        toX: 1.2
        toY: 1.2
        duration: 500
    }
    ScaleTransition {
        toX: 1.1
        toY: 1.1
        duration: 250
    }
    ScaleTransition {
        toX: 1.2
        toY: 1.2
        duration: 500
    }
    ScaleTransition {
        toX: 1.0
        toY: 1.0
        duration: 1000
    }
    repeatCount: 5
}
