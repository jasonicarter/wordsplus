APP_NAME = WordsPlus

CONFIG += qt warn_on cascades10

CONFIG += mobility
MOBILITY += sensors

LIBS += -lbbsystem
LIBS += -lscoreloopcore
LIBS += -lbbmultimedia
LIBS += -lOpenAL -lalut -lasound
LIBS += -lbbplatformbbm
LIBS += -lbb -lbbdata -lbbplatform -lbbdevice

include(config.pri)

device {
    CONFIG(debug, debug|release) {
        # Device-Debug custom configuration
    }

    CONFIG(release, debug|release) {
        # Device-Release custom configuration
    }
}

simulator {
    CONFIG(debug, debug|release) {
        # Simulator-Debug custom configuration
    }
}
