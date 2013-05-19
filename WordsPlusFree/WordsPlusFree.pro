APP_NAME = WordsPlusFree

CONFIG += qt warn_on cascades10

CONFIG += mobility
MOBILITY += sensors

LIBS += -lbbsystem
LIBS += -lscoreloopcore -lbbsystem
LIBS += -lbbmultimedia
LIBS += -lOpenAL -lalut -lasound
LIBS += -lbbplatformbbm
LIBS += -lbbcascadesadvertisement
LIBS += -lbb -lbbdata -lbbplatform -lbbdevice

include(config.pri)
